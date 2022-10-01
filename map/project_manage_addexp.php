<?php 

/**
* Created by Dickson Msaky @ Ifakara Health Insitute (2018)
**/
require_once('includes/load.php');
$page_title = 'Manage Project | MosquitoDB'; 
page_require_level(2);
include_once('layouts/head.php');



$all_sites = find_all('site');
$all_names = find_all('staff');

 if(isset($_GET['id'])){

  $e_project = find_by_('projectreg','id',(int)$_GET['id']);


 
  if(!$e_project){
    $session->msg_("d","Missing project.");
    redirect('project_manage.php');
  }

}

 ?>
 	
 <!-- Page content -->
 <div class="page-content">
 	  <?php echo display_msg_popup($msg);  ?>
 	<div class="page-title">
 		<h5><i class="fa fa-bars"></i> Home <small>Welcome, <?php   echo $name;  ?> </small></h5>
 	</div>
 	<!-- /page title -->
 	
         

                <!-- Form -->
            <form class="form-horizontal" action="scripts/addexp.php" role="form"  method="post">
                <div class="panel panel-default">
                    <div class="panel-heading"><h6 class="panel-title">Project Edit</h6></div>
                    <div class="panel-body">

                       <div class="form-group">
                            <label class="col-sm-2 control-label">Project name : <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                <input type="text" class=" form-control"  name="pn" id="pn"  value="<?php echo $e_project['pn']; ?>" readonly>
                            </div>
                        </div>
                                 
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Project code : <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                <input type="text" class=" form-control" name="pc" id="pc"  value="<?php echo $e_project['pc']; ?>" readonly>
                                <input type="hidden"  name="pid" id="pid" value="<?php echo $e_project['id']; ?>" >
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Experiment number : <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                <input type="text" class=" form-control"  name="expno" id="expno"   required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Project site : <span class="">*</span></label>
                            <div class="col-sm-10">
                                   <select  class="select-full" name="site" id="site">  
                                     <option value=""> Select site</option>
                                       <?php  foreach ($all_sites as $site): ?>

                                       <?php 

                                            if ( findsiteid($e_project['id']) === $site['site_id'] ) { 
                                                $selected = ' selected'; 
                                            }else{
                                                $selected = ' '; 
                                            } 

                                            echo '<option value="'.$site['site_id'].'"'. $selected .'>' .$site['site_name'].'</option>';  
                                        
                                       
                                         endforeach; 
                                       ?>
                                    </select>
                            </div>
                        </div>
                    
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Experiment start date : <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                <input type="text" class=" datepicker form-control datformat" name="esd" id="esd"  required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Experiment  end date : <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                <input type="text" class="datepicker  form-control datformat" name="efd" id="efd"   required>
                            </div>
                        </div>

                       <!-- <div class="form-group">
                            <label class="col-sm-2 control-label">Ethical approval  : </label>
                            <div class="col-sm-10">
                                <input type="text" class=" form-control" name="eap" id="eap" value="<?php echo $e_project['eap']; ?>" readonly>
                            </div>
                        </div>  -->

            
                         <div class="form-group">
                            <label class="col-sm-2 control-label">Responsible scientist  :</label>
                            <div class="col-sm-10">
                                <select  class="select-full select-disabled" name="rsn" id="rsn" required>   
                                   <option value=""> Select Name</option>
                                       <?php  foreach ($all_names as $name): ?>
                                       <option value="<?php echo $name['staff_id']; ?>" <?php if($e_project['rsn'] === $name['staff_id']): echo "selected"; endif; ?> >
                                          <?php echo remove_junk($name['fname']." ".$name['lname']); ?></option>
                                         <?php endforeach; ?>

                                        </select>
                            </div>
                        </div>

                      <!--   <div class="form-group">
                            <label class="col-sm-2 control-label">Principal Investigator  :</label>
                            <div class="col-sm-10">
                                  <select  class=" form-control" name="pin" id="pin" required>  

                                      <option value=""> Select Name</option>
                                       <?php // foreach // ($all_names as $name): ?>
                                       <option value="<?php //echo $name['staff_id']; ?>" <?php // if($e_project['pin'] === $name['staff_id']): echo "selected"; endif; ?> >
                                       <?php //echo remove_junk($name['fname']." ".$name['lname']); ?></option>
                                        <?php //endforeach; ?> 


                                  </select>

                            </div>
                        </div> -->
                 
                        <div class="form-actions text-right">
                            <button name="updateproj" type="submit" id="updateproj" class="btn btn-primary"  > <i class="fa fa-check" aria-hidden="true"></i> Add Experiment</button>
                        </div>

                    </div>
                    
                </div>
            </form>
            <!-- /form  -->
        

<script type="text/javascript">

jQuery(function ($) {        
  $('form').bind('submit', function () {
    $(this).find(':input').prop('disabled', false);
  });
});

</script>


<?php include_once('layouts/foot.php'); ?>		
			
	
           