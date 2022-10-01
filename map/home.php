<?php

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018).
 **/

require_once 'includes/load.php';
page_require_level(3);

$page_title = 'Home | MosquitoDB';
include_once 'layouts/head.php';


if (isset($_SESSION['expcode'])) {

    $prefixtable = $_SESSION['expcode'] . '_';

    if ($prefixtable > 0) {

        if (sizeof($edformtype) > 0) {
            if (mysqli_num_rows($edresult)) {
                $ednumrows = mysqli_num_rows($edresult);
            } else {
                $ednumrows = 0;
            }
        } else {
            $ednumrows = 0;
        }


        if (sizeof($ssformtype) > 0) {

            if (mysqli_num_rows($ssresult)) {
                $ssnumrows = mysqli_num_rows($ssresult);
            } else {
                $ssnumrows = 0;
            }
        } else {
            $ssnumrows = 0;
        }



        if (sizeof($soformtype) > 0) {

            if (mysqli_num_rows($soresult)) {
                $sonumrows = mysqli_num_rows($soresult);
            } else {
                $sonumrows = 0;
            }
        } else {
            $sonumrows = 0;
        }



        if (sizeof($stformtype) > 0) {

            if (mysqli_num_rows($stresult)) {
                $stnumrows = mysqli_num_rows($stresult);
            } else {
                $stnumrows = 0;
            }
        } else {
            $stnumrows = 0;
        }




        $total = $ednumrows + $ssnumrows + $sonumrows + $stnumrows;

        //time sub

        if ($ednumrows > 0) {
            $qtodaye = $db->query("SELECT DATE(created_at) FROM $ed WHERE DATE(created_at) = DATE(NOW())");
            $qweeke = $db->query("SELECT DATE(created_at) FROM $ed WHERE WEEKOFYEAR(created_at) = WEEKOFYEAR(NOW())");
            $qmonthe = $db->query("SELECT DATE(created_at) FROM $ed WHERE MONTH(created_at) = MONTH(NOW())");

            $tenumrows = mysqli_num_rows($qtodaye);
            $wenumrows = mysqli_num_rows($qweeke);
            $menumrows = mysqli_num_rows($qmonthe);
        } else {
            $tenumrows = 0;
            $wenumrows = 0;
            $menumrows = 0;
        }

        if ($ssnumrows > 0) {
            $qtodays = $db->query("SELECT DATE(created_at) FROM $ss WHERE DATE(created_at) = DATE(NOW())");
            $qweeks = $db->query("SELECT DATE(created_at) FROM $ss WHERE WEEKOFYEAR(created_at) = WEEKOFYEAR(NOW())");
            $qmonths = $db->query("SELECT DATE(created_at) FROM $ss WHERE MONTH(created_at) = MONTH(NOW())");

            $tsnumrows = mysqli_num_rows($qtodays);
            $wsnumrows = mysqli_num_rows($qweeks);
            $msnumrows = mysqli_num_rows($qmonths);
        } else {
            $tsnumrows = 0;
            $wsnumrows = 0;
            $msnumrows = 0;
        }


        $today = $tenumrows + $tsnumrows;
        $week = $wenumrows + $wsnumrows;
        $month = $menumrows + $msnumrows;
    }
} else {
    $ednumrows = 0;
    $ssnumrows = 0;
    $sonumrows = 0;
    $stnumrows = 0;

    $today = 0;
    $week = 0;
    $month = 0;
    $total = 0;
}

?>

<script type="text/javascript">
    $(document).ready(function() {
        $('#drange').daterangepicker();
    });
</script>

