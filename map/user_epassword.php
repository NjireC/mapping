<?php 

/**
* Created by Dickson Msaky @ Ifakara Health Insitute (2018)
**/

require_once('includes/load.php');
$page_title = 'Change Password | MosquitoDB'; 
page_require_level(3);
include_once('layouts/head.php');

?>
 <!-- Page content -->
 <div class="page-content">

               <?php echo display_msg_popup($msg);  ?>

 	<!-- Page title -->
 	<div class="page-title">
 		<h5><i class="fa fa-bars"></i> Home <small>Welcome, <?php   echo $name;  ?> </small></h5>
 	</div>
 	
 	<!-- Form -->
            <form class="form-horizontal" action="scripts/updatepwd.php" role="form"  method="post">
                <div class="panel panel-default">
                    <div class="panel-heading"><h6 class="panel-title">Change password</h6></div>
                    <div class="panel-body">
                
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Old password: <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                <input type="password" class=" form-control" name="oldpwd" id="oldpwd"  required>
                            </div>
                        </div>

                        <div id="fpwd1" class="form-group">
                            <label class="col-sm-2 control-label">New password: <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="password" id="password"  onkeyup="CheckPasswordStrength(this.value)" data-toggle="tooltip" data-trigger="focus" title="Password must be greater 6,lowercase,Uppercase and special characters" required/>
                                      <span id="password_strength"></span>
                            </div>
                        </div>

                        <div id="fpwd2" class="form-group">
                            <label class="col-sm-2 control-label">Confirm new password: <span class="mandatory">*</span></label>
                            <div class="col-sm-10">
                              <input type="password" class="form-control" name="password2" id="password2" onkeyup="checkPass(); return false;" required>
                         <span id="confirmMessage" class="confirmMessage"></span>
                            </div>
                        </div>
                        

                        <div class="form-actions text-right">
                            <button name="Register" type="submit" id="Register" class="btn btn-primary"  >Update</button>
                        </div>

                    </div>
                    
                </div>
            </form>
            <!-- /form  -->

<?php include_once('layouts/foot.php'); ?>		
			
	
           