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
	<div class="card-header">Permission settings</div>
	<div class="card-body">
<?php

$validation = new Validate();
//PHP Goes Here!
$permission_exempt = array(1,2);
$errors = [];
$successes = [];

//Forms posted
if(!empty($_POST))
{
  $token = $_POST['csrf'];
  if(!Token::check($token)){
    include($abs_us_root.$us_url_root.'usersc/scripts/token_error.php');
  }

  //Create new permission level
  if(!empty($_POST['name'])) {
    $permission = Input::get('name');
    $fields=array('name'=>$permission);
    //NEW Validations
        $validation->check($_POST,array(
          'name' => array(
            'display' => 'Permission Name',
            'required' => true,
            'unique' => 'permissions',
            'min' => 1,
            'max' => 25
          )
        ));
        if($validation->passed()){
          $db->insert('permissions',$fields);
          $successes[] = "Permission Updated";
          logger($user->data()->id,"Permissions Manager","Added Permission Level named $permission.");
  }else{

    }
  }
}


$permissionData = fetchAllPermissions(); //Retrieve list of all permission levels
$count = 0;
// dump($permissionData);
// echo $permissionData[0]->name;
?>
<div id="page-wrapper">

  <div class="container-fluid">

    <!-- Page Heading -->
    <div class="row">
      <div class="col-sm-12">

            <?php if(!$validation->errors()=='') {?><div class="alert alert-danger"><?=display_errors($validation->errors());?></div><?php } ?>
        <!-- Left Column -->
        <div class="class col-sm-3"></div>

        <!-- Main Center Column -->
        <div class="class col-sm-6">
          <!-- Content Goes Here. Class width can be adjusted -->


			<?php
			echo resultBlock($errors,$successes);
			?>
			<form name='adminPermissions' action='' method='post'>
			  <p>
				<div class="form-inline">
					<input type='text' name='name' class="form-control" placeholder="Permission name"/>  
					<input type="hidden" name="csrf" value="<?=Token::generate();?>" >
					<input class='btn btn-primary' type='submit' name='Submit' value='Add Permission'/>
				</div>
			  </p>
  			</form>

			  <br>
			  <table class='table table-hover table-list-search'>

				<?php
				foreach ($permissionData as $v1) {
				  ?>
				  <tr>
					<td><a style="display:block;" href="<?=$VIEWNABASE?>permission&id=<?=$permissionData[$count]->id?>"><?=$permissionData[$count]->name?></a></td>
				  </tr>
				  <?php
				  $count++;
				}
				?>

			  </table>

          <!-- End of main content section -->
        </div>

        <!-- Right Column -->
        <div class="class col-sm-1"></div>
      </div>
    </div>
	</div>
	</div>

	</div>
</div>
