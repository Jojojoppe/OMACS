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
	<div class="card-header">Forgotten password</div>
	<div class="card-body">

<?php 

if(ipCheckBan()){Redirect::to($us_url_root.'usersc/scripts/banned.php');die();}
$error_message = null;
$errors = array();
$email_sent=FALSE;

$token = Input::get('csrf');
if(Input::exists()){
    if(!Token::check($token)){
        include($abs_us_root.$us_url_root.'usersc/scripts/token_error.php');
    }
}

if (Input::get('forgotten_password')) {
    $email = Input::get('email');
    $fuser = new User($email);
    //validate the form
    $validate = new Validate();
    $validation = $validate->check($_POST,array('email' => array('display' => 'Email','valid_email' => true,'required' => true,),));

    if($validation->passed()){
        if($fuser->exists()){
          $vericode=randomstring(15);
          $vericode_expiry=date("Y-m-d H:i:s",strtotime("+$settings->reset_vericode_expiry minutes",strtotime(date("Y-m-d H:i:s"))));
          $db->update('users',$fuser->data()->id,['vericode' => $vericode,'vericode_expiry' => $vericode_expiry]);
            //send the email
            $options = array(
              'fname' => $fuser->data()->fname,
              'email' => rawurlencode($email),
              'vericode' => $vericode,
              'reset_vericode_expiry' => $settings->reset_vericode_expiry
            );
            $subject = 'Password Reset';
            $encoded_email=rawurlencode($email);
            $body =  email_body('../../email_templates/forgot_password.php',$options);
            $email_sent=email($email,$subject,$body);
            logger($fuser->data()->id,"User","Requested password reset.");
            if(!$email_sent){
                $errors[] = 'Email NOT sent due to error. Please contact site administrator.';
            }
        }else{
            $errors[] = 'That email does not exist in our database';
        }
    }else{
        //display the errors
        $errors = $validation->errors();
    }
}
?>
<?php
if ($user->isLoggedIn()) $user->logout();
?>

<div id="page-wrapper">
<div class="container">
<?php

if($email_sent){
?>
				<div class="row">
				<div class="col-xs-12">
				<p>Your password reset link has been sent to your email address.</p>
				<p>Click the link in the email to Reset your password. Be sure to check your spam folder if the email isn't in your inbox.</p>
				<p>Reset links are only valid for <?=$settings->reset_vericode_expiry?> minutes.</p>
				<br />
				</div><!-- /.col -->
				</div><!-- /.row -->
<?php
}else{
?>
				<div class="row">
				<div class="col-xs-12">
				<ol>
					<li>Enter your email address and click Reset</li>
					<li>Check your email and click the link that is sent to you.</li>
					<li>Follow the on screen instructions</li>
				</ol>
				<?php if(!$errors=='') {?><div class="alert alert-danger"><?=display_errors($errors);?></div><?php } ?>
				<form action="" method="post" class="form ">
					
					<div class="form-group">
						<label for="email">Email</label>
						<input type="text" name="email" placeholder="Email Address" class="form-control" autofocus>
					</div>

					<input type="hidden" name="csrf" value="<?=Token::generate();?>">
					<p><input type="submit" name="forgotten_password" value="Reset" class="btn btn-primary"></p>
				</form>

				</div><!-- /.col -->
				</div><!-- /.row -->
<?php
}
?>
</div><!-- /.container-fluid -->
</div><!-- /#page-wrapper -->
	</div>
</div>
