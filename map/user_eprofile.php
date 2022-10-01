<?php

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
 **/

require_once('includes/load.php');
$page_title = 'Edit Profile | MosquitoDB';
page_require_level(3);
include_once('layouts/head.php');

?>
<!-- Page content -->
<div class="page-content">

    <?php echo display_msg_popup($msg);  ?>

    <!-- Page title -->
    <div class="page-title">
        <h5><i class="fa fa-bars"></i> Home <small>Welcome, <?php echo $name;  ?> </small></h5>
    </div>

    <!-- Form -->
    <form class="form-horizontal" action="scripts/updateprofile.php" role="form" method="post">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h6 class="panel-title">Edit Profile</h6>
            </div>
            <div class="panel-body">

                <div class="form-group">
                    <label class="col-sm-2 control-label">First name: <span class="mandatory">*</span></label>
                    <div class="col-sm-10">
                        <input type="text" class=" form-control" name="firstname" id="firstname" value="<?php echo $current_user['fname']; ?>" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Second name: <span class="mandatory">*</span></label>
                    <div class="col-sm-10">
                        <input type="text" class=" form-control" name="secondname" id="secondname" value="<?php echo $current_user['mname']; ?>" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Last name: <span class="mandatory">*</span></label>
                    <div class="col-sm-10">
                        <input type="text" class=" form-control" name="lastname" id="lastname" value="<?php echo $current_user['lname']; ?>" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Mobile number: <span class="mandatory">*</span></label>
                    <div class="col-sm-10">
                        <input type="text" class=" form-control" name="mobnumber" id="mobnumber" value="<?php echo $current_user['mobinum']; ?>" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Email: <span class="mandatory">*</span></label>
                    <div class="col-sm-10">
                        <input type="email" class=" form-control" name="email" id="email" value="<?php echo $current_user['email']; ?>" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">System theme:</label>
                    <div class="col-sm-10">
                        <select class=" form-control" name="theme" id="theme" required>
                            <option value="">Select colour</option>
                            <option <?php if ($current_user['theme'] === '1') echo 'selected="selected"'; ?> value="1">Green</option>
                            <option <?php if ($current_user['theme'] === '2') echo 'selected="selected"'; ?> value="2">Aqua</option>
                            <option <?php if ($current_user['theme'] === '3') echo 'selected="selected"'; ?> value="3">Black</option>
                            <option <?php if ($current_user['theme'] === '4') echo 'selected="selected"'; ?> value="4">Blue</option>

                        </select>
                    </div>
                </div>


                <div class="form-actions text-right">
                    <button name="updatedet" type="submit" id="updatedet" class="btn btn-primary">Update</button>
                </div>

            </div>

        </div>
    </form>
    <!-- /form  -->

    <?php include_once('layouts/foot.php'); ?>