<!-- Page content -->
<div class="page-content">

    <!-- Page title -->
    <div class="page-title">
        <h5><i class="fa fa-bars"></i> Home
            <small>Welcome, <?php echo $name; ?> </small>
        </h5>
    </div>


    <!-- /page title -->
    <?php echo display_msg_popup($msg); ?>

    <div class="panel panel-primary">
        <div class="panel-heading">
            <h6 class="panel-title">Dataset Summary For: <span id="pname"></span>
            </h6>
            <div class="btn-group pull-right">
                <?php include_once 'scripts/selectproject.php'; ?>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">

            <div class="info-box tooltip-wrapper">
                <span class="info-box-icon bg-aqua"></span>
                <div class="info-box-content">
                    <span class="info-box-number animate__animated animate__fadeIn"><?php echo $today; ?></span>
                    <span class="info-box-text animate__animated animate__zoomIn">Submitted Today</span>
                    <div class="tooltip-content">Sum of submitted data points</div>
                </div>
            </div>

        </div>

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box tooltip-wrapper">
                <span class="info-box-icon bg-aqua"></span>
                <div class="info-box-content">

                    <span class="info-box-number animate__animated animate__fadeIn"><?php echo $week; ?></span>
                    <span class="info-box-text animate__animated animate__zoomIn">Submitted this week</span>
                    <div class="tooltip-content">Sum of submitted data points</div>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box tooltip-wrapper">
                <span class="info-box-icon bg-aqua"></span>
                <div class="info-box-content">

                    <span class="info-box-number animate__animated animate__fadeIn"><?php echo $month; ?></span>
                    <span class="info-box-text animate__animated animate__zoomIn">Submitted this month</span>
                    <div class="tooltip-content">Sum of submitted data points</div>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box tooltip-wrapper">
                <span class="info-box-icon bg-aqua"></span>
                <div class="info-box-content">

                    <span class="info-box-number animate__animated animate__fadeIn"><?php echo $total; ?></span>
                    <span class="info-box-text animate__animated animate__zoomIn">Total Submitted</span>
                    <div class="tooltip-content">Sum of submitted data points</div>
                </div>
            </div>
        </div>


    </div>


    <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box tooltip-wrapper">
                <span class="info-box-icon bg-aqua"></span>
                <div class="info-box-content">

                    <span class="info-box-number animate__animated animate__fadeIn"><?php echo $ednumrows; ?></span>
                    <span class="info-box-text animate__animated animate__zoomIn">Experimental Design</span>
                    <div class="tooltip-content">Sum of submitted data points</div>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box tooltip-wrapper">
                <span class="info-box-icon bg-aqua"></span>
                <div class="info-box-content">

                    <span class="info-box-number animate__animated animate__fadeIn"><?php echo $ssnumrows; ?></span>
                    <span class="info-box-text animate__animated animate__zoomIn">Sample Sorting</span>
                    <div class="tooltip-content">Sum of submitted data points</div>
                </div>
            </div>
        </div>


        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box tooltip-wrapper">
                <span class="info-box-icon bg-aqua"></i></span>
                <div class="info-box-content">

                    <span class="info-box-number animate__animated animate__fadeIn"><?php echo $sonumrows; ?></span>
                    <span class="info-box-text animate__animated animate__zoomIn">Sample Observation</span>
                    <div class="tooltip-content">Sum of submitted data points</div>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box tooltip-wrapper">
                <span class="info-box-icon bg-aqua"></span>
                <div class="info-box-content">

                    <span class="info-box-number animate__animated animate__fadeIn"><?php echo $stnumrows; ?></span>
                    <span class="info-box-text animate__animated animate__fadeIn">Sample Storage</span>
                    <div class="tooltip-content">Sum of submitted data points</div>
                </div>
            </div>
        </div>

        <br /> <br />

        <div class="row">
            <div class="col-md-6">
                <h2>Date Filter</h2>

                <form role="form" method="post" action="" id="filterhome" name="filterhome">
                    <button type="submit" id="filterh" name="filterh" class="btn btn-primary" style="float: right">Apply
                        Filter
                    </button>
                    <div style="overflow: hidden; padding-right: .3em;">
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </div>
                            <!-- Form -->
                            <input name="drange" id="drange" type="text" class="form-control" value="<?php

                                                                                                        if (isset($_SESSION['hdaterange'])) {
                                                                                                            echo $_SESSION['hdaterange'];
                                                                                                        }

                                                                                                        ?>">
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <br />


        <!-- chart -->
        <?php

        $ss1 = <<< EOT
        <div class="panel panel-default animate__animated animate__fadeIn">
            <div class="panel-heading">
                <h6 class="panel-title">Adult Mosquito Summary</h6>
            </div>
            <div class="has-padding2">
                <div class="table-responsive has-padding2">
                     
                     <div id="tblhome" >
                    <div id="load3"></div>
                    <div id="loadnonefhss1"></div>
		    </div>
                </div>
            </div>
        </div>
EOT;

        $ss2 = <<< EOT
        <div class="panel panel-default animate__animated animate__fadeIn">
        <div class="panel-heading">
            <h6 class="panel-title">Immature Mosquito Summary</h6>
        </div>
        <div class="has-padding2">
             <div class="table-responsive has-padding2">
             <div id="loadhomefhss2"></div>
             <div id="loadnonefhss2"></div>
             <div id="tblhomess2"></div>
             </div>
        </div>
        </div>
EOT;


        $ss4 = <<< EOT
         <div class="panel panel-default animate__animated animate__fadeIn">
            <div class="panel-heading">
                <h6 class="panel-title">Snail Summary</h6>
            </div>
            <div class="has-padding2">
               
                <div id="loadhomefhss4"></div>
                <div id="loadnonefhss4"></div>

                <div class="text-right">
                    <input type="button" class="btn btn-xs btn-default" value="Bar chart"
                        onClick="fhreq_ss4('B')">
                    <input type="button" class="btn btn-xs btn-default" value="Pie chart"
                        onClick="fhreq_ss4('P')">
                </div>

        
                   <canvas id="canvashomess4" width="400" height="120" ></canvas>

                
            </div>
        </div>
EOT;

        if ($disabless1 != "disabled") {
            echo $ss1;
        }

        if ($disabless2 != "disabled") {
            echo $ss2;
        }

        if ($disabless4 != "disabled") {
            echo $ss4;
        }



        include_once 'layouts/foot.php';
        ?>