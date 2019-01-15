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

if(!isset($PREVENTDIRECTACCES)){
	include("403.php");
	die;
}

$page_keys = array_keys($set_pages);
if(isset($VIEWNR))
	if($VIEWNR<sizeof($page_keys)){
		$page = $set_pages[$page_keys[$VIEWNR]];
		$page_key = $page_keys[$VIEWNR];
	}else{
		$page = $set_pages['404'];
		$page_key = '404';
	}
else{
	if(in_array($VIEWNA, $page_keys)){
		$page = $set_pages[$VIEWNA];
		$page_key = $VIEWNA;
	}else{
		$page = $set_pages['404'];
		$page_key = '404';
	}
}

// Check if user must be logged in and if he is
if(!$page['login'] ||  $user->isLoggedIn()){
	// Check if user has permissions to show page
	if(!$page['login'] || sizeof($page['perm'])==0 || hasPerm(get_perm($page['perm']), $user->data()->id)){
		// Check if type is page
		if($page['type']=='page'){
			//echo "<div class='container-fluid'>";

			// Loop trough content of page
			$nr = 0;
			foreach($page['content'] as $card){
				if(!$card['login'] ||  $user->isLoggedIn()){
					if(!$card['login'] || sizeof($card['perm'])==0 || hasPerm(get_perm($card['perm']), $user->data()->id)){
						if($card['type'] == "card"){
?>
							<div class='row'>
							<div class='col-md'>
								<div class="card mt-2">
									<div class="card-header"><?=$card['title']?></div>
									<div class="card-body">
<?php
							// Get class name of card type
							$cname = "CARDS\\".$card['content']['type'];
							if(class_exists($cname)){
								$c = new $cname($nr);
								$c->set_content($card['content']['data']);
								$c->render();
							}else{
								echo "Card type not known: ".$cname."<br>";
								vardump($card['content']['data']);
							}
?>
									</div>
								</div>
							</div>
							</div>
<?php
						}
					}
				}
				$nr++;
			}

			//echo "</div>";

			// If user may edit page: show edit sign
			if(!$page['login'] || sizeof($page['perm'])==0 || hasPerm(get_perm($page['can_edit']), $user->data()->id)){
				if($page['login'])
				echo "<hr><a role='button' class='btn btn-primary btn-sm'
					href='?viewna=page_setting&key=".$page_key."&action=edit'>
					<i class='fa fa-edit' style='color:var(--text-light);'></i></a>";
			}
		}
		if($page['type']=='direct'){
			include($page["content"]);
		}
	}else{
		// TODO LOG TO LOGBOOK WHICH USER TRIED TO ACCES?
		include($set_pages['403']['content']);
	}
}else{
	include($set_pages['login']['content']);
}

?>
