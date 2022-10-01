<?php 

/**
* Created by Dickson Msaky @ Ifakara Health Insitute (2018)
**/
require_once('includes/load.php');
$page_title = 'Manage User | MosquitoDB'; 
page_require_level(1);
include_once('layouts/head.php');



 if(isset($_GET['id'])){

  $e_user = find_by_('staff','staff_id',(int)$_GET['id']);
 
  if(!$e_user){
    $session->msg_("d","Missing user.");
    redirect('user_manage.php');
  }

}

?>
 <!-- Page content -->
 <div class="page-content">

               <?php echo display_msg_popup($msg);  ?>

 	<!-- Page title -->
 	<div class="page-title">
 	       <h5><i class="fa fa-bars"></i> Home <small>Welcome, <?php   echo $name;  ?> </small></h5>
 	</div>
 	
 	<!-- Form -->
            <form class="form-horizontal" action="scripts/updateuser.php" role="form"  method="post">
                <div class="panel panel-default">
                    <div class="panel-heading"><h6 class="panel-title">Edit User</h6></div>
                    <div class="panel-body">
                
                        <div class="form-group">
                            <label class="col-sm-2 control-label">First name: <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                <input type="text" class=" form-control" name="firstname" id="firstname" value="<?php echo $e_user['fname']; ?>" readonly>
                                <input type="hidden"  name="staffid" id="staffid" value="<?php echo $e_user['staff_id']; ?>" >
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Second name: <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                <input type="text" class=" form-control"  name="secondname" id="secondname" value="<?php echo $e_user['mname']; ?>" readonly>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Last name: <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                <input type="text" class=" form-control"  name="lastname" id="lastname" value="<?php echo $e_user['lname']; ?>" readonly>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Mobile number: <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                <input type="text" class=" form-control" name="mobnumber" id="mobnumber" value="<?php echo $e_user['mobinum']; ?>" readonly>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Email: <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                <input type="email" class=" form-control"  name="email" id="email" value="<?php echo $e_user['email']; ?>" readonly>
                            </div>
                        </div>
                                             
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Security Level: <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                <select  class="select-full" name="securitylevel" id="securitylevel" required>
                                    <option value="">Select level</option>
                                    <option  <?php if($e_user['seculevel'] === '1') echo 'selected="selected"';?> value="1">System Manager</option>
                                    <option  <?php if($e_user['seculevel'] === '3') echo 'selected="selected"';?> value="3">User</option>
                                                      
                                </select>
                            </div>
                        </div>

                          <div class="form-group">
                            <label class="col-sm-2 control-label">Staff Group: <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                <select  class="select-full" name="staffgroup" id="staffgroup" required>
                                    <option value="">Select group</option>
                                    <option  <?php if($e_user['staff_group'] === '1') echo 'selected="selected"';?> value="1">Scientist</option>
                                    <option  <?php if($e_user['staff_group'] === '2') echo 'selected="selected"';?> value="2">Supervisor</option>
                                    <option  <?php if($e_user['staff_group'] === '3') echo 'selected="selected"';?> value="3">Volunteer</option>
                                    <option  <?php if($e_user['staff_group'] === '4') echo 'selected="selected"';?> value="3">Data Clerk</option>
                                    <option  <?php if($e_user['staff_group'] === '5') echo 'selected="selected"';?> value="3">Laboratory Technician</option>
                                                      
                                </select>
                            </div>
                        </div>

                            <div class="form-group">
                            <label class="col-sm-2 control-label">Status : <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                <select  class="select-full" name="staffstatus" id="staffstatus" required >
                                    <option value="">Select status</option>
                                    <option  <?php if($e_user['status'] === '1') echo 'selected="selected"';?> value="1">Enable</option>
                                    <option  <?php if($e_user['status'] === '2') echo 'selected="selected"';?> value="2">Disable</option>
                                                                                
                                </select>
                            </div>
                        </div>

                        <div class="form-actions text-right">
                            <button name="updatedet" type="submit" id="updatedet" class="btn btn-primary"  ><i class="fa fa-check" aria-hidden="true"></i> Update</button>
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
			
	
           