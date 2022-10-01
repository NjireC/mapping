<?php

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
 **/

require_once('includes/load.php');
$page_title = 'Home';
page_require_level(3);
include_once('layouts/head.php');

?>

<!-- Page content -->
<div class="page-content">
	<!-- Page title -->
	<div class="page-title">
		<h5><i class="fa fa-bars"></i> Home <small>Welcome, <?php echo $name;  ?> </small></h5>
	</div>

	<!-- /page title -->
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h6 class="panel-title"> Dataset Table For: <span id="pname"></span> </h6>
			<div class="btn-group pull-right">

				<?php include_once('scripts/selectproject.php'); ?>

			</div>
		</div>
	</div>

	<div class="panel panel-default">
		<div class="panel-heading">
			<h6 class="panel-title">Project Add</h6>
		</div>
		<div class="panel-body">


		</div>
	</div>


	<div class="row">
		<div class="col-md-6">

			<!-- col1 -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h6 class="panel-title">Method</h6>
				</div>
				<div class="panel-body">
					<div class="graph-standard" id="vertical_bars"></div>
				</div>
			</div>
			<!-- /col1 -->

		</div>

		<div class="col-md-6">

			<!-- col2 -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h6 class="panel-title">Location</h6>
				</div>
				<div class="panel-body">
					<div class="graph-standard" id="horizontal_bars"></div>
				</div>
			</div>
			<!-- /col2 -->

		</div>
	</div>

	<?php include_once('layouts/foot.php'); ?>