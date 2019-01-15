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

<div class="card mt-1">
	<div class="card-header">Account information</div>
	<div class="card-body">
		<?php
			$get_info_id = $user->data()->id;
			$raw = date_parse($user->data()->join_date);
			$signupdate = $raw['month']."/".$raw['day']."/".$raw['year'];
			$userdetails = fetchUserDetails(NULL, NULL, $get_info_id); //Fetch user details
		?>
			<div id="page-wrapper">
				<div class="container">
					<h1><?=echousername($user->data()->id)?></h1>
					<p><?=ucfirst($user->data()->fname)." ".ucfirst($user->data()->lname)?></p>
					<p>Member Since: <?=$signupdate?></p>
					<p>Number of Logins: <?=$user->data()->logins?></p>
					<p><a href="<?=$VIEWNABASE?>profile_settings" class="btn btn-primary">Edit Account Info</a></p>
				</div>
			</div>
	</div>
</div>
