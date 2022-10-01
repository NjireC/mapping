<?php 

/**
* Created by Dickson Msaky @ Ifakara Health Insitute (2018)
**/
require_once('includes/load.php');
$page_title = 'Settings | MosquitoDB'; 
page_require_level(2);
include_once('layouts/head.php');

$historys = find_all_by("history_log","user_id",$staff_id);

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

 	 

   <!--  table -->
   <div class="panel panel-default">
    <div class="panel-heading"><h6 class="panel-title">Settings</h6>
      
    </div>
    <div class="table-responsive has-padding2">

     <table id="table" class="table"
     data-toggle="table"
     data-pagination="true"
     data-show-refresh="false"
     data-show-columns="true"
     data-toolbar="#toolbar"
     data-page-size="10"
     data-page-list="[10, 25, 50, 100, ALL]"
     data-show-export="false"
     data-export-options='{"fileName": "logs"}'
     data-search="true">
     <thead>
      <tr>
        <th>#</th>
        <th>Username</th>
        <th>Action</th>
        <th>Date</th>            

      </tr>
    </thead>

    <tbody>
      <?php foreach ($historys as $history):?>
        <tr>
          <td ><?php echo count_id();?></td>
          <td> <?php echo remove_junk($history['user_name']); ?></td>
          <td > <?php echo remove_junk($history['action']); ?></td>
          <td> <?php echo remove_junk($history['date']); ?></td>                

        </tr>
      <?php endforeach; ?>
    </tbody>

  </table>

</div>
</div>
<!--  table -->
                  
             


	<script type="text/javascript">
	  
	$(function () {
	    $('#table').bootstrapTable({
	        pagination: true,
	        pageSize: 10,
	        paginationVAlign: 'bottom',
          paginationFirstText: "First",
          paginationLastText: "Last",
          paginationPreText: "Previous",
          paginationNextText: "Next"
	    });
	});

	</script>

<?php include_once('layouts/foot.php'); ?>		
			
	
           