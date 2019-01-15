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

// TODO run userspice installer (copy code) and then run own installer
// Maybe change basic database (or change afterwards)
// OMACS installer itself must make new table (omacs) and add base64 encoded JSON objects for menu and pages
// Furthermore it must set the options in userspice as it workds for OMACS
// An email account must be setup for OMACS to send emails: how to do that

include ("config.php");
?>

<h2><strong>Installing OMACS</strong></h2>
<p>This program will walk you through the entire process of configuring OMACS. Before you proceed, you might want to make sure that you're ready to make the install.</p>
<p>If you have not already created a new database, please do so at this time. Make sure that you have the host name, username, password and database name handy, as you will need them to complete the install.</p>

<h3><strong>System requirement check</strong></h3>
<?php
if(version_compare(phpversion(), $php_ver, "<")){
	// PHP version is not high enough
?>
<p>We're sorry, but your PHP version is out of date.  Please update to PHP <?=$php_ver?> or later to continue.
<a href='http://php.net/' target='_blank'>PHP Website</a></p>
<?php
}else{
	$errors = 0;
?>
<p>Your PHP version meets the minimum system requirements of <?=$php_ver?> or later, but you need to make sure your system meets all the rest of the requirements. If you see any red in the table below, please correct those issues before installing.  <br><br>

<table width="100%">
	<tr>
		<td width="50%">PHP version >= <?=$php_ver?></td>
		<td width="50%">
			<?php if (phpversion() < $php_ver) { ?>
				<strong><font color="red">No</font></strong><?php
				$errors = 1;
			} else { ?>
				<strong><font color="green">Yes</font></strong>
			<?php }; ?>
		</td>
	</tr>
	<tr>
		<td>XML support</td>
		<td>
			<?php if (extension_loaded('xml')) { ?>
				<strong><font color="green">Available</font></strong>
			<?php } else { ?>
				<strong><font color="red">Unavailable</font></strong>
				<?php $errors = 1;
			}; ?>
		</td>
	</tr>
	<tr>
		<td>MySQLi support</td>
		<td>
			<?php if (function_exists( 'mysqli_connect' )) { ?>
				<strong><font color="green">Available</font></strong>
			<?php } else { ?>
				<strong><font color="red">Unavailable</font></strong>
				<?php $errors = 1;
			}; ?>
		</td>
	</tr>
	<tr>
		<td>PDO support</td>
		<td>
			<?php if (class_exists('PDO')) { ?>
				<strong><font color="green">Available</font></strong>
			<?php } else { ?>
				<strong><font color="red">Unavailable</font></strong>
				<?php $errors = 1;
			}; ?>
		</td>
	</tr>
	<tr>
		<td> Is <?=$config_file?>, the UserSpice configuration file, writeable?</td>
		<td>
			<?php clearstatcache();
			if (@file_exists($config_file) &&  @is_writable( $config_file )){
				echo '<strong><font color="green">Writeable</font></strong>';
			} else {
				$errors = 1; ?>
				<strong><font color="red">Unwriteable<br />
				</font> It is really important that you be able to write to the init file! If you don't know how to chmod your init file, <a href="http://www.userspice.com/installation-issues/">please read this guide at UserSpice.com.</a>. If the file does not exists create an ampty file.
				</strong>
			<?php } ?>
		</td>
	</tr>
	<tr>
		<td> Is settings/settings.css, the OMACS color configuration file, writeable?</td>
		<td>
			<?php clearstatcache();
			if (@file_exists("../settings/settings.css") &&  @is_writable("../settings/settings.css")){
				echo '<strong><font color="green">Writeable</font></strong>';
			} else {
				$errors = 1; ?>
				<strong><font color="red">Unwriteable<br />
			<?php } ?>
		</td>
	</tr>
</table>

<h3><strong>Additional Recommended Settings</h3></strong>
<p>OMACS will probably work regardless of the settings below, however these settings are suggested.</p>

<table width="100%">
	<tr>
		<td width="50%"><strong>Setting</strong></td>
		<td class="25%"><strong>Recommended</strong></td>
		<td class="25%"><strong>Actual</strong></td>
	</tr>

<?php
$php_recommended_settings = array(
	array ('Safe Mode','safe_mode','OFF'),
	array ('Display Errors','display_errors','ON'),
	array ('File Uploads','file_uploads','ON'),
	array ('Register Globals','register_globals','OFF'),
	array ('Output Buffering','output_buffering','OFF'),
	array ('Session Auto Start','session.auto_start','OFF'),
);

	foreach ($php_recommended_settings as $phprec) { ?>
	<tr>
		<td><?=$phprec[0]; ?>:</td>
		<td><?=$phprec[2]; ?>:</td>
		<td><strong>
			<?php if ( get_php_setting($phprec[1]) == $phprec[2] ) { ?>
				<font color="green">
			<?php } else { ?>
				<font color="red">
			<?php }
				echo get_php_setting($phprec[1]); ?>
			</font></strong>
		<td>
	</tr>
	<?php } ?>
</table>

<?php }
function get_php_setting($val) {
	$r =  (ini_get($val) == '1' ? 1 : 0);
	return $r ? 'ON' : 'OFF';
} ?>

<h3><strong>Installing</strong></h3>
<?php if($errors==0){ ?>
	By clicking continue, you are stating that you agree with the terms of the licence.<br>
	<a href="install_step2.php">Continue >></a>
<?php }else{ ?>
	<font color="red"><strong></strong>You have errors listed in the System Requirement Check that must be corrected before continuing. If you have an unwritable <?=$config_file?>, it is suggested that you chmod that file to 666 for installation and then chmod it to 644 after installation. <a href="http://www.userspice.com/installation-issues/">please read this guide</a></font>
<?php } ?>
