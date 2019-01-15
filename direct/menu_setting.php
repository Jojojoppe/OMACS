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
	<div class="card-header">Menu item edit</div>
	<div class="card-body">

<?php
	$permissionData = fetchAllPermissions(); //Retrieve list of all permission levels

	$type = $_GET["type"];		// Get type of action: add or edit item or submenu item

	$fill = false;
	if($_GET["action"]=="edit"){
		$fill = true;
		$menuitem = $set_menu[$_GET['key']];
	}

	// If action is on a submenu, get into submenu
	if($type=="sub_edit")
		$menuitem = $menuitem['target'][$_GET['subkey']];

	if(isset($_POST["title"])){

		$error = false;
		$errormsg = "";

		if(isset($_POST['delete'])){
			if($type=="item_edit")
				unset($set_menu[$_GET['key']]);
			else
				unset($set_menu[$_GET['key']]['target'][$_GET['subkey']]);
				// Move up or down
		}elseif(isset($_POST['up'])){
			echo "move up<br>";
			if($_GET['type']=="item_edit"){
				$index = array_search($_GET['key'], $set_menu_keys);
				array_move($set_menu, $index, true);
			}else{
				$index = array_search($_GET['subkey'], array_keys($set_menu[$_GET['key']]['target']));
				array_move($set_menu[$_GET['key']]['target'], $index, true);
			}
		}elseif(isset($_POST['down'])){
			if($_GET['type']=="item_edit"){
				$index = array_search($_GET['key'], $set_menu_keys);
				array_move($set_menu, $index, false);
			}else{
				$index = array_search($_GET['subkey'], array_keys($set_menu[$_GET['key']]['target']));
				array_move($set_menu[$_GET['key']]['target'], $index, false);
			}
		}else{

			if($type=="item_edit"){
				$set_menu[$_GET['key']]["title"] = $_POST["title"];
				$set_menu[$_GET['key']]["type"] = $_POST["type"];
				if($_POST['type']=="intern")
					$set_menu[$_GET['key']]["target"] = $_POST["targetIntern"];
				if($_POST['type']=="extern")
					$set_menu[$_GET['key']]["target"] = $_POST["targetExtern"];
				if($_POST['type']=="sub" && $menuitem['type']!=$_POST['type'])
					$set_menu[$_GET['key']]["target"] = array();

				if(isset($_POST['login']))
					$set_menu[$_GET['key']]['login'] = True;
				else
					$set_menu[$_GET['key']]['login'] = False;
				$name = $_GET['key'];
				if(isset($_POST["edit"]))
					$set_menu[$name]["can_edit"] = array_merge($_POST["edit"], ["Administrator"]);
				else
					$set_menu[$name]["can_edit"] = ["Administrator"];
				if(isset($_POST["view"]))
					$set_menu[$name]["perm"] = array_unique(array_merge($_POST["view"], ["Administrator"]));
				else
					$set_menu[$name]["perm"] = ["Administrator"];
			}
			if($type=="sub_edit"){
				$subm = &$set_menu[$_GET['key']]['target'][$_GET['subkey']];
				$subm['title'] = $_POST['title'];
				$subm['type'] = $_POST['type'];
				if($_POST['type']=="intern")
					$subm['target'] = $_POST['targetIntern'];
				if($_POST['type']=="extern")
					$subm['target'] = $_POST['targetExtern'];

				if(isset($_POST['login']))
					$subm['login'] = True;
				else
					$subm['login'] = False;

				if(isset($_POST["edit"]))
					$subm['can_edit'] = array_merge($_POST["edit"], ["Administrator"]);
				else
					$subm['can_edit'] = ["Administrator"];
				if(isset($_POST["view"]))
					$subm['perm'] = array_unique(array_merge($_POST['view'], ["Administrator"]));
				else
					$subm['perm'] = ["Administrator"];
			}
			if($type=="item_new"){
				if(!array_key_exists($_POST['name'], $set_menu)){
					$name = $_POST['name'];
					$set_menu[$name]["title"] = $_POST["title"];
					$set_menu[$name]["type"] = $_POST["type"];

					if($_POST['type']=="intern")
						$set_menu[$name]["target"] = $_POST["targetIntern"];
					if($_POST['type']=="extern")
						$set_menu[$name]["target"] = $_POST["targetExtern"];
					if($_POST['type']=="sub")
						$set_menu[$name]["target"] = array();

					if(isset($_POST['login']))
						$set_menu[$name]["login"] = True;
					else
						$set_menu[$name]["login"] = False;
					$set_menu[$name]["edit"] = True;
					if(isset($_POST["edit"]))
						$set_menu[$name]["can_edit"] = array_merge($_POST["edit"], ["Administrator"]);
					else
						$set_menu[$name]["can_edit"] = ["Administrator"];
					if(isset($_POST["view"]))
						$set_menu[$name]["perm"] = array_unique(array_merge($_POST["view"], ["Administrator"]));
					else
						$set_menu[$name]["perm"] = ["Administrator"];

					// TODO
					if($_POST['type'] == "sub")
						$set_menu[$name]["target"] = array();

				}else{
					$error = true;
					$errormsg = "Name already exists";
				}
			}
			if($type=="sub_add"){
				if(!array_key_exists($_POST['name'], $set_menu[$_GET['key']['target']])){
					$name = $_POST['name'];
					$set_menu[$_GET['key']]['target'][$name]["title"] = $_POST["title"];
					$set_menu[$_GET['key']]['target'][$name]["type"] = $_POST["type"];

					if($_POST['type']=="intern")
						$set_menu[$_GET['key']]['target'][$name]["target"] = $_POST["targetIntern"];
					if($_POST['type']=="extern")
						$set_menu[$_GET['key']]['target'][$name]["target"] = $_POST["targetExtern"];

					$set_menu[$_GET['key']]['target'][$name]["edit"] = True;
					if(isset($_POST['login']))
						$set_menu[$_GET['key']]['target'][$name]["login"] = True;
					else
						$set_menu[$_GET['key']]['target'][$name]["login"] = False;
					if(isset($_POST["edit"]))
						$set_menu[$_GET['key']]['target'][$name]["can_edit"] = array_merge($_POST["edit"], ["Administrator"]);
					else
						$set_menu[$_GET['key']]['target'][$name]["can_edit"] = ["Administrator"];
					if(isset($_POST['view']))
						$set_menu[$_GET['key']]['target'][$name]["perm"] = array_unique(array_merge($_POST["view"], ["Administrator"]));
					else
						$set_menu[$_GET['key']]['target'][$name]["perm"] = ["Administrator"];

				}else{
					$error = true;
					$errormsg = "Name already exists";
				}

			}
		}

		if(!$error){
			// Update menu
			//file_put_contents("settings/menu.json", json_encode($set_menu, JSON_PRETTY_PRINT));
			updatesettings();
			Redirect::to($us_url_root.$VIEWNABASE."menu");
		}else{
			echo "<p>".$errormsg."</p>";
		}
	}

	if($_GET['type']=="item_edit")
		$keyname = $_GET['key'];
	elseif($_GET['type']=="sub_edit")
		$keyname = $_GET['subkey'];

