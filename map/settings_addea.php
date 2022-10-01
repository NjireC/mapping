<?php 

/**
* Created by Dickson Msaky @ Ifakara Health Insitute (2018)
**/
require_once('includes/load.php');
$page_title = 'Settings | MosquitoDB';
page_require_level(2); 
include_once('layouts/head.php');

$all_enum = find_all('enum');
?>
	
 <!-- Page content -->
 <div class="page-content">

                 <?php echo display_msg_popup($msg);  ?>

 	<!-- Page title -->
 	<div class="page-title">
 		<h5><i class="fa fa-bars"></i> Home <small>Welcome, <?php   echo $name;  ?> </small></h5>
 	</div>



 	<!-- /page title -->
 	<div class="panel panel-primary">
 		<div class="panel-heading">
 			<h6 class="panel-title"> Dataset Table For:   <span id="pname"></span>  </h6>
 			<div class="btn-group pull-right">

 				<?php include_once('scripts/selectproject.php'); ?>

 			</div>
 		</div>
 	</div>

 	  <?php include_once('layouts/settingsmenu.php'); ?>
               <br />     


 	
     

      <div class="row">
        <div class="col-md-7">
          <div class="panel panel-default">
            <div class="panel-heading"><h6 class="panel-title">Enumeration area added</h6>

            </div>
            <div class="panel-body">

               <div class="box-body table-responsive no-padding">
               <table width="100%" class="table table-hover">
                  <thead>
                <tr>
                    <th class="text-center">Code</th>
                    <th>Name</th>
                    <th class="text-center">Actions</th>
                </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($all_enum as $enu):?>
                      <tr>
                          <td class="text-center"><?php echo count_id();?></td>
                          <td><?php echo remove_junk(ucfirst($enu['NAME'])); ?></td>
                          <td class="text-center">
                            <div class="btn-group">
                          <!--    <a href="edit_ea.php?id=<?php echo (int)$enu['ID'];?>"  class="btn btn-primary" data-toggle="tooltip" title="Edit">
                                <i class="fa fa-pencil"></i> Edit
                              </a> -->
                              <a onclick="javascript:confirmationDelete($(this));return false;" href="scripts/delete_ea.php?id=<?php echo (int)$enu['ID'];?>"  class="btn btn-danger" data-toggle="tooltip" title="Delete">
                                <i class="fa fa-trash-o"></i> Delete
                              </a>
                            </div>
                          </td>

                      </tr>
                    <?php endforeach; ?>
                  </tbody>
               </table>
              </div>
             

            </div>

           

          </div>
        </div>



        <div class="col-md-5">
          <div class="panel panel-default">
            <div class="panel-heading"><h6 class="panel-title">Add Enumeration area </h6>

            </div>
            <div class="panel-body">

                <form method="post" action="scripts/addea.php" role="form">
                  <div class="box-body">
                    <div class="form-group">
                      <label for="ea-name">Enumeration area name</label>
                      <input type="text" class="form-control" id="ea-name" name="ea-name" required>
                    </div>  
                   
                  </div>
                    <div class="box-body">
                    <div class="form-group">
                      <label for="ea-code">Enumeration area code</label>
                      <input type="text" class="form-control" id="ea-code" name="ea-code" required>
                    </div>  
                   
                  </div>
                

                  <div class="box-footer">
                   <div class="pull-right"> <button name="add_ea" type="submit" class="btn btn-primary"><i class="fa fa-check" aria-hidden="true"></i>  Submit</button></div>
                  </div>
                </form>
            
            </div>

          </div>
        </div>

      </div> 


 	              





<?php include_once('layouts/foot.php'); ?>		
			
	
           