<?php
require_once('includes/load.php');
$page_title = 'Error | MosquitoDB';
page_require_level(3);
include_once('layouts/head.php');

?>

<!-- Page content -->
<div class="page-content">
    <!-- Page title -->
    <div class="page-title">
        <h5><i class="fa fa-bars"></i> Home <small>Welcome, <?php echo $name;  ?> </small></h5>
    </div>


    <!-- Error -->
    <div class="error-wrapper text-center">
        <span><i class="fa fa-exclamation-triangle fa-5x" aria-hidden="true"></i></span>
        <h5>Sorry, You don't have sufficient permissions for this action!</h5>

        <div class="error-content">
            <div class="row">
                <a href="home.php" class="btn btn-primary btn-block">Back to the Home</a>
            </div>
        </div>


    </div>
    <!-- /Error -->

    <br /><br />


    <?php include_once('layouts/foot.php'); ?>