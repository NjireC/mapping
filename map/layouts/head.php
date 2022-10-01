<!DOCTYPE html>
<html lang="en">

<head>
    <?php
    require_once('includes/load.php');
    $theme = get_theme($current_user['theme']);

    ?>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php if (!empty($page_title)) {
                echo remove_junk($page_title);
            } elseif (!empty($user)) {
                echo ucfirst($user['name']);
            } else {
                echo "MosquitoDB";
            } ?>
    </title>
    <link type="text/css" rel="stylesheet" href="assets/css/<?php echo $theme; ?>bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="assets/css/<?php echo $theme; ?>mdb-theme.css">
    <link type="text/css" rel="stylesheet" href="assets/css/<?php echo $theme; ?>styles.css">
    <link type="text/css" rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="assets/css/jquery-ui.css">
    <link type="text/css" rel="stylesheet" href="assets/css/ui.theme.css">
    <link type="text/css" rel="stylesheet" href='assets/css/select2.css'>
    <link type="text/css" rel="stylesheet" href="assets/css/bootstrap-table.css">
    <link type="text/css" rel="stylesheet" href="assets/css/bootstrap-tour.min.css">
    <link type="text/css" rel="stylesheet" href="assets/css/jquery-ui.css">
    <link type="text/css" rel="stylesheet" href="assets/css/ui.daterangepicker.css" />
    <link type="text/css" rel="stylesheet" href="assets/css/daterangepicker-bs3.css">
    <link type="text/css" rel="stylesheet" href="assets/css/animate.min.css" />

    <script type="text/javascript" src="assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/moment.min.js"></script>
    <script type="text/javascript" src="assets/js/ajaxupload.3.5.js"></script>
    <script type="text/javascript" src="assets/js/application.js"></script>
    <script type="text/javascript" src="assets/js/pwstrength.js"></script>
    <script type="text/javascript" src="assets/js/tour.js"></script>
    <script type="text/javascript" src="assets/js/api.js"></script>
    <script type="text/javascript" src="project.js"></script>
    <script type="text/javascript" src="chome.js"></script>
    <script type="text/javascript" src="app2.js"></script>

    <script type="text/javascript" src="assets/js/plugins/interface/jgrowl.min.js"></script>
    <script type="text/javascript" src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

    <script type="text/javascript" src="assets/js/Chart.min.js"></script>
    <script type="text/javascript" src="assets/js/chartjs-plugin-colorschemes.js"></script>
    <script type="text/javascript" src="assets/js/daterange/date.js"></script>
    <script type="text/javascript" src="assets/js/chartjs-plugin-labels.js"></script>
    <script type="text/javascript" src="assets/js/daterange/daterangepicker.jQuery.js"></script>

    <script type="text/javascript" src="assets/js/table/bootstrap-table.js"></script>
    <script type="text/javascript" src="assets/js/table/bootstrap-table-editable.js"></script>
    <script type="text/javascript" src="assets/js/table/bootstrap-table-export.js?"></script>
    <script type="text/javascript" src="assets/js/table/tableExport.js"></script>
    <script type="text/javascript" src="assets/js/table/FileSaver.min.js"></script>
    <script type="text/javascript" src="assets/js/table/jspdf.min.js"></script>
    <script type="text/javascript" src="assets/js/table/jspdf.plugin.autotable.js"></script>
    <script type="text/javascript" src="assets/js/table/jquery.base64.js"></script>
    <script type="text/javascript" src="assets/js/table/bootstrap-table-toolbar.js"></script>
    <script type="text/javascript" src="assets/js/table/bootstrap-table-sticky-header.js"></script>

    <script type="text/javascript" src="assets/js/plugins/forms/uniform.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/select2.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/inputmask.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/autosize.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/inputlimit.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/listbox.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/multiselect.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/validate.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/tags.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/uploader/plupload.full.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/uploader/plupload.queue.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/wysihtml5/wysihtml5.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/wysihtml5/toolbar.js"></script>

    <script type="text/javascript" src="assets/js/plugins/interface/prettify.js"></script>
    <script type="text/javascript" src="assets/js/plugins/interface/fancybox.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/interface/timepicker.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/interface/fullcalendar.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/interface/colorpicker.js"></script>
    <script type="text/javascript" src="assets/js/plugins/interface/collapsible.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/interface/bootstrap-tour.min.js"></script>

</head>

<body class="static-navbar">

    <div id="google_translate_element" style="display:none"></div>

    <!-- LOADER  -->
    <div id="loading">
        <div id="loading-center">
            <div id="loading-center-absolute">
                <div class="object" id="object_one"></div>
                <div class="object" id="object_two"></div>
                <div class="object" id="object_three"></div>
            </div>
        </div>
    </div>


    <!-- Navbar -->
    <div class="navbar navbar-inverse" role="navigation">

        <div class="container-fluid">
            <div class="navbar-header">
                <div class="hidden-lg pull-right">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-right">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-chevron-down"></i>
                    </button>
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar">
                        <span class="sr-only">Toggle sidebar</span>
                        <i class="fa fa-bars"></i>
                    </button>
                </div>

                <ul class="nav navbar-nav navbar-left-custom">
                    <li class="user dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown">
                            <img alt="User Pic" src="assets/images/user3.png" class="img-circle img-responsive">
                            <span> <?php echo $name; ?> </span>
                            <i class="caret"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li> <a href="user_profile.php"><i class="fa fa-user"></i> Profile</a></li>
                        </ul>
                    </li>
                    <li> <a class="nav-icon sidebar-toggle"><i class="fa fa-bars"></i></a></li>
                </ul>
            </div>

            <ul class="nav navbar-nav navbar-right collapse" id="navbar-right">

                <li> <select class="selectpicker" data-width="fit" onchange="translateLanguage(this.value);">
                        <option data-content='<span class="flag-icon flag-icon-af"></span> English' value="English">English</option>
                        <option data-content='<span class="flag-icon flag-icon-al"></span> French' value="French">French</option>
                    </select>
                </li>

                <li> <a href="https://mosquitodb.readthedocs.io/" target= "_blank">Guide</a> </li>
                <li> <a href="logout.php"> <i class="fa fa-mail-forward"></i> <span>Logout</span> </a> </li>

            </ul>
        </div>
    </div>
    <!-- /navbar -->
    <?php include_once('layouts/pageheader.php'); ?>
    <!-- Page container -->
    <div class="page-container container-fluid">
        <?php include_once('layouts/adminmenu.php'); ?>
        <?php

        if (!isset($_SESSION['expcode']) && basename($_SERVER['SCRIPT_FILENAME']) != 'home.php') {
            $msg_warn = '<script type="text/javascript">' . "$.jGrowl('No Project Selected', { life: 20000, theme: 'growl-warning' });" . '</script>';
            echo $msg_warn;
        }

        ?>