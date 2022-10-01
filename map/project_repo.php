<?php 
/**
* Created by Dickson Msaky @ Ifakara Health Insitute (2018)
**/
require_once('includes/load.php');
$page_title = 'Project | MosquitoDB'; 
page_require_level(2);
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
 			<h6 class="panel-title"> Project Repository:   <span id="pname"></span>  </h6>
 			<div class="btn-group pull-right">

 				

 			</div>
 		</div>
 	</div>


 	              





<?php include_once('layouts/foot.php'); ?>		
			
	
           