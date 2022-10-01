<?php 

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
**/

require_once('includes/load.php');
$page_title = 'Branding'; 
page_require_level(1);
include_once('layouts/head.php');

?>
 	
 <!-- Page content -->
 <div class="page-content">
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


 	<div class="panel panel-primary">
 	       <div class="panel-heading"><h6 class="panel-title"> Site Branding </h6></div>
 		<div class="panel-body">

 			<form class="form-horizontal form-bordered" action="#" role="form">

 				<div class="form-group">
 					<label class="col-sm-2 control-label">Site Name:</label>
 					<div class="col-sm-10">
 						<input type="text" class="form-control">
 					</div>
 				</div>


			 <div class="form-group">
			        <label class="col-sm-2 control-label">Change theme colour: <span class="mandatory">*</span></label>
			        <div class="col-sm-10">
			            <select  class=" form-control" name="colour" id="colour" required>
			                <option value="">Select colour</option>
			                <option  <?php if($current_user['theme'] === '1') echo 'selected="selected"';?> value="1">Green</option>
			                <option  <?php if($current_user['theme'] === '2') echo 'selected="selected"';?> value="2">Aqua</option>
			                <option  <?php if($current_user['theme'] === '3') echo 'selected="selected"';?> value="3">Black</option>
			                <option  <?php if($current_user['theme'] === '4') echo 'selected="selected"';?> value="4">Blue</option>
			             
			            </select>
			        </div>
			    </div>


 				<br /><br />

 				<div class="footer">
 					<div class="form-actions">
 						<button type="submit" class="btn btn-default">Cancel</button>
 						<div class="pull-right">
 							<button type="submit" class="btn btn-primary">Submit</button>   
 						</div>
 					</div>
 				</div>


 			</form>


 		</div>
 	</div>




<?php include_once('layouts/foot.php'); ?>		
			
	
           