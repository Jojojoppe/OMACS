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

<?php
$db = DB::getInstance();
$query = $db->query("SELECT * FROM email");
$results = $query->first();
?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <p>Hello <?=$fname;?>,</p>
	<p>An Administrator of <?=$sitename?> has issued you an account. <?php if($force_pr == 0) {?>Please <a href="<?=$results->verify_url?>?viewna=login" class="nounderline">click here</a> to login.<?php } ?></p>
	<p><label>Username:</label> <?=$username?></p>
    <p><label>Password:</label> <?php if($force_pr == 1) {?><a href="<?php echo $results->verify_url."?viewna=password_reset&email=".$email."&vericode=$vericode&reset=1"; ?>" class="nounderline">Set Password</a><?php } else { ?><?=$password?><?php } ?></p>
	<p><?php if($force_pr == 1) {?>You will be required to set your password using the link above.<?php } else { ?>It is recommended to change your password upon logging in.<?php } ?></p>
	<p>See you soon!</p>
	<sup><p>Please note, Verification links expire in <?=$join_vericode_expiry?> hours.</p></sup>
  </body>
</html>
