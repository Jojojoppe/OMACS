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
	<div class="card-header">Menu settings</div>
	<div class="card-body">

<?php
	if(isset($_GET['action'])){
		$up = false;
		if($_GET['action']=="up")
			$up = true;
		array_move($set_menu, array_search($_GET['key'], array_keys($set_menu)), $up);
		updatesettings();
		Redirect::to($us_url_root.$VIEWNABASE."menu");
	}
	if(isset($_GET['subaction'])){
		$up = false;
		if($_GET['subaction']=="up")
			$up = true;
		array_move($set_menu[$_GET['key']]['target'], array_search($_GET['nr'], array_keys($set_menu[$_GET['key']]['target'])), $up);
		updatesettings();
		Redirect::to($us_url_root.$VIEWNABASE."menu");
	}

?>

		<ul class="list-group">
			<?php
			$i = 0;
			foreach($set_menu as $key=>$menu){
				// May user see it?
				if(sizeof($menu['perm']) == 0 || hasPerm(get_perm($menu['perm']), $user->data()->id)){
					// Check if user can edit
					$edit = false;
					if($menu['edit'] && (sizeof($menu['can_edit'])==0 || hasPerm(get_perm($menu['can_edit']), $user->data()->id)))
						$edit = true;
					// Submenu of normal menu
					if($menu['type']=="sub"){
						?><li class='list-group-item list-group-item-action'
						data-toggle='collapse' href='#collapse<?=$i?>' role='button' aria-expanded='false' aria-contols='collapse<?=$i?>'>
						<i class='fa fa-angle-down'></i>
						<?=$menu['title']?>

						<a role='button'class="btn btn-secondary float-right btn-sm" href="<?=$VIEWNABASE?>menu&action=down&key=<?=$key?>">
							<i class='fa fa-arrow-down' style='color:var(--text-light);'></i></a>
						<a role='button'class="btn btn-secondary float-right btn-sm" href="<?=$VIEWNABASE?>menu&action=up&key=<?=$key?>">
							<i class='fa fa-arrow-up' style='color:var(--text-light);'></i></a>

						<?php if($edit){ ?>
							<a role='button' class='btn btn-primary float-right btn-sm'
								href='<?=$VIEWNABASE?>menu_setting&key=<?=$key?>&action=edit&type=item_edit'>
							<i class='fa fa-edit' style='color:var(--text-light);'></i>
							</a>
							<a role='button' class='btn btn-primary float-right btn-sm'
								href="<?=$VIEWNABASE?>menu_setting&key=<?=$key?>&action=new&type=sub_add">
							<i class='fa fa-plus' style='color:var(--text-light);'></i>
							</a>
						<?php } ?>
						</li><ul class='list-group collapse' id='collapse<?=$i?>'><?php
						// List submenu
						foreach($menu['target'] as $nr=>$target){
							// may user see it?
							if(sizeof($target['perm']) == 0 || hasPerm(get_perm($target['perm']), $user->data()->id)){
								// Check if user can edit
								$edittarget = false;
								if($target['edit'] && (sizeof($target['can_edit'])==0 || hasPerm(get_perm($target['can_edit']), $user->data()->id)))
									$edittarget = true;
								?><li class='list-group-item'>-
								<?=$target['title']?>

								<a role='button'class="btn btn-secondary float-right btn-sm" 
									href="<?=$VIEWNABASE?>menu&subaction=down&key=<?=$key?>&nr=<?=$nr?>">
									<i class='fa fa-arrow-down' style='color:var(--text-light);'></i></a>
								<a role='button'class="btn btn-secondary float-right btn-sm" 
								href="<?=$VIEWNABASE?>menu&subaction=up&key=<?=$key?>&nr=<?=$nr?>">
									<i class='fa fa-arrow-up' style='color:var(--text-light);'></i></a>

								<?php if($edittarget){ ?>
									<a role='button' class='btn btn-primary float-right btn-sm'
										href='<?=$VIEWNABASE?>menu_setting&key=<?=$key?>&subkey=<?=$nr?>&action=edit&type=sub_edit'>
									<i class='fa fa-edit' style='color:var(--text-light);'></i>
									</a>
								<?php } ?>
								</li><?php
							}
						}
						?></ul><?php

					}else{
						?><li class='list-group-item'>
						<?=$menu['title']?>

						<a role='button'class="btn btn-secondary float-right btn-sm" href="<?=$VIEWNABASE?>menu&action=down&key=<?=$key?>">
							<i class='fa fa-arrow-down' style='color:var(--text-light);'></i></a>
						<a role='button'class="btn btn-secondary float-right btn-sm" href="<?=$VIEWNABASE?>menu&action=up&key=<?=$key?>">
							<i class='fa fa-arrow-up' style='color:var(--text-light);'></i></a>

						<?php if($edit){ ?>
							<a role='button' class='btn btn-primary float-right btn-sm'
									href='<?=$VIEWNABASE?>menu_setting&key=<?=$key?>&action=edit&type=item_edit'>
								<i class='fa fa-edit' style='color:var(--text-light);'></i>
							</a>
						<?php } ?>
						</li><?php
					}
				}
				$i++;
			}
			?>
		</ul>

		<?php
		// TODO how to prevent this one??
		$editmain = true;
		if($editmain){ ?>
			<a role='button' class='btn btn-primary'
					href='<?=$VIEWNABASE?>menu_setting&action=new&type=item_new'>
				<i class='fa fa-plus' style='color:var(--text-light);'></i> Add menu item
			</a>
		<?php } ?>

	</div>
</div>


