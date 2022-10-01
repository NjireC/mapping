<?php 
require_once('includes/load.php');
$page_title = 'Error'; 
page_require_level(3);
include_once('layouts/head.php');

 ?>
 	
 <!-- Page content -->
 <div class="page-content">
 	<!-- Page title -->
 	<div class="page-title">
 		<h5><i class="fa fa-bars"></i> Home <small>Welcome, <?php   echo $name;  ?> </small></h5>
 	</div>


  <!-- Error -->
    <div class="error-wrapper text-center">
        <h1>404</h1>
        <h5>Sorry, An error has occurred. Page not found!</h5>

        <div class="error-content">
            <div class="row">
                 <a href="home.php" class="btn btn-primary btn-block">Back to the Home</a>
            </div>
        </div>
       

    </div>  
    <!-- /Error -->

    <br /><br />


<?php include_once('layouts/foot.php'); ?>		
			
	
           