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
	<div class="card-header">Page settings</div>
	<div class="card-body">

<?php
	$permissionData = fetchAllPermissions(); //Retrieve list of all permission levels

	if(!hasPerm(get_perm($set_pages[$_GET['key']]['can_edit']), $user->data()->id)){
		Redirect::to($us_url_root);
	}

	$fill = false;
	if($_GET["action"]=="edit"){
		$fill = true;
		$menuitem = $set_pages[$_GET['key']];
	}

	// Add new card
	if(isset($_GET['addCard']) && isset($_GET['key'])){
		$cname = "CARDS\\".$_GET['addCard'];
		if(class_exists($cname)){
			$c = new $cname(0);

			$new["type"] = "card";
			$new["title"] = "title";
			$new["perm"] = array();
			$new["edit"] = true;
			$new["can_edit"] = array();
			$new["login"] = true;
			$new["content"]["type"] = $_GET['addCard'];
			$new["content"]["data"] = $c->get_default();
			array_push($set_pages[$_GET['key']]['content'], $new);
			updatesettings();
			Redirect::to($us_url_root.$VIEWNABASE."page_setting&key=".$_GET['key']."&action=edit");
		}
	}

	if(isset($_POST['title'])){

		$error = false;
		$errormsg = "";

		if(isset($_POST['delete'])){
			unset($set_pages[$_GET['key']]);
			//file_put_contents("settings/pages.json", json_encode($set_pages, JSON_PRETTY_PRINT));
			updatesettings();
			Redirect::to($us_url_root.$VIEWNABASE."pages");
		}else{

			if($_GET['action']=="new"){
				if(in_array($_POST['name'], $set_pages_keys)){
					$error = true;
					$errormsg = "Name already in use";
				}

				$set_pages[$_POST['name']] = array();
				$name = $_POST['name'];
			}else{
				$name = $_GET['key'];
			}

			$set_pages[$name]['title'] = $_POST['title'];
			$set_pages[$name]['type'] = $_POST['type'];

			if($_POST['type']=="direct")
				$set_pages[$name]['content'] = $_POST['contentDirect'];
			else{
				$set_pages[$name]['content'] = json_decode($_POST['contentPage']);
			}

			if(isset($_POST['login']))
				$set_pages[$name]['login'] = True;
			else
				$set_pages[$name]['login'] = False;

			$set_pages[$name]['edit'] = True;

			if(isset($_POST['edit']))
				$set_pages[$name]['can_edit'] = array_merge($_POST['edit'], ["Administrator"]);
			else
				$set_pages[$name]['can_edit'] = ["Administrator"];

			if(isset($_POST['view']))
				$set_pages[$name]['perm'] = array_unique(array_merge($_POST['view'], ["Administrator"]));
			else
				$set_pages[$name]['perm'] = ["Administrator"];
		}

		// Update pages
		if(!$error){
			//file_put_contents("settings/pages.json", json_encode($set_pages, JSON_PRETTY_PRINT));
			updatesettings();
			if($_GET['action']=="edit")
				Redirect::to($us_url_root.$VIEWNABASE."page_setting&key=".$_GET['key']."&action=edit");
			else
				Redirect::to($us_url_root.$VIEWNABASE."page_setting&key=".$_POST['name']."&action=edit");
		}else{
			echo $errormsg."<br>";
		}
	}

?>
		<form class="form" action="" method="post" id="theForm">
