<?php

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
 **/

require_once('includes/load.php');
$page_title = 'Manage User | MosquitoDB';
page_require_level(1);
include_once('layouts/head.php');

$users = join_users_table();

?>
<!-- Page content -->
<div class="page-content">

  <?php echo display_msg_popup($msg);  ?>

  <!-- Page title -->
  <div class="page-title">
    <h5><i class="fa fa-bars"></i> Home <small>Welcome, <?php echo $name;  ?> </small></h5>
  </div>


  <!--  table -->
  <div class="panel panel-default">
    <div class="panel-heading">
      <h6 class="panel-title">Manage User</h6>


    </div>

    <div class="table-responsive has-padding2 animate__animated animate__slideInUp">

      <table id="table" class="table" data-toggle="table" data-pagination="true" data-show-refresh="false" data-show-columns="true" data-toolbar="#toolbar" data-page-size="10" data-page-list="[10, 25, 50, 100, ALL]" data-show-export="false" data-export-options='{"fileName": "Users"}' data-search="true">
        <thead>
          <tr>
            <th>#</th>
            <th>ID</th>
            <th>First name</th>
            <th>Last name</th>
            <th>Staff Category</th>
            <th>Level</th>
            <th>Phone</th>
            <th>Status</th>
            <th>Action</th>
          </tr>
        </thead>

        <tbody>
          <?php foreach ($users as $user) : ?>
            <tr>
              <td><?php echo count_id(); ?></td>
              <td> <?php echo remove_junk($user['staff_id']); ?></td>
              <td> <?php echo remove_junk($user['fname']); ?></td>
              <td> <?php echo remove_junk($user['lname']); ?></td>
              <td> <?php echo remove_junk($user['category']); ?></td>
              <td> <?php echo remove_junk($user['groupname']); ?></td>
              <td> <?php echo remove_junk($user['mobinum']); ?></td>
              <td class="text-center">
                <?php if ($user['status'] === '1') : ?>
                  <span class="label label-success"><?php echo "Active"; ?></span>
                <?php else : ?>
                  <span class="label label-danger"><?php echo "Deactive"; ?></span>
                <?php endif; ?>
              </td>

              <td class="text-center">
                <div class="">
                  <a href="user_manage_e.php?id=<?php echo (int)$user['staff_id']; ?>" class="btn btn-lg btn-info" title="Edit" data-toggle="tooltip">
                    <i class="fa fa-pencil" style="color:white"> Edit </i>
                  </a>
                  <a onclick="javascript:confirmationDelete($(this));return false;" href="scripts/user_delete.php?id=<?php echo (int)$user['staff_id']; ?>" class="btn btn-lg btn-danger" title="Delete" data-toggle="tooltip">
                    <i class="fa fa-trash-o" style="color:white"> Delete </i>
                  </a>
                </div>
              </td>
            </tr>
          <?php endforeach; ?>
        </tbody>

      </table>

    </div>

  </div>
  <!--  table -->

  <script type="text/javascript">
    $(function() {
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