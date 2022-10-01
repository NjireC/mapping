<?php

if (isset($_SESSION['expcode'])) {
    //form type ed
    $edft = cust_formtype('custed', $_SESSION['expcode']);
    $ed1ft = "";
    $ed2ft = "";

    if (count($edft) == 0) {
        $ed1ft = "";
        $ed2ft = "";
    } else if (in_array("ED1", $edft)) {
        $ed2ft = "disabled";
        $ed1ft = "";
    } else if (in_array("ED2", $edft)) {
        $ed1ft = "disabled";
        $ed2ft = "";
    }

    //form type sS
    $ssft = cust_formtype('custss', $_SESSION['expcode']);
    $ss1ft = "";
    $ss2ft = "";
    $ss3ft = "";
    $ss4ft = "";

    if (count($ssft) == 0) {
        $ss1ft = "";
        $ss2ft = "";
        $ss3ft = "";
        $ss4ft = "";
    } else if (in_array("SS1", $ssft)) {
        $ss4ft = "disabled";
        $ss3ft = "disabled";
        $ss2ft = "disabled";
        $ss1ft = "";
    } else if (in_array("SS2", $ssft)) {
        $ss4ft = "disabled";
        $ss3ft = "disabled";
        $ss1ft = "disabled";
        $ss2ft = "";
    } else if (in_array("SS3", $ssft)) {
        $ss1ft = "disabled";
        $ss2ft = "disabled";
        $ss4ft = "disabled";
        $ss3ft = "";
    } else if (in_array("SS4", $ssft)) {
        $ss1ft = "disabled";
        $ss2ft = "disabled";
        $ss3ft = "disabled";
        $ss4ft = "";
    }

    //form type so
    $soft = cust_formtype('custso', $_SESSION['expcode']);
    $so1ft = "";
    $so2ft = "";

    if (count($soft) == 0) {
        $so1ft = "";
        $so2ft = "";
    } else if (in_array("SO1", $soft)) {
        //$so2ft="disabled";
        // $so1ft="";
    } else if (in_array("SO2", $soft)) {
        // $so1ft="disabled";
        // $so2ft="";
    }
} else {

    $ed1ft = "disabled";
    $ed2ft = "disabled";
    $ss1ft = "disabled";
    $ss2ft = "disabled";
    $ss3ft = "disabled";
    $so1ft = "disabled";
    $so2ft = "disabled";
    $st1ft = "disabled";
    $st2ft = "disabled";
}


?>

<!-- items -->
<div class="panel panel-default">
    <div class="panel-heading">
        <h6 class="panel-title">Customization Menu</h6>
    </div>

    <div class="panel-body">
        <div class="row">
            <div class="top10 col-xl-3 col-lg-3 col-md-3 col-sm-3 col-6">

                <p><code>Experimental Design forms</code></p>

                <div class="btn-group">
                    <button class="btn btn-primary"> <i class="fa fa-file-text"></i> Experimental Design</button>
                    <button class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
                        <span class="caret caret-split"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li class="<?php echo $ed1ft; ?>"><a tabindex="-1" href="settings.php">Experimental Design 1</a></li>
                        <li class="<?php echo $ed2ft; ?>"><a tabindex="-1" href="settings_ed2.php">Experimental Design 2</a></li>
                    </ul>
                </div>

            </div>

            <div class="top10 col-xl-3 col-lg-3 col-md-3 col-sm-3 col-6">

                <p><code>Sample Sorting forms</code></p>

                <div class="btn-group">
                    <button class="btn btn-primary"> <i class="fa fa-file-text"></i>Sample Sorting</button>
                    <button class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
                        <span class="caret caret-split"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li class="<?php echo $ss1ft; ?>"><a tabindex="-1" href="settings_ss1.php">Sample Sorting 1</a></li>
                        <li class="<?php echo $ss2ft; ?>"><a tabindex="-1" href="settings_ss2.php">Sample Sorting 2</a></li>
                        <li class="<?php echo $ss3ft; ?>"><a tabindex="-1" href="cdctest.php">Sample Sorting 3</a></li>
                        <li class="<?php echo $ss4ft; ?>"><a tabindex="-1" href="settings_ss4.php">Sample Sorting 4</a></li>
                    </ul>
                </div>

            </div>

            <div class="top10 col-xl-3 col-lg-3 col-md-3 col-sm-3 col-6">

                <p><code>Sample Observation forms</code></p>

                <div class="btn-group">
                    <button class="btn btn-primary"> <i class="fa fa-file-text"></i> Sample Observation </button>
                    <button class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
                        <span class="caret caret-split"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li class="<?php echo $so1ft; ?>"><a tabindex="-1" href="settings_so1.php">Sample Observation 1</a></li>
                        <li class="<?php echo $so2ft; ?>"><a tabindex="-1" href="settings_so2.php">Sample Observation 2</a></li>
                    </ul>
                </div>

            </div>

            <div class="top10 col-xl-3 col-lg-3 col-md-3 col-sm-3 col-6">

                <p><code> Sample Storage forms</code></p>

                <div class="btn-group">
                    <button class="btn btn-primary"> <i class="fa fa-file-text"></i> Sample Storage </button>
                    <button class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
                        <span class="caret caret-split"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li class="<?php echo $st1ft; ?>"><a tabindex="-1" href="settings_st1.php">Sample Storage 1</a></li>
                        <li class="<?php echo $st2ft; ?>"><a tabindex="-1" href="settings_st2.php">Sample Storage 2</a></li>
                    </ul>
                </div>

            </div>




        </div>


        <div class="row">
            <div class="top10 col-xl-3 col-lg-3 col-md-3 col-sm-3 col-6">
                <br />
                <p><code>Labels</code></p>

                <a class="btn btn-primary" href="settings_customizelabel.php"><i class="fa fa-info"></i> Show/Hide  Data Labels</a>

            </div>


        </div>
    </div>

</div>
<!-- /items -->