<?php
	if(!$fill){
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
				<label class="col-form-label col-sm-2" for="typeRadio">Type</label>
<?php
	if(hasPerm(get_perm(["Administrator"]), $user->data()->id)){
?>
				<div class="form-check form-check-inline" id="typeRadio">
					<input class="form-check-input" type="radio" name="type" id="typeRadio1" value="direct"
						<?php if($fill && $menuitem["type"]=="direct") echo "checked";?> onclick="show_direct()">
					<label class="form-check-label" for="typeRadio1">Direct</label>
				</div>
<?php
	}
?>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="type" id="typeRadio2" value="page"
						<?php if($fill && $menuitem["type"]=="page" || !$fill) echo "checked";?> onclick="show_page()">
					<label class="form-check-label" for="typeRadio2">Normal page</label>
				</div>
			</div>
			<div id="content_direct">
				<div class="form-group row">
					<label class="col-form-label col-sm-2" for="contentDText">Content link</label>
					<input type="text" class="form-control col-sm-10" value="<?php if($fill) echo $menuitem["content"];?>" id="ContentDText" name="contentDirect">
				</div>
			</div>
			<script type="text/javascript">
			function show_direct(){
					document.getElementById('content_direct').style.display='block';
					document.getElementById('content_page').style.display='none';
				}
				function show_page(){
					document.getElementById('content_direct').style.display='none';
					document.getElementById('content_page').style.display='block';
				}
				document.addEventListener("DOMContentLoaded", function(event) {
					show_<?php if($fill) echo $menuitem['type']; else echo "page"; ?>();
				});
			</script>

			<div class="form-check">
				<input type="checkbox" class="form-check-input" <?php if($fill && $menuitem['login']) echo "checked";?> id="loginCheck" name="login">
				<label class="form-check-label" for="loginCheck">Login needed</label>
			</div>
<?php
	if($fill){
?>
			<div class="form-check">
				<input type="checkbox" class="form-check-input" id="deleteCheck" name="delete">
				<label class="form-check-label" for="deleteCheck">Delete</label>
			</div>
<?php
	}
?>
			<div class="form-group row">
				<div class="dropdown show col-sm <?php if(!$menuitem['login']) echo "d-none";?> " id="permDiv">
					<a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="permBtn" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						View permissions
					</a>
					<div class="dropdown-menu" aria-labelledby="permBtn">
<?php
	foreach($permissionData as $p){
?>
						<div class="form-check">
							<input type="checkbox" class="form-check-inptut" id="viewPerm<?=$p->id?>"
							<?php if(($fill && in_array($p->name, $menuitem["perm"]))||$p->name=="Administrator") echo "checked";?> name="view[]" value="<?=$p->name?>" <?php if($p->name=="Administrator") echo "disabled"; ?>>
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
							<input type="checkbox" class="form-check-inptut" id="editPerm<?=$p->id?>"
							<?php if(($fill && in_array($p->name, $menuitem["can_edit"])) || $p->name=="Administrator") echo "checked";?> name="edit[]" value="<?=$p->name?>" <?php if($p->name=="Administrator") echo "disabled"; ?>>
							<label class="form-check-label" for="editPerm<?=$p->id?>"><?=$p->name?></label>
						</div>
<?php
	}
?>
					</div>
				</div>
				<a class="btn btn-warning" role="button" href="<?=$us_url_root.$VIEWNABASE."pages"?>">Cancel</a>
				<input type="submit" class="btn btn-primary sumbit" value="Save" />
			</div>

<!-- CONTENT -->
			<div class="form-group">
				<div class="card mt-2" id="content_page">
					<div class="card-header">Page content</div>
					<div class="card-body">
						<div id="pagesettings"></div>
							<ul class="list-group">

<?php
	if($fill)
		$content = $menuitem['content'];
	else
		$content = array();
	?><textarea class="form-control d-none" rows="8" name="contentPage" id="contentPage"><?=json_encode($content)?></textarea><?php

	$nr = 0;
	foreach($content as $card){
		if(!$card['login'] || sizeof($card['perm'])==0 || hasPerm(get_perm($card['perm']), $user->data()->id)){
			if(!$card['type']=="card")
				continue;

			echo "<li class='list-group-item list-group-item-action list-group-item-secondary' data-toggle='collapse' href='#collapse".$nr."' role='button' ";
			echo "aria-expanded='false' aria-controls='collapse".$nr."'>";
			echo $card['title'];
			echo "<button type='button' class='btn btn-warning btn-sm float-right' onclick='settings_moveup(".$nr.")'>";
			echo "<i class='fa fa-arrow-up' style='color:var(--text-light);'></i></button>";
			echo "<button type='button' class='btn btn-warning btn-sm float-right' onclick='settings_movedown(".$nr.")'>";
			echo "<i class='fa fa-arrow-down' style='color:var(--text-light);'></i></button>";
			echo "</li><div class='collapse' id='collapse".$nr."'>";

			$cname = "CARDS\\".$card['content']['type'];
			if(class_exists($cname)){
				// Card type known: render settings
				$c = new $cname($nr);
				$c->set_content($card['content']['data']);
?>
				Title: <input type="text" class="form-control" id="settings-<?=$nr?>-title" value="<?=$card['title']?>">
				<?php $c->render_settings(); ?><br>
				<div class="form-check">
					<input type="checkbox" class="form-check-input" id="settings-<?=$nr?>-login" <?=$card['login']?"checked":""?>>
					<label class="form-check-label" for="settings-<?=$nr?>-login">Login needed</label>
				</div>
				<button type="button" class="btn btn-primary btn-sm" onclick="card_save(<?=$nr?>)">Save</button>
				<button type='button' class='btn btn-secondary btn-sm' onclick="card_delete(<?=$nr?>)">Delete</button>
<?php
			}else{
				// Card type not known
				echo "Card type not known: ".$cname."<br>";
				?><button type='button' class='btn btn-secondary btn-sm' onclick="card_delete(<?=$nr?>)">Delete</button><?php
			}

			echo "</div>";
			$nr++;
		}
	}

	echo "</ul><br>";

	// Add buttons
	foreach(get_declared_classes() as $c){
		$names = explode("\\", $c);
		if($names[0] == "CARDS" && sizeof($names)==2){
			echo "<a href='".$_SERVER['REQUEST_URI']."&addCard=".$names[1]."' role='button' ";
			echo "class='btn btn-secondary' onclick=''>Add ". $names[1] ." card </a>";
		}
	}
?>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">
	function card_save(nr){
		var c = JSON.parse(document.getElementById('contentPage').value);
		c[nr].title = document.getElementById("settings-"+nr+"-title").value;
		c[nr].login = document.getElementById("settings-"+nr+"-login").checked;

		// Elements of card
		var elements = document.getElementsByClassName("card_settings-"+nr);
		for(var i=0; i<elements.length; i++){
			c[nr].content.data[elements[i].name] = elements[i].value;
		}
		
		console.log(c);
		document.getElementById('contentPage').value = JSON.stringify(c);
		document.getElementById('theForm').submit();
	}

	function card_delete(nr){
		var c = JSON.parse(document.getElementById('contentPage').value);
		delete c[nr];
		c = c.filter(function(n){ return n != undefined });
		console.log(c);
		document.getElementById('contentPage').value = JSON.stringify(c);
		document.getElementById('theForm').submit();
	}

	function settings_moveup(nr){
		var c = JSON.parse(document.getElementById('contentPage').value);
		var cone = c.slice(0, nr-1);
		var ctwo = c.slice(nr+1);
		var cmid = c.slice(nr-1, nr+1).reverse();
		console.log(cone);
		console.log(ctwo);
		console.log(cmid);
		c = cone.concat(cmid).concat(ctwo);
		document.getElementById('contentPage').value = JSON.stringify(c);
		document.getElementById('theForm').submit();
	}
	function settings_movedown(nr){
		var c = JSON.parse(document.getElementById('contentPage').value);
		var cone = c.slice(0, nr);
		var ctwo = c.slice(nr+2);
		var cmid = c.slice(nr, nr+2).reverse();
		console.log(cone);
		console.log(ctwo);
		console.log(cmid);
		c = cone.concat(cmid).concat(ctwo);
		document.getElementById('contentPage').value = JSON.stringify(c);
		document.getElementById('theForm').submit();
	}
</script>
