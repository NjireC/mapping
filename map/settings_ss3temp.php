<?php 

/**
* Created by Dickson Msaky @ Ifakara Health Insitute (2018)
**/
require_once('includes/load.php');
$page_title = 'Settings | MosquitoDB'; 
page_require_level(2);
include_once('layouts/head.php');

$formtype = "SS3";
$table = "custss";


if(isset($_SESSION['expcode'])){


$expcode = $_SESSION['expcode'];
$prefixtable = $expcode."_";



$temptypetx = "taxon";
$tabletx = $prefixtable."taxon";

$temptypesas = "sas";
$tablesas = $prefixtable."sas";


$temptypess1temp = "ss3template";
$tabless1temp = $prefixtable."ss3template";


}

$fields_array = array();

$columns = getcolumnname($_SESSION['expcode'],$table,$formtype);  

$columns2 = getcolumnname2($_SESSION['expcode'],$table,$formtype);  

$fields_array = explode(",",$columns2);

?>


<script type="text/javascript" >

function confirm_msg(e) {

	if(confirm('Are you sure want to delete this? This action is irrevesible'));

	else {
		
		e.preventDefault();
	}

}


</script>
 	
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
 			<h6 class="panel-title"> Template Customize:   <span id="pname"></span>  </h6>
 			<div class="btn-group pull-right">

 				<?php include_once('scripts/selectproject.php'); ?>

 			</div>
 		</div>
 	</div>

 	 <?php include_once('layouts/settingsmenu.php'); ?>

  <br />


 	<div class="row">  <!-- Begin row 2   -->
 		<div class="col-md-6">

 			<!-- col1 -->
 			<div class="panel panel-default">
 				<div class="panel-heading">
 					<h6 class="panel-title">Taxon</h6>

					<div class="btn-group pull-right">
		             <form action="scripts/exporttemplate.php" method="post">

		             	 

		              <button type="submit" name='downloadtemp' class="btn btn-default"><i class="fa fa-download"></i>Download</button>

		              <button onClick="confirm_msg(event);" type="submit" name='deleteall' id='deleteall' class="btn btn-default"> <i class="fa fa-trash-o"></i> </button>

		              
		              <input type="hidden" name="te" value="<?php echo $temptypetx; ?>" >  
		              <input type="hidden" name="ta" value="<?php echo $tabletx; ?>" >  

		            </form> 
		           </div>


 				</div>
 				<div class="panel-body">

 					<div class="container-fluid">
 						<div class="row">
 							<form action="scripts/importtemplate.php" method="post" enctype="multipart/form-data" id="importFrm">
 								<div class="col-md-6">
 									<input type="file" name="file" id="file" class="btn btn-primary"/>
 								</div>
 								<div class="col-md-6 text-right">
 									<input type="submit" class="btn btn-primary" name="importSubmit" value="IMPORT">
 								</div>

 								 <input type="hidden" name="fo" value="<?php echo $formtypetx; ?>" >  
                                 <input type="hidden" name="ta" value="<?php echo $tabletx; ?>" > 

 							</form>
 						</div>

 						<hr />

 						<div class="row">
                           <table 
					           id="table" 
					           class="table table-hover table-striped table-responsive table-bordered"
					           data-toggle="table"
					           data-pagination="false"
					           data-show-refresh="false"
					           data-show-columns="false"
					           data-height=""
					           data-show-export="false"
					           data-search="false">
					            <thead>
				                    <tr>
				                      <th>Number</th>
				                      <th>Text</th>
				                     
				                    </tr>
				                </thead>
				                <tbody>
				                <?php
				                    //get records from database
				                    $query = $db->query("SELECT * FROM {$db->escape($tabletx)} ORDER BY id ASC");
				                    if($query->num_rows > 0){ 
				                        while($row = $query->fetch_assoc()){ ?>
				                    <tr>
				                      <td><?php echo $row['number']; ?></td>
				                      <td><?php echo $row['text']; ?></td>
				                    
				                    </tr>
				                    <?php } }else{ ?>
				                    <tr><td colspan="2">No record(s) found  ...</td></tr>
				                    <?php } ?>
				                </tbody>
				            </table>
 						  
 						</div>	
 					</div>

 				</div>
 			
 			</div>

 			<!-- col1 -->

 		</div>

 		<div class="col-md-6">

 			<!-- col2 -->
 			<div class="panel panel-default">
 				<div class="panel-heading">
 					<h6 class="panel-title">Sex & abdominal status</h6>

 					<div class="btn-group pull-right">
		             <form action="scripts/exporttemplate.php" method="post">

		              <button type="submit" name='downloadtemp' class="btn btn-default"><i class="fa fa-download"></i>Download</button>

		               <button onClick="confirm_msg(event);" type="submit" name='deleteall' id='deleteall' class="btn btn-default"> <i class="fa fa-trash-o"></i> </button>


		              <input type="hidden" name="te" value="<?php echo $temptypesas; ?>" >  
		              <input type="hidden" name="ta" value="<?php echo $tablesas; ?>" >  

		            </form> 
		           </div>
 				</div>
 				<div class="panel-body">
 					

 					<div class="container-fluid">
 						<div class="row">
 							<form action="scripts/importtemplate.php" method="post" enctype="multipart/form-data" id="importFrm">
 								<div class="col-md-6">
 									<input type="file" name="file" id="file" class="btn btn-primary"/>
 								</div>
 								<div class="col-md-6 text-right">
 									<input type="submit" class="btn btn-primary" name="importSubmit" value="IMPORT">
 								</div>

 								 <input type="hidden" name="fo" value="<?php echo $formtypesas; ?>" >  
                                 <input type="hidden" name="ta" value="<?php echo $tablesas; ?>" > 

 							</form>
 						</div>

 						<hr />

 						<div class="row">
                           <table 
					           id="table" 
					           class="table table-hover table-striped table-responsive table-bordered"
					           data-toggle="table"
					           data-pagination="false"
					           data-show-refresh="false"
					           data-show-columns="false"
					           data-height=""
					           data-show-export="false"
					           data-search="false">
					            <thead>
				                    <tr>
				                      <th>Number</th>
				                      <th>Text</th>
				                     
				                    </tr>
				                </thead>
				                <tbody>
				                <?php
				                    //get records from database
				                    $query = $db->query("SELECT * FROM {$db->escape($tablesas)} ORDER BY id ASC");
				                    if($query->num_rows > 0){ 
				                        while($row = $query->fetch_assoc()){ ?>
				                    <tr>
				                      <td><?php echo $row['number']; ?></td>
				                      <td><?php echo $row['text']; ?></td>
				                    
				                    </tr>
				                    <?php } }else{ ?>
				                    <tr><td colspan="2">No record(s) found  ...</td></tr>
				                    <?php } ?>
				                </tbody>
				            </table>
 						  
 						</div>	
 					</div>


 				</div>
 			</div>
 			<!-- /col2 -->

 		</div>
 	</div> <!-- End row 2   -->





 	<div class="panel panel-default">
 		<div class="panel-heading"><h6 class="panel-title">Sample Sorting General Template </h6>

 			<div class="btn-group pull-right">
 				<form action="scripts/exportgeneraltemplate.php" method="post">

 					<button type="submit" name='downloadtemp' class="btn btn-default"><i class="fa fa-download"></i>Download</button>

 					 <button onClick="confirm_msg(event);" type="submit" name='deleteall' id='deleteall' class="btn btn-default"> <i class="fa fa-trash-o"></i> </button>

 					 
 					 <input type="hidden" name="te" value="<?php echo $temptypess1temp; ?>" >  
 					 <input type="hidden" name="ta" value="<?php echo $tabless1temp; ?>" >  
 					 <input type="hidden" name="te1" value="<?php echo $formtype; ?>" >  
                     <input type="hidden" name="ta1" value="<?php echo $table; ?>" >  

 				</form> 

 			</div>

 		</div>
 		<div class="panel-body">


 				<div class="container-fluid">
 						<div class="row">
 							<form action="scripts/importgeneraltemplate.php" method="post" enctype="multipart/form-data" id="importFrm">
 								<div class="col-md-6">
 									<input type="file" name="file" id="file" class="btn btn-primary"/>
 								</div>
 								<div class="col-md-6 text-right">
 									<input type="submit" class="btn btn-primary" name="importSubmit" value="IMPORT">
 								</div>

 								 <input type="hidden" name="fo" value="<?php echo $temptypess1temp; ?>" >  
                                 <input type="hidden" name="ta" value="<?php echo $tabless1temp; ?>" > 
                                 <input type="hidden" name="fo1" value="<?php echo $formtype; ?>" >  
                                 <input type="hidden" name="ta1" value="<?php echo $table; ?>" >  

 							</form>
 						</div>

 						<hr />

 						<div class="row">
                           <table 
					           id="table" 
					           class="table table-hover table-striped table-responsive table-bordered"
					           data-toggle="table"
					           data-pagination="false"
					           data-show-refresh="false"
					           data-show-columns="false"
					           data-height="500"
					           data-show-export="false"
					           data-search="false">
					          <thead>
				                    <tr>
				                     <?php
                                      
                                       foreach($fields_array as $field){

										  echo '<th>'.$field.'</th>';

										 }

				                     ?>
				                    </tr>
				                </thead>
				                <tbody>
				                <?php
				                
				                   if (strlen($columns)>0) {
				                    //get records from database
				                    $query = $db->query("SELECT $columns FROM {$db->escape($tabless1temp)} ORDER BY id ASC");
				                    if($query->num_rows > 0){ 
				                        while($row = $query->fetch_assoc()){ ?>
				                    <tr>

				                    <?php
                                      
                                       foreach($row as $field => $columnvalue){

										  echo '<td>'.$columnvalue.'</td>';

										 }

				                     ?>
				                                           	                     
				                    </tr>
				                    <?php } }else{ ?>
				                    <tr><td colspan="2">No record(s) found  ...</td></tr>
				                    <?php } ?>

				                     <?php }else{ ?>
				                    <tr><td colspan="2">No record(s) found  ...</td></tr>
				                    <?php } ?>


				                </tbody>
				            </table>
 						 
 						</div>	
 					</div>


 		</div>
 	</div>


	              
<?php include_once('layouts/foot.php'); ?>		
			
	
           