?>
		<form class="form" action="" method="post">
<?php
	if($type=="item_new" || $type=="sub_add"){
?>
			<div class="form-group row">
				<label class="col-form-label col-sm-2" for="nameText">Name</label>
				<input type="text" class="form-control col-sm-10" value="<?php if($fill) echo $keyname;?>" id="nameText" name="name">
			</div>
<?php
	}
?>
			<div class="form-group row">
				<label class="col-form-label col-sm-2" for="titleText">Title</label>
				<input type="text" class="form-control col-sm-10" value="<?php if($fill) echo $menuitem["title"];?>" id="titleText" name="title">
			</div>
			<div class="form-group row">
				<label class="col-form-label col-sm-2" for="targetRadio">Type</label>
				<div class="form-check form-check-inline" id="targetRadio">
					<input class="form-check-input" type="radio" name="type" id="typeRadio1" value="intern"
						<?php if($fill && $menuitem["type"]=="intern" || !$fill) echo "checked";?> onclick="show_intern()">
					<label class="form-check-label" for="typeRadio1">Intern</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="type" id="typeRadio2" value="extern"
						<?php if($fill && $menuitem["type"]=="extern") echo "checked";?> onclick="show_extern()">
					<label class="form-check-label" for="typeRadio2">Extern</label>
				</div>
<?php
	if($type!="sub_add" && $type!="sub_edit"){
?>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="type" id="typeRadio3" value="sub"
						<?php if($fill && $menuitem["type"]=="sub") echo "checked";?> onclick="show_sub()">
					<label class="form-check-label" for="typeRadio3">Sub</label>
				</div>
<?php
	}
