<?php /*
OMACS - The online member and committee system
Copyright (C) 2018 - Joppe Blondel

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/ ?>

<?php if(!isset($PREVENTDIRECTACCES)){
	include("403.php");
	die;
}?>

<div class="card mt-2">
	<div class="card-header">Reset password</div>
	<div class="card-body">

		<?php

		if ($user->isLoggedIn()) $user->logout();
		if(ipCheckBan()){Redirect::to($us_url_root.'usersc/scripts/banned.php');die();}
		$error_message = null;
		$errors = array();
		$reset_password_success=FALSE;
		$password_change_form=FALSE;


		$token = Input::get('csrf');
		if(Input::exists()){
			if(!Token::check($token)){
				include($abs_us_root.$us_url_root.'usersc/scripts/token_error.php');
			}
		}

		if(Input::get('reset') == 1){ //$_GET['reset'] is set when clicking the link in the password reset email.

			//display the reset form.
			$email = Input::get('email');
			$vericode = Input::get('vericode');
			$ruser = new User($email);
			if (Input::get('resetPassword')) {

				$validate = new Validate();
				$validation = $validate->check($_POST,array(
				'password' => array(
				  'display' => 'New Password',
				  'required' => true,
				  'min' => 6,
				),
				'confirm' => array(
				  'display' => 'Confirm Password',
				  'required' => true,
				  'matches' => 'password',
				),
				));
				if($validation->passed()){
					if($ruser->data()->vericode != $vericode || (strtotime($ruser->data()->vericode_expiry) - strtotime(date("Y-m-d H:i:s")) <= 0)){
						Redirect::to($us_url_root.'?'.$VIEWNABASE.'forgot_password_reset&err=Something+went+wrong.+Please+try+again.');
					}
					//update password
					$ruser->update(array(
					  'password' => password_hash(Input::get('password'), PASSWORD_BCRYPT, array('cost' => 12)),
					  'vericode' => randomstring(15),
						'vericode_expiry' => date("Y-m-d H:i:s"),
						'email_verified' => true,
						'force_pr' => 0,
					),$ruser->data()->id);
					$reset_password_success=TRUE;
					logger($ruser->data()->id,"User","Reset password.");
					if($settings->session_manager==1) {
						$passwordResetKillSessions=passwordResetKillSessions();
						if(is_numeric($passwordResetKillSessions)) {
							if($passwordResetKillSessions==1) $successes[] = "Successfully Killed 1 Session";
							if($passwordResetKillSessions >1) $successes[] = "Successfully Killed $passwordResetKillSessions Session";
						} else {
							$errors[] = "Failed to kill active sessions, Error: ".$passwordResetKillSessions;
						}
					}
				}else{
					$reset_password_success=FALSE;
					$errors = $validation->errors();
				}
			}
			if ($ruser->exists() && $ruser->data()->vericode == $vericode) {
				//if the user email is in DB and verification code is correct, show the form
				$password_change_form=TRUE;
			}
		}

		?>

		<div id="page-wrapper">
		<div class="container">

		<?php
		if ((Input::get('reset') == 1)){
			if($reset_password_success){
?>
<div class="row">
<div class="col-xs-12">
<h2>Your password has been reset!</h2>
<p><a href="<?=$VIEWNABASE?>login" class="btn btn-primary">Login</a></p>
<br />
</div><!-- /.col -->
</div><!-- /.row -->
<?php
			}elseif((!Input::get('resetPassword') || !$reset_password_success) && $password_change_form){
?>
<div class="row">
<div class="col-xs-12">
	<h2 class="text-center">Hello <?=$ruser->data()->fname;?>,</h2>
	<p class="text-center">Please reset your password.</p>
	<form action="<?=$VIEWNABASE?>password_reset&reset=1" method="post">
		<?php if(!$errors=='') {?><div class="alert alert-danger"><?php echo $errors[0][0]?></div><?php } ?>
		<div class="form-group">
			<label for="password">New Password:</label>
			<input type="password" name="password" value="" id="password" class="form-control">
		</div>
		<div class="form-group">
			<label for="confirm">Confirm Password:</label>
			<input type="password" name="confirm" value="" id="confirm" class="form-control">
		</div>
		<input type="hidden" name="csrf" value="<?=Token::generate();?>">
		<input type="hidden" name="email" value="<?=$email;?>">
		<input type="hidden" name="vericode" value="<?=$vericode;?>">
		<input type="submit" name="resetPassword" value="Reset" class="btn btn-primary">
	</form>
<br />
</div><!-- /.col -->
</div><!-- /.row -->
<?php
			}else{
?>
<div class="row">
<div class="col-xs-12">
<h2>Oops...something went wrong, maybe an old reset link you clicked on. Click below to try again</h2>
<p><a href="<?=$VIEWNABASE?>forgot_password" class="btn btn-primary">Reset Password</a></p>
<br />
</div><!-- /.col -->
</div><!-- /.row -->
<?php
			}
		}else{
?>
<div class="row">
<div class="col-xs-12">
<h2>Oops...something went wrong, maybe an old reset link you clicked on. Click below to try again</h2>
<p><a href="<?=$VIEWNABASE?>forgot_password" class="btn btn-primary">Reset Password</a></p>
<br />
</div><!-- /.col -->
</div><!-- /.row -->
<?php
		}
		?>

		</div><!-- /.container-fluid -->
		</div><!-- /#page-wrapper -->
	</div>
</div>
