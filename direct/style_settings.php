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

<?php
if(isset($_POST["base"]) && $_POST['base'] == "color"){
	unset($_POST['base']);
	settings_save("css", $_POST);
	?><meta http-equiv="refresh" content="0;URL='#'"><?php
}
?>

<div class="card mt-2">
	<div class="card-header">Color settings</div>
	<div class="card-body">
		<div class="card-text">

			<form action="" method="post">
				<input type="hidden" name="base" value="color">
<?php
foreach($set_css as $key=>$value){
	echo($key.":");
	echo("<input type='text' class='form-control jscolor {hash:true}' value='".$value."' name='".$key."'><br>");
}
?>
				<button type="submit" class="btn btn-default">Edit setings</button>
			</form>

		</div>
	</div>
</div>