?>
			</div>
			<div id="target_intern">
				<div class="form-group row">
					<label class="col-form-label col-sm-2" for="targetIText">Target</label>
					<!--<input type="text" class="form-control col-sm-10" value="<?php if($fill) echo $menuitem["target"];?>" id="targetIText" name="targetIntern">-->
					<select class="form-control col-sm-10" id="targetIText" name="targetIntern">
<?php
	foreach($set_pages as $pagename => $page){
		if(sizeof($page['perm'])==0 || hasperm(get_perm($page['perm'], $user->data()->id))){
?>
						<option value="<?=$pagename?>"
							<?php if($fill && $pagename == $menuitem['target']) echo "selected";?>
						><?=$page['title']?></option>	
<?php
		}
	}
?>
					</select>
				</div>
			</div>
			<div id="target_extern">
				<div class="form-group row">
					<label class="col-form-label col-sm-2" for="targetEText">Target</label>
					<input type="text" class="form-control col-sm-10" value="<?php if($fill) echo $menuitem["target"];?>" id="targetEText" name="targetExtern">
				</div>
			</div>
			<script type="text/javascript">
				function show_intern(){
					document.getElementById('target_intern').style.display='block';
					document.getElementById('target_extern').style.display='none';
				}
				function show_extern(){
					document.getElementById('target_intern').style.display='none';
					document.getElementById('target_extern').style.display='block';
				}
				function show_sub(){
					document.getElementById('target_intern').style.display='none';
					document.getElementById('target_extern').style.display='none';
				}
				document.addEventListener("DOMContentLoaded", function(event) {
					show_<?php if($fill) echo $menuitem['type']; else echo "intern"; ?>();
				});
			</script>
			<div class="form-check">
				<input type="checkbox" class="form-check-input" <?php if($fill && $menuitem['login']) echo "checked";?> id="loginCheck" name="login">
				<label class="form-check-label" for="loginCheck">Login needed</label>
			</div>
<?php
	if($type!="sub_add" && $type!="item_new"){
?>
			<div class="form-check">
				<input type="checkbox" class="form-check-input" id="deleteCheck" name="delete">
				<label class="form-check-label" for="deleteCheck">Delete</label>
			</div>
			<div class="form-check">
				<input type="checkbox" class="form-check-input" id="upCheck" name="up">
				<label class="form-check-label" for="upCheck">Move up</label>
			</div>
			<div class="form-check">
				<input type="checkbox" class="form-check-input" id="downCheck" name="down">
				<label class="form-check-label" for="downCheck">Move down</label>
			</div>
<?php
	}
?>
			<div class="form-group row">
				<div class="dropdown show col-sm" id="permDiv">
					<a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="permBtn" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						View permissions
					</a>
					<div class="dropdown-menu" aria-labelledby="permBtn">
<?php
	foreach($permissionData as $p){
?>
						<div class="form-check">
							<input type="checkbox" class="form-check-inptut" id="viewPerm<?=$p->id?>"<?php if(($fill && in_array($p->name, $menuitem["perm"]))||$p->name=="Administrator") echo "checked";?> name="view[]" value="<?=$p->name?>" <?php if($p->name=="Administrator") echo "disabled"; ?>>
							<label class="form-check-label" for="viewPerm<?=$p->id?>"><?=$p->name?></label>
						</div>
<?php
	}
?>
					</div>
				</div>
				<div class="dropdown show col-sm" id="editDiv">
					<a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="editBtn" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						Edit permissions
					</a>
					<div class="dropdown-menu" aria-labelledby="editBtn">
<?php
	foreach($permissionData as $p){
?>
						<div class="form-check">
							<input type="checkbox" class="form-check-inptut" id="editPerm<?=$p->id?>"<?php if(($fill && in_array($p->name, $menuitem["can_edit"])) || $p->name=="Administrator") echo "checked";?> name="edit[]" value="<?=$p->name?>"<?php if($p->name=="Administrator") echo " disabled";?>>
							<label class="form-check-label" for="editPerm<?=$p->id?>"><?=$p->name?></label>
						</div>
<?php
	}
?>
					</div>
				</div>
			<div>
			<a class="btn btn-warning" role="button" href="<?=$us_url_root.$VIEWNABASE."menu"?>">Cancel</a>
			<input type="submit" class="btn btn-primary sumbit" value="Save" />
		</form>
	</div>
</div>
