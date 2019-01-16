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
 */

include ("config.php");

?>

<strong>OMACS is installed succesfully! Congtratulations!</strong><br><br>
OMACS has the possibility to mail the users their initial password and makes it possible to send a password reset in case of a forgotten password. For this the mail() function in php must be working properly. If you do not want this now you can set this later in the UserSpice dashboard, click <a href="../index.php">HERE</a>.<br><br>

<strong>Email settings</strong><br>
<form action="" method="post">

	<input type="hidden" required name="dbh" value="<?php if(!empty($_POST['dbh'])){print $_POST['dbh'];} ?>">
	<input type="hidden" required name="dbu" value="<?php if(!empty($_POST['dbu'])){print $_POST['dbu'];} ?>">
	<input type="hidden" name="dbp" value="<?php if(!empty($_POST['dbp'])){print $_POST['dbp'];} ?>">
	<input type="hidden" required name="dbn" value="<?php if(!empty($_POST['dbn'])){print $_POST['dbn'];} ?>">

		<input type="hidden" name="website_name" value="OMACS">
		SMTP server: <input type="text" name="smtp_server" value="smtp.gmail.com"><br>
		SMTP port: <input type="25" name="smtp_port" value="25"><br>
		Email username: <input type="text" name="email_login"><br>
		Email password: <input type="text" name="email_pass"><br>
		From name: <input type="text" name="from_name" value="OMACS"><br>
		From email: <input type="text" name="from_email" value=""><br>
		Transport type: <select name="transport">
			<option value="tls">TLS (encrypted)</option>
			<option value="ssl">SSL (encrypted, but weak)</option>
		</select><br>
		<input type="hidden" name="debug_level" value="0">
		<input type="hidden" name="isSMTP" value="1">
		Use SMTP authentication: <select name="useSMTPauth">
			<option value="false">No</option>
			<option value="true">Yes</option>
		</select><br>
		<input type="hidden" name="isHTML" value="true">
		<input type="hidden" name="email_act" value="1"</input>
		Root of install of OMACS: <input type="text" name="root"><br>
	<input type="submit" value="Set email settings" name="setEmail">
</form>

<?php

if(!empty($_POST['setEmail'])){

	// prepare database
	$dbh=$_POST['dbh'];
	$dbu=$_POST['dbu'];
	$dbp=$_POST['dbp'];
	$dbn=$_POST['dbn'];
	$link = mysqli_connect($dbh, $dbu, $dbp, $dbn);
	if(!$link) {
		echo "Error: Unable to connect to MySQL." . PHP_EOL;
		echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
		echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
		exit;
	}

	// Update mail configuration
	mysqli_query($link, "UPDATE email SET website_name = '".$_POST['website_name']."' WHERE (id = 1)");
	mysqli_query($link, "UPDATE email SET smtp_server = '".$_POST['smtp_server']."' WHERE (id = 1)");
	mysqli_query($link, "UPDATE email SET smtp_port = '".$_POST['smtp_port']."' WHERE (id = 1)");
	mysqli_query($link, "UPDATE email SET email_login = '".$_POST['email_login']."' WHERE (id = 1)");
	mysqli_query($link, "UPDATE email SET email_pass = '".$_POST['email_pass']."' WHERE (id = 1)");
	mysqli_query($link, "UPDATE email SET from_name = '".$_POST['from_name']."' WHERE (id = 1)");
	mysqli_query($link, "UPDATE email SET from_email = '".$_POST['from_email']."' WHERE (id = 1)");
	mysqli_query($link, "UPDATE email SET transport = '".$_POST['transport']."' WHERE (id = 1)");
	mysqli_query($link, "UPDATE email SET verify_url = '".$_POST['root']."' WHERE (id = 1)");
	mysqli_query($link, "UPDATE email SET debug_level = '".$_POST['debug_level']."' WHERE (id = 1)");
	mysqli_query($link, "UPDATE email SET isSMTP = '".$_POST['isSMTP']."' WHERE (id = 1)");
	mysqli_query($link, "UPDATE email SET isHTML = '".$_POST['isHTML']."' WHERE (id = 1)");
	mysqli_query($link, "UPDATE email SET useSMTPauth = '".$_POST['useSMTPauth']."' WHERE (id = 1)");
	mysqli_query($link, "UPDATE email SET email_act = '".$_POST['email_act']."' WHERE (id = 1)");
	echo "Email settings succesfully updated. These can always be altered on the UserSpice dashboard.<br>";
?><a href="../index.php">Home page</a><?php
}

?>
