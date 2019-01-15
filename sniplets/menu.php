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

function print_menu_element($menu){
	global $VIEWNABASE;
	if($menu['type']=="intern"){
		echo "<li><a href='".$VIEWNABASE.$menu['target']."'>".$menu['title']."</a></li>";
	}
	if($menu['type']=="extern"){
		echo "<li><a href='".$menu['target']."'>".$menu['title']."</a></li>";
	}
}

// Loop trough all menu elements
foreach($set_menu as $key=>$menu){
	// Check if user may see
	if(!$menu['login'] || $user->isLoggedIn()){
		// Check if there are permissions to see
		if(!$menu['login'] || sizeof($menu['perm'])==0 || hasPerm(get_perm($menu['perm']), $user->data()->id)){
			// Check if sub
			if($menu['type']=='sub'){
				echo "<li><a href='#sub".$key."' data-toggle='collapse' aria-expanded='false'>".$menu['title']."</a>";
				echo "<ul class='collapse list-unstyled' id='sub".$key."'>";
				foreach($menu['target'] as $target){
					if(!$menu['login'] || sizeof($target['perm'])==0 || hasPerm(get_perm($target['perm']), $user->data()->id)){
						print_menu_element($target);
					}
				}
				echo "</ul></li>";
			}else{
				print_menu_element($menu);
			}
		}
	}
}

?>
