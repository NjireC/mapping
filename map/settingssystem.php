<?php

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
 **/
require_once('includes/load.php');
$page_title = 'Settings | MosquitoDB';
page_require_level(2);
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
    <form class="form-horizontal" action="scripts/updatesettingssystem.php" role="form" method="post">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h6 class="panel-title">System Settings</h6>
            </div>
            <div class="panel-body">

                <div class="form-group">
                    <label class="col-sm-2 control-label">Organization Name: <span class="mandatory">*</span></label>
                    <div class="col-sm-10">
                        <input type="text" class=" form-control" name="oname" id="oname" value="<?php echo $settings['organization_name']; ?>" required>
                    </div>
                </div>



                <div class="form-group">
                    <label class="col-sm-2 control-label">System theme: <span class="mandatory">*</span></label>
                    <div class="col-sm-10">
                        <select class=" form-control" name="ocolour" id="ocolour" required>
                            <option value="">Select colour</option>
                            <option <?php if ($settings['organization_theme'] === '1') echo 'selected="selected"'; ?> value="1">Green</option>
                            <option <?php if ($settings['organization_theme'] === '2') echo 'selected="selected"'; ?> value="2">Aqua</option>
                            <option <?php if ($settings['organization_theme'] === '3') echo 'selected="selected"'; ?> value="3">Black</option>
                            <option <?php if ($settings['organization_theme'] === '4') echo 'selected="selected"'; ?> value="4">Blue</option>

                        </select>
                    </div>
                </div>

                <div class="form-actions text-right">
                    <button name="updatesystem" type="submit" id="updatesystem" class="btn btn-primary">Submit</button>
                </div>

            </div>

        </div>
    </form>
    <!-- /form  -->

    <?php include_once('layouts/foot.php'); ?>