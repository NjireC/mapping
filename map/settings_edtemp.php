<?php 

/**
* Created by Dickson Msaky @ Ifakara Health Insitute (2018)
**/
require_once('includes/load.php');
$page_title = 'Settings | MosquitoDB'; 
page_require_level(2);
include_once('layouts/head.php');

$formtype = "ED1";
$table = "custed";




if(isset($_SESSION['expcode'])){


$expcode = $_SESSION['expcode'];
$prefixtable = $expcode."_";


$temptypeme = "me";
$tableme = $prefixtable."method";

$temptypeht = "ht";
$tableht = $prefixtable."habitattype";

$temptypeea = "ea";
$tableea = $prefixtable."enumerationarea";

$temptypecr = "cr";
$tablecr = $prefixtable."cluster";

$temptypecp = "cp";
$tablecp = $prefixtable."compound";

$temptypetr = "tr";
$tabletr = $prefixtable."treatment";

$temptypeed1temp = "ed1template";
$tableed1temp = $prefixtable."ed1template";


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
  

 	<div class="row">  <!-- Begin row 1   -->
 		<div class="col-md-6">

 			<!-- col1 -->
 			<div class="panel panel-default">
 				<div class="panel-heading">
 					<h6 class="panel-title">Method</h6>

					<div class="btn-group pull-right">
		             <form action="scripts/exporttemplate.php" method="post" >

		             	 

		               <button type="submit" name='downloadtemp' class="btn btn-default"><i class="fa fa-download"></i>Download</button>

		               <button onClick="confirm_msg(event);" type="submit" name='deleteall' id='deleteall' class="btn btn-default"> <i class="fa fa-trash-o"></i> </button>

		            
		              
		              <input type="hidden" name="te" value="<?php echo $temptypeme; ?>" >  
		              <input type="hidden" name="ta" value="<?php echo $tableme; ?>" >  

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

 								 <input type="hidden" name="fo" value="<?php echo $temptypeme; ?>" >  
                                 <input type="hidden" name="ta" value="<?php echo $tableme; ?>" > 

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
					           data-height="200"
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
				                    $query = $db->query("SELECT * FROM {$db->escape($tableme)} ORDER BY id ASC");
				                    if($query->num_rows > 0){ 
				                        while($row = $query->fetch_assoc()){ ?>
				                    <tr>
				                      <td><?php echo $row['number']; ?></td>
				                      <td><?php echo $row[$temptypeme]; ?></td>
				                    
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
 					<h6 class="panel-title">Habitat Type</h6>

 					<div class="btn-group pull-right">
		             <form action="scripts/exporttemplate.php" method="post">

		              <button type="submit" name='downloadtemp' class="btn btn-default"><i class="fa fa-download"></i>Download</button>

		               <button onClick="confirm_msg(event);" type="submit" name='deleteall' id='deleteall' class="btn btn-default"> <i class="fa fa-trash-o"></i> </button>


		              <input type="hidden" name="te" value="<?php echo $temptypeht; ?>" >  
		              <input type="hidden" name="ta" value="<?php echo $tableht; ?>" >  

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

 								 <input type="hidden" name="fo" value="<?php echo $temptypeht; ?>" >  
                                 <input type="hidden" name="ta" value="<?php echo $tableht; ?>" > 

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
				                    $query = $db->query("SELECT * FROM {$db->escape($tableht)} ORDER BY id ASC");
				                    if($query->num_rows > 0){ 
				                        while($row = $query->fetch_assoc()){ ?>
				                    <tr>
				                      <td><?php echo $row['number']; ?></td>
				                      <td><?php echo $row[$temptypeht]; ?></td>
				                    
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
 	</div> <!-- End row 1   -->

 	<div class="row">  <!-- Begin row 2   -->
 		<div class="col-md-6">

 			<!-- col1 -->
 			<div class="panel panel-default">
 				<div class="panel-heading">
 					<h6 class="panel-title">Enumeration area</h6>

					<div class="btn-group pull-right">
		             <form action="scripts/exporttemplate.php" method="post">

		             	 

		              <button type="submit" name='downloadtemp' class="btn btn-default"><i class="fa fa-download"></i>Download</button>

		              <button onClick="confirm_msg(event);" type="submit" name='deleteall' id='deleteall' class="btn btn-default"> <i class="fa fa-trash-o"></i> </button>

		              
		              <input type="hidden" name="te" value="<?php echo $temptypeea; ?>" >  
		              <input type="hidden" name="ta" value="<?php echo $tableea; ?>" >  

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

 								 <input type="hidden" name="fo" value="<?php echo $temptypeea; ?>" >  
                                 <input type="hidden" name="ta" value="<?php echo $tableea; ?>" > 

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
				                    $query = $db->query("SELECT * FROM {$db->escape($tableea)} ORDER BY id ASC");
				                    if($query->num_rows > 0){ 
				                        while($row = $query->fetch_assoc()){ ?>
				                    <tr>
				                      <td><?php echo $row['number']; ?></td>
				                      <td><?php echo $row[$temptypeea]; ?></td>
				                    
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
 					<h6 class="panel-title">Cluster</h6>

 					<div class="btn-group pull-right">
		             <form action="scripts/exporttemplate.php" method="post">

		              <button type="submit" name='downloadtemp' class="btn btn-default"><i class="fa fa-download"></i>Download</button>

		               <button onClick="confirm_msg(event);" type="submit" name='deleteall' id='deleteall' class="btn btn-default"> <i class="fa fa-trash-o"></i> </button>


		              <input type="hidden" name="te" value="<?php echo $temptypecr; ?>" >  
		              <input type="hidden" name="ta" value="<?php echo $tablecr; ?>" >  

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

 								 <input type="hidden" name="fo" value="<?php echo $temptypecr; ?>" >  
                                 <input type="hidden" name="ta" value="<?php echo $tablecr; ?>" > 

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
				                    $query = $db->query("SELECT * FROM {$db->escape($tablecr)} ORDER BY id ASC");
				                    if($query->num_rows > 0){ 
				                        while($row = $query->fetch_assoc()){ ?>
				                    <tr>
				                      <td><?php echo $row['number']; ?></td>
				                      <td><?php echo $row[$temptypecr]; ?></td>
				                    
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


<div class="row">  <!-- Begin row 3   -->
 		<div class="col-md-6">

 			<!-- col1 -->
 			<div class="panel panel-default">
 				<div class="panel-heading">
 					<h6 class="panel-title">Compound</h6>

					<div class="btn-group pull-right">
		             <form action="scripts/exporttemplate.php" method="post">

		             	 

		              <button type="submit" name='downloadtemp' class="btn btn-default"><i class="fa fa-download"></i>Download</button>

		             <button onClick="confirm_msg(event);" type="submit" name='deleteall' id='deleteall' class="btn btn-default"> <i class="fa fa-trash-o"></i> </button>

		              
		              <input type="hidden" name="te" value="<?php echo $temptypecp; ?>" >  
		              <input type="hidden" name="ta" value="<?php echo $tablecp; ?>" >  

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

 								 <input type="hidden" name="fo" value="<?php echo $temptypecp; ?>" >  
                                 <input type="hidden" name="ta" value="<?php echo $tablecp; ?>" > 

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
				                    $query = $db->query("SELECT * FROM {$db->escape($tablecp)} ORDER BY id ASC");
				                    if($query->num_rows > 0){ 
				                        while($row = $query->fetch_assoc()){ ?>
				                    <tr>
				                      <td><?php echo $row['number']; ?></td>
				                      <td><?php echo $row[$temptypecp]; ?></td>
				                    
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
 					<h6 class="panel-title">Treatment</h6>

 					<div class="btn-group pull-right">
		             <form action="scripts/exporttemplate.php" method="post">

		              <button type="submit" name='downloadtemp' class="btn btn-default"><i class="fa fa-download"></i>Download</button>

		               <button onClick="confirm_msg(event);" type="submit" name='deleteall' id='deleteall' class="btn btn-default"> <i class="fa fa-trash-o"></i> </button>


		              <input type="hidden" name="te" value="<?php echo $temptypetr; ?>" >  
		              <input type="hidden" name="ta" value="<?php echo $tabletr; ?>" >  

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

 								 <input type="hidden" name="fo" value="<?php echo $temptypetr; ?>" >  
                                 <input type="hidden" name="ta" value="<?php echo $tabletr; ?>" > 

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
				                    $query = $db->query("SELECT * FROM {$db->escape($tabletr)} ORDER BY id ASC");
				                    if($query->num_rows > 0){ 
				                        while($row = $query->fetch_assoc()){ ?>
				                    <tr>
				                      <td><?php echo $row['number']; ?></td>
				                      <td><?php echo $row[$temptypetr]; ?></td>
				                    
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
 	</div> <!-- End row 3   -->
	

 	<div class="panel panel-default">
 		<div class="panel-heading"><h6 class="panel-title">Experimental Design General Template </h6>

 			<div class="btn-group pull-right">
 				<form action="scripts/exportgeneraltemplate.php" method="post">

 					<button type="submit" name='downloadtemp' class="btn btn-default"><i class="fa fa-download"></i>Download</button>

 					 <button onClick="confirm_msg(event);" type="submit" name='deleteall' id='deleteall' class="btn btn-default"> <i class="fa fa-trash-o"></i> </button>

 					 
 					 <input type="hidden" name="te" value="<?php echo $temptypeed1temp; ?>" >  
 					 <input type="hidden" name="ta" value="<?php echo $tableed1temp; ?>" >  
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

 								 <input type="hidden" name="fo" value="<?php echo $temptypeed1temp; ?>" >  
                                 <input type="hidden" name="ta" value="<?php echo $tableed1temp; ?>" > 
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
				                    $query = $db->query("SELECT $columns FROM {$db->escape($tableed1temp)} ORDER BY id ASC");
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
			
	
           