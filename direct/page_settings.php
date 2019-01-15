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
	<div class="card-header">Pages</div>
	<div class="card-body">

		<ul class="list-group">
			<?php
			$i = 0;
			foreach($set_pages as $key=>$page){
				// May user see it?
				if(sizeof($page['perm']) == 0 || hasPerm(get_perm($page['perm']), $user->data()->id)){
					// Check if user can edit
					$edit = false;
					if($page['edit'] && (sizeof($page['can_edit'])==0 || hasPerm(get_perm($page['can_edit']), $user->data()->id)))
						$edit = true;
						?><li class='list-group-item'>
							<?=$page['title']?> - <i><?=$key?></i>
						<?php if($edit){ ?>
							<a role='button' class='btn btn-primary float-right btn-sm'
									href='<?=$VIEWNABASE?>page_setting&key=<?=$key?>&action=edit'>
								<i class='fa fa-edit' style='color:var(--text-light);'></i>
							</a>
						<?php } ?>
						</li><?php
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
					href='<?=$VIEWNABASE?>page_setting&action=new'>
				<i class='fa fa-plus' style='color:var(--text-light);'></i> Add page
			</a>
		<?php } ?>

	</div>
</div>

