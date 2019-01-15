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

if(!file_exists("users/init.php")){
	die("OMACS not installed. Visit install/index.php");
}

// Setup error reporting
error_reporting(E_ALL ^ E_DEPRECATED);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);

// Disable cache
header("Expires: Tue, 01 Jan 2000 00:00:00 GMT");
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");

// Login files
require_once("users/init.php");
require_once("users/helpers/helpers.php");
$db = DB::getInstance();
$settingsQ = $db->query("Select * FROM settings");
$settings = $settingsQ->first();

// Include functions
require("scripts/settings.php");
require("scripts/cardsapi.php");

// Load settings
$set_css = settings_parse("css");

$ALLpermissionsF = fetchAllPermissions();
foreach($ALLpermissionsF as $p){
	$set_omacs_permissions[$p->name] = (int)$p->id;
}

//$set_pages = json_decode(file_get_contents("settings/pages.json"), true);
$set_pages = json_decode(base64_decode($db->query("SELECT data FROM omacs WHERE type = \"pages\"")->results()[0]->data), true);
$set_pages_keys = array_keys($set_pages);
//$set_menu = json_decode(file_get_contents("settings/menu.json"), true);
$set_menu = json_decode(base64_decode($db->query("SELECT data FROM omacs WHERE type = \"menu\"")->results()[0]->data), true);
$set_menu_keys = array_keys($set_menu);

// OMACS views
$PREVENTDIRECTACCES = true;
if(isset($_GET['viewnr']))
	$VIEWNR = $_GET['viewnr'];
$VIEWNRBASE = "?viewnr=";
if(isset($_GET['viewna']))
	$VIEWNA = $_GET['viewna'];
$VIEWNABASE = "?viewna=";
if(!isset($VIEWNA) && !isset($VIEWNR))
	$VIEWNA = "home";

function get_perm($perms = []){
	global $set_omacs_permissions;
	$j = 0;
	$perm = [];
	foreach($perms as $p){
		$perm[$j++] = $set_omacs_permissions[$p];
	}
	return $perm;
}

function array_move(&$array, $index, $up) {
	$keys = array_keys($array);
	$self = [$keys[$index]=>$array[$keys[$index]]];
	if($up){
		if($index<=0)
			return;
		$beforeitem = [$keys[$index-1]=>$array[$keys[$index-1]]];
		$beforemin = array_slice($array, 0, $index-1);
		$after = array_slice($array, $index+1);
		$array = array();
		$array = array_merge($beforemin, $self, $beforeitem, $after);
	}else{
		if($index>=sizeof($array)-1)
			return;
		$afteritem = [$keys[$index+1]=>$array[$keys[$index+1]]];
		$afterplus = array_slice($array, $index+2);
		$before = array_slice($array, 0, $index);
		$array = array();
		$array = array_merge($before, $afteritem, $self, $afterplus);
	}
}

function vardump($v){
	echo "<pre>";
	print_r($v);
	echo "</pre>";
}

function arrayreplace($a, $value, $replacement){
	return array_map(function ($v) use ($value, $replacement) {
		return $v == $value ? $replacement : $v;
	}, $a);
}

function updatesettings(){
	global $db, $set_pages, $set_menu;
	$db->query("UPDATE omacs SET data = \"".base64_encode(json_encode($set_pages, JSON_PRETTY_PRINT))."\" WHERE type = \"pages\"");
	$db->query("UPDATE omacs SET data = \"".base64_encode(json_encode($set_menu, JSON_PRETTY_PRINT))."\" WHERE type = \"menu\"");
}

include "cards/card.php";
// Get all php files in cards folder
$files = scandir("cards/");
unset($files[array_search("403.php", $files)]);
unset($files[array_search("index.php", $files)]);
unset($files[array_search(".", $files)]);
unset($files[array_search("..", $files)]);
unset($files[array_search("card.php", $files)]);
// Loop through all files and include
foreach($files as $f){
	include "cards/".$f;
}

?>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<title>OMACS - ONLINE MEMBER AND COMMITTEE SYSTEMM</title>

		<!-- Bootstrap CSS CDN -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
			integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<!-- Our Custom CSS -->
		<link rel="stylesheet" href="style/style.css?v=ve<?php echo filemtime('settings/settings.css'); ?>">

		<link rel="stylesheet" href="settings/settings.css?v=v<?php echo filemtime('settings/settings.css'); ?>">

		<!-- Scrollbar Custom CSS -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
		<!-- Font awesome -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	
		<!-- SCRIPTS -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" 
			integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" 
			integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

		<script src="scripts/jscolor.js"></script>

		<script type="text/javascript">
			$(document).ready(function () {
				$("#sidebar").mCustomScrollbar({
					theme: "minimal",
					scrollInertia: 0
				});

				$('#dismiss, .overlay').on('click', function () {
					$('#sidebar').removeClass('active');
					$('.overlay').fadeOut();
				});

				$('#sidebarCollapse').on('click', function () {
					$('#sidebar').addClass('active');
					$('.overlay').fadeIn();
					$('.collapse.in').toggleClass('in');
					$('a[aria-expanded=true]').attr('aria-expanded', 'false');
				});
			});

		</script>

	</head>
	<body>

