<?php

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
 **/
require_once('includes/load.php');
$page_title = 'Profile | MosquitoDB';
page_require_level(3);
include_once('layouts/head.php');

$query = "SELECT * FROM staff INNER JOIN staffcategory ON  (staff.staff_group = staffcategory.id) WHERE staff.staff_id='" . $current_user["staff_id"] . "'";

$result =  $db->query($query);

if ($result) {
  $row = mysqli_fetch_array($result);
}
if (!$result) {

  header("location: home.php");
}

?>

<!-- Page content -->
<div class="page-content">

  <div class="panel panel-primary">
    <div class="panel-heading">
      <h3 class="panel-title"><?php echo $current_user['fname'] . " " . $current_user['mname'] . " " . $current_user['lname']; ?> </h3>
    </div>
    <div class="panel-body">
      <div class="row">
        <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="assets/images/user3.png" class="img-circle img-responsive"> </div>

        <div class=" col-md-9 col-lg-9 ">
          <table class="table table-user-information">
            <tbody>
              &nbsp
              <tr>
                <td>ID:</td>
                <td><?php echo $current_user['staff_id']; ?></td>
              </tr>

              <tr>
                <td>FULL NAME:</td>
                <td><?php echo $current_user['fname'] . " " . $current_user['mname'] . " " . $current_user['lname']; ?></td>
              </tr>
              <tr>
                <td>STATUS</td>
                <td>
                  <?php
                  if ($row["status"] == 1) {
                    echo "Enabled Account";
                  } elseif ($row["status"] == 2) {
                    echo "Disabled Account";
                  }
                  ?>
                </td>
              </tr>

              <tr>
                <td>SECURITY LEVEL</td>
                <td>
                  <?php
                  if ($current_user['seculevel'] == 1) {
                    echo "System Manager";
                  } elseif ($current_user['seculevel'] == 2) {
                    echo "Power User";
                  } else {
                    echo "User";
                  }
                  ?>
                </td>
              </tr>
              <tr>
                <td>PHONE</td>
                <td><?php echo $row['mobinum']; ?></td>
              </tr>

              <tr>
                <td>EMAIL</td>
                <td><?php echo $row["email"]; ?></td>
              </tr>

              <tr>
                <td>STAFF GROUP</td>
                <td><?php echo $row["name"]; ?>
                </td>
              </tr>

              <tr>
                <td>SYSTEM THEME</td>
                <td>

                  <?php
                  if ($row["theme"] == 1) {
                    echo "Green";
                  } elseif ($row["theme"] == 2) {
                    echo "Aqua";
                  } elseif ($row["theme"] == 3) {
                    echo "Black";
                  } elseif ($row["theme"] == 4) {
                    echo "Blue";
                  }
                  ?>

                </td>
              </tr>

            </tbody>
          </table>


        </div>
      </div>
    </div>
    <div class="panel-footer">
      <a data-original-title="" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-pencil"></i></a>

      <span class="pull-right">



        <a href="user_eprofile.php" class="btn btn-primary"> <i class="fa fa-pencil-square-o"></i>Edit Profile</a>
        <a href="user_epassword.php" class="btn btn-primary"><i class="fa fa-pencil-square-o"></i>Edit Password</a>
      </span>
    </div>

  </div>


  <?php include_once('layouts/foot.php'); ?>