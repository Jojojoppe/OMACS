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
	<div class="card-header">Installed cards</div>
	<div class="card-body">
		<div class="card-text">
			<ul class="list-group">

<?php

// When action is requiered
if(isset($_GET['action'])){
	$error = false;
	$errormsg = "";
	// If card gets deleted
	if($_GET['action'] == "delete"){
		unlink("cards/".$_GET['key'].".php");
	// If card is added
	}elseif($_GET['action'] == "add"){
		if(file_exists("cards/".$_FILES['file']['name'])){
			$error = true;
			$errormsg = "Card already exists";
		}else{
			if($_FILES['file']['size']>500000){
				$error = true;
				$errormsg = "File too big";
			}else{
				$ext = strtolower(pathinfo("cards/".$_FILES['file']['name'],PATHINFO_EXTENSION));
				if($ext != "php"){
					$error = true;
					$errormsg = "File is not a php file";
				}else{
					// file correctly uploaded
					move_uploaded_file($_FILES['file']['tmp_name'], "cards/".$_FILES['file']['name']);
				}
			}
		}
	}
	if(!$error)
		Redirect::to($us_url_root.$VIEWNABASE."cards");
	else{
		echo "<p>$errormsg</p>";
	}
}

// Get list of all card classes
$cards = array();
foreach(get_declared_classes() as $c){
	$names = explode("\\", $c);
	if($names[0] == "CARDS" && sizeof($names)==2)
		array_push($cards, $names[1]);
}

// Loop through all card classes
foreach($cards as $card){
	$cname = "CARDS\\".$card;
?>
				<li class="list-group-item list-group-item-action" data-toggle="collapse" href="#collapse<?=$card?>"
				role="button" aria-expanded="false" aria-controls="collapse<?=$card?>">
					<?=$card?> <i>(API <?=$cname::API_VER?>)</i></li>
				<div class="collapse" id="collapse<?=$card?>">
<?php
	$c = new $cname(0);
	vardump($c);
?>
				</div>
<?php
}

?>
			</ul><br>

			<form action="<?=$us_url_root.$VIEWNABASE?>cards&action=add" method="post" enctype="multipart/form-data">
				<input type="file" name="file" id="file" hidden>
				<button type="button" class="btn btn-secondary" onclick="document.getElementById('file').click();">choose file</button>
				<button type="submit" class="btn btn-primary">Add card</button>
			</form>
			<i>note: When uploading a card file you must be sure it is a card file in the good format! Things can go horribly wrong if something is uploaded which should not have been uploaded or has substancial errors in it.</i>

		</div>
	</div>
</div>
