<?php

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
 **/
require_once('includes/load.php');
$page_title = 'Manage Project | MosquitoDB';
page_require_level(2);
include_once('layouts/head.php');
//$projects = join_project_table();

$projects = join_project_table_granted($staff_id);



?>
<!-- Page content -->
<div class="page-content">
  <?php echo display_msg_popup($msg);  ?>
  <div class="page-title">
    <h5><i class="fa fa-bars"></i> Home <small>Welcome, <?php echo $name;  ?> </small></h5>
  </div>
  <!-- /page title -->

  <!--  table -->
  <div class="panel panel-default">
    <div class="panel-heading">
      <h6 class="panel-title">Manage Project</h6>
      <div class="btn-group pull-right">
        <a role="button" href="project_add.php" class="btn btn-primary"> <i class="fa fa-plus"></i>Add Project</a>

      </div>

    </div>
    <div class="table-responsive has-padding2 animate__animated animate__slideInUp">

      <table id="table" class="table" data-toggle="table" data-pagination="true" data-show-refresh="true" data-show-columns="true" data-toolbar="#toolbar" data-page-size="10" data-page-list="[10, 25, 50, 100, ALL]" data-show-export="false" data-export-options='{"fileName": "Project"}' data-search="true">
        <thead>
          <tr>
            <th>#</th>
            <th>Project code</th>
            <th>Experiment</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Project site</th>
            <th>Users with access</th>
            <th>Project access</th>
            <th>Action</th>
          </tr>
        </thead>

        <tbody>
          <?php foreach ($projects as $project) : ?>
            <tr>
              <td class="tableproject"><?php echo count_id(); ?></td>
              <td class="tableproject"> <?php echo remove_junk($project['pc']); ?></td>
              <td class="tableproject"> <?php echo remove_junk($project['expno']); ?></td>
              <td class="tableproject"> <?php echo remove_junk($project['esd']); ?></td>
              <td class="tableproject"> <?php echo remove_junk($project['efd']); ?></td>
              <td class="tableproject"> <?php echo remove_junk(findsitename($project['site_id'])); ?></td>
              <td class="tableproject">

                <?php
                $query = $db->query("SELECT * FROM grantproject  WHERE pid ='{$project['id']}' ORDER BY staff_id ASC");
                $rowCount = $query->num_rows;
                $gpa = array();

                while ($row = $query->fetch_assoc()) {

                  $gpa[] = " " . findstaffname($row['staff_id']) . " ";
                }
                echo implode(',', $gpa);


                ?>

              </td>
              <td class="tableproject"> <a href="project_manage_grantac.php?id=<?php echo (int)$project['id']; ?>" class="btn btn-primary" title="Grant/Revoke" data-toggle="tooltip">
                  Grant / Revoke
                </a>
              </td>

              <td class="text-center tableproject">
                <a href="project_manage_e.php?id=<?php echo (int)$project['id']; ?>" class="btn btn-danger" title="Edit" data-toggle="tooltip">
                  <i class="fa fa-pencil" style="color:white"> Edit</i>
                </a>
                <a href="project_manage_addexp.php?id=<?php echo (int)$project['id']; ?>" class="btn btn-info" title="Experiment" data-toggle="tooltip">
                  <i class="fa fa-plus" style="color:white"> Experiment </i>
                </a>

              </td>
            </tr>
          <?php endforeach; ?>
        </tbody>

      </table>

    </div>
  </div>
  <!--  table -->



  <script type="text/javascript">
    $(document).ready(function() {
      $.ajax({
        type: 'POST',
        url: 'scripts/getsites.php',
        success: function(html) {
          $('#site_id').html(html);

        }
      });

      $.ajax({
        type: 'POST',
        url: 'scripts/getnames.php',
        success: function(html) {
          $('#rsn').html(html);

        }
      });

      $.ajax({
        type: 'POST',
        url: 'scripts/getnames.php',
        success: function(html) {
          $('#pin').html(html);

        }
      });




    });
  </script>


  <?php include_once('layouts/foot.php'); ?>