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

OMACS, Online Member And Committee System, is an online platform where logged in users can acces pages and manage them.<br><br>

<?php
	echo "<i>Version:</i> ". file_get_contents("ver")."<br>";
	echo "<i>Last change:</i> ". date("F d Y H:i:s.", filemtime("ver"))."<br>";
	echo "<i>UserSpice version:</i> ";
	include "users/includes/user_spice_ver.php";
	echo $user_spice_ver;
?>
