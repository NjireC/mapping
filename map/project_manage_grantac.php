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
            <form class="form-horizontal" action="scripts/grantaccess.php" role="form"  method="post">
                <div class="panel panel-default">
                    <div class="panel-heading"><h6 class="panel-title">Project  Grant Access to user</h6></div>
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
                                <input type="text" class=" form-control"  name="expno" id="expno"  value="<?php echo $e_project['expno']; ?>" readonly>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Project site : <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                   <select  class="select-full select-disabled" name="site" id="site">  
                                    
                                       <option value=""> Select site</option>
                                       <?php  foreach ($all_sites as $site): 

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
                            <label class="col-sm-2 control-label">Status : <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                <select  class="select-full" name="accessst" id="accessst" required >
                                    <option  value="1">Grant Access</option>
                                    <option  value="2">Revoke Access</option>
                                                                                
                                </select>
                            </div>
                        </div>
                    
                    
                         <div class="form-group">
                            <label class="col-sm-2 control-label">User:  <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                
                                <select  class="select2_dynamic form-group" name="rsn" id="rsn" style='width: 100%'; required>  
                            
                                </select>

                            </div>
                        </div>

                    
                    
                 
                        <div class="form-actions text-right">
                            <button name="grant" type="submit" id="grant" class="btn btn-primary"  ><i class="fa fa-check" aria-hidden="true"></i> Submit</button>
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


$(document).ready(function(){

        $(".select2_dynamic").select2({
               ajax: {
                   url: "scripts/getnames_all.php",
                   type: "post",
                   dataType: 'json',
                   delay: 250,
                   data: function (params) {
                       return {
                           searchTerm: params.term 
                       };
                   },
                   processResults: function (response) {
                       return {
                           results: response
                       };
                   },
                   cache: true
               }
           });      
       });


</script>



<?php include_once('layouts/foot.php'); ?>		
			
	
           