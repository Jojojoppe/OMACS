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
	<div class="card-header">Login</div>
	<div class="card-body">

<?php

$settingsQ = $db->query("SELECT * FROM settings");
$settings = $settingsQ->first();
$error_message = '';
if (@$_REQUEST['err'])
	$error_message = $_REQUEST['err']; // allow redirects to display a message

if($user->isLoggedIn()){
?>
	<a href="users/logout.php">Logout</a>
<?php
}else{

if (Input::exists()) {
	$token = Input::get('csrf');
	if(!Token::check($token)){
		include($abs_us_root.$us_url_root.'usersc/scripts/token_error.php');
	}

	$validate = new Validate();
	$validation = $validate->check($_POST, array(
		'username' => array('display' => 'Username','required' => true),
		'password' => array('display' => 'Password', 'required' => true)));

	if ($validation->passed()) {
		//Log user in
		$remember = (Input::get('remember') === 'on') ? true : false;
		$user = new User();
		$login = $user->loginEmail(Input::get('username'), trim(Input::get('password')), $remember);
		if ($login) {
			$dest = sanitizedDest('dest');
			$twoQ = $db->query("select twoKey from users where id = ? and twoEnabled = 1",[$user->data()->id]);
			if($twoQ->count()>0) {
				$_SESSION['twofa']=1;
				if(!empty($dest)) {
					$page=encodeURIComponent(Input::get('redirect'));
					logger($user->data()->id,"Two FA","Two FA being requested.");
					Redirect::to($us_url_root.'users/twofa.php?dest='.$dest.'&redirect='.$page);
				} else
					Redirect::To($us_url_root.'users/twofa.php');
			} else {
				Redirect::To("index.php");
			}
		} else {
			$error_message .= '<strong>Login failed</strong>. Please check your username and password and try again.';
		}
	} else{
		$error_message .= '<ul>';
		foreach ($validation->errors() as $error) {
			$error_message .= '<li>' . $error[0] . '</li>';
		}
		$error_message .= '</ul>';
	}
}
if (empty($dest = sanitizedDest('dest'))) {
	$dest = '';
}

?>

<div class="container login-form-div">
	<div class="row">
		<div class="col-xs-12">
			<?php if(!$error_message=='') {?><div class="alert alert-danger"><?=$error_message;?></div><?php } ?>
			<form name="login" id="login-form" class="form-signin" action="" method="post">
				<input type="hidden" name="dest" value="<?= $dest ?>" />

				<div class="form-group">
					<input	class="form-control" type="text" name="username" id="username" placeholder="Username/Email" required autofocus>
				</div>

				<div class="form-group">
					<input type="password" class="form-control"  name="password" id="password"	placeholder="Password" required autocomplete="off">
				</div>

				<div class="form-group">
					<label for="remember">
					<input type="checkbox" name="remember" id="remember" > Remember Me</label>
				</div>

				<input type="hidden" name="csrf" value="<?=Token::generate(); ?>">
				<input type="hidden" name="redirect" value="<?=Input::get('redirect')?>" />
				<button class="submit  btn	btn-primary" id="next_button" type="submit"><i class="fa fa-sign-in"></i> <?=lang("SIGNIN_BUTTONTEXT","");?></button>

			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6"><br>
		<a class="pull-left" href='<?=$VIEWNABASE?>forgot_password'><i class="fa fa-wrench"></i> Forgot Password</a><br><br>
		</div>
	</div>
</div>

<?php } ?>

	</div>
</div>
