<?php

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
 **/
require_once('includes/load.php');
page_require_level(3);
$page_title = 'FAQ | MosquitoDB';
include_once('layouts/head.php');
?>

<!-- Page content -->
<div class="page-content">
	<!-- Page title -->
	<div class="page-title">
		<h5><i class="fa fa-bars"></i> Home <small>Welcome, <?php echo $name;  ?> </small></h5>
	</div>

	<div class="jumbotron">
		<div class="container">
			<div class="page-header ">
				<h2 class="text-center">Frequently Asked Questions </h2>
			</div>
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
								How do I use the system? </a>
						</h4>
					</div>
					<div id="collapseFour" class="panel-collapse collapse ">
						<div class="panel-body">
							<ol>
								<li>PI needs to add the project</li>
								<li>PI has to grant access to his/her project(s) to intended users</li>
								<li>PI has to customize ED and SO1 templates where applicable (e.g, ED1)</li>
								<li>Users need to select the form to upload data - first select project code & Exp no plus the site</li>
								<li>Users can then download a required template to upload data</li>
								Make sure the key values are filled in correctly
								Make sure the serial numbers, form row numbers between the source and destination forms matches where applicable
								<li>Users can download linked data from a given project - select project code and data format</li>
							</ol>

						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
								How do i view uploaded data? </a>
						</h4>
					</div>
					<div id="collapseFive" class="panel-collapse collapse">
						<div class="panel-body">
							..................................................
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseSix">
									How do i generate one flat file linking all my data? </a>
							</h4>
						</div>
						<div id="collapseSix" class="panel-collapse collapse">
							<div class="panel-body">
								....................................
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>

	<?php include_once('layouts/foot.php'); ?>