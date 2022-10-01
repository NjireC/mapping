<?php

/**
* Created by Dickson Msaky @ Ifakara Health Insitute (2018)
**/
require_once('includes/load.php');
$page_title = 'Summary';
page_require_level(3);



if(isset($_SESSION['expcode'])){

$prefixtable = $_SESSION['expcode']."_";

$ed1 = $prefixtable."ed1";
$ss1 = $prefixtable."ss1";
$ss3 = $prefixtable."ss3";
$edss = $prefixtable."edss";
$ssso = $prefixtable."ssso";

$tablelabel = $prefixtable."custlabel";
$tableind = $prefixtable."location";
$method = $prefixtable."method";
$cluster = $prefixtable."cluster";
$compound = $prefixtable."compound";
$treatment = $prefixtable."treatment";
$habitattype = $prefixtable."habitattype";
$enumerationarea = $prefixtable."enumerationarea";


//filter fields
$eas = find_all_distinct($ed1,"ea");
$inds = find_all_distinct($ed1,"ind");
$mes = find_all_distinct($ed1,"me");
$hts = find_all_distinct($ed1,"ht");
$trs = find_all_distinct($ed1,"tr");
$vcs = find_all_distinct($ed1,"vc");


//Customize graphs

 $location = "summary";
 

 $table = $prefixtable."custgraph";

//fetchcheckedvalues
 $fetchfields = $db->query("SELECT * FROM {$db->escape($table)} WHERE pc='{$db->escape($_SESSION['expcode'])}' AND location='{$location}' LIMIT 1");


  if($db->num_rows($fetchfields) > 0){
    $result = $db->fetch_assoc($fetchfields);
    $checked_fields = explode(",",$result['p_attri']);
  }

 }


 ?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <title><?php if (!empty($page_title))
     echo remove_junk($page_title);
    elseif(!empty($user))
     echo ucfirst($user['name']);
    else echo "IEBS v3.0";?>
</title>


<link type="text/css" rel="stylesheet" href="assets/css/bootstrap.min.css" >
<link type="text/css" rel="stylesheet" href="assets/css/mdb-theme.css">
<link type="text/css" rel="stylesheet" href='assets/css/select2.css'>
<link type="text/css" rel="stylesheet" href="assets/css/styles.css">
<link type="text/css" rel="stylesheet" href="assets/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="assets/css/jquery-ui.css">

<link type="text/css" rel="stylesheet" href="assets/css/ui.theme.css">
<link type="text/css" rel="stylesheet" href="assets/css/bootstrap-table.css">
<link type="text/css" rel="stylesheet" href="assets/css/bootstrap-tour.min.css">
<link type="text/css" rel="stylesheet" href="assets/css/jquery-ui.css" >
<link type="text/css" rel="stylesheet" href="assets/css/ui.daterangepicker.css" />
<link type="text/css" rel="stylesheet" href="assets/css/daterangepicker-bs3.css">

<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/moment.min.js"></script>
<script type="text/javascript" src="assets/js/ajaxupload.3.5.js" ></script>
<script type="text/javascript" src="assets/js/Chart.min.js"></script>
<script type="text/javascript" src="assets/js/application.js"></script>
<script type="text/javascript" src="assets/js/pwstrength.js"></script>
<script type="text/javascript" src="assets/js/tour.js"></script>
<script type="text/javascript" src="assets/js/api.js"></script>
<script type="text/javascript" src="app2.js"></script>


<script type="text/javascript" src="https://cdn.jsdelivr.net/gh/emn178/chartjs-plugin-labels/src/chartjs-plugin-labels.js"></script>

<script type="text/javascript" src="assets/js/daterange/date.js"></script>
<script type="text/javascript" src="assets/js/daterange/daterangepicker.jQuery.js"></script>
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

<script type="text/javascript" src="assets/js/plugins/interface/jgrowl.min.js"></script>
<script type="text/javascript" src="assets/js/plugins/interface/prettify.js"></script>
<script type="text/javascript" src="assets/js/plugins/interface/fancybox.min.js"></script>
<script type="text/javascript" src="assets/js/plugins/interface/timepicker.min.js"></script>
<script type="text/javascript" src="assets/js/plugins/interface/fullcalendar.min.js"></script>
<script type="text/javascript" src="assets/js/plugins/interface/colorpicker.js"></script>
<script type="text/javascript" src="assets/js/plugins/interface/collapsible.min.js"></script>
<script type="text/javascript" src="assets/js/plugins/interface/bootstrap-tour.min.js"></script>

<script type="text/javascript" src="assets/js/table/bootstrap-table.min.js"></script>
<script type="text/javascript" src='assets/js/table/bootstrap-table-editable.min.js'></script>
<script type="text/javascript" src="assets/js/table/bootstrap-table-export.js?"></script>
<script type="text/javascript" src="assets/js/table/tableExport.js"></script>
<script type="text/javascript" src="assets/js/table/FileSaver.min.js"></script>
<script type="text/javascript" src="assets/js/table/jspdf.min.js"></script>
<script type="text/javascript" src="assets/js/table/jspdf.plugin.autotable.js"></script>
<script type="text/javascript" src="assets/js/table/jquery.base64.js"></script>
<script type="text/javascript" src="assets/js/table/bootstrap-table-toolbar.js"></script>
<script type="text/javascript" src="assets/js/table/bootstrap-table-sticky-header.js"></script>



<script>
$(document).ready(function(){

  $("#FromDate").datepicker({
   dateFormat: 'yy/mm/dd',
   maxDate: 0,
   numberOfMonths: 1,
   onSelect: function(selected) {
    $("#ToDate").datepicker("option","minDate", selected)

  }
});


$("#ToDate").datepicker({
   dateFormat: 'yy/mm/dd',
   minDate: 0,
   maxDate:0,
   numberOfMonths: 1,
   onSelect: function(selected) {
     $("#FromDate").datepicker("option","maxDate", selected)
   }
 });


$('#daterange').daterangepicker();

});



</script>




</head>

<body class="static-navbar">


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
                            <img src="http://placehold.it/500" alt="">
                            <span> <?php   echo $name;  ?> </span>
                            <i class="caret"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="user_profile.php"><i class="fa fa-user"></i> Profile</a></li>
                        </ul>
                    </li>
                    <li><a class="nav-icon sidebar-toggle"><i class="fa fa-bars"></i></a></li>
                </ul>
            </div>

            <ul class="nav navbar-nav navbar-right collapse" id="navbar-right">

             <li>
                    <a id="tguide">
                        <span> Guide</span>
                    </a>
                </li>

                <li>
                    <a href="logout.php">
                        <i class="fa fa-mail-forward"></i>
                        <span>Logout</span>
                    </a>
                </li>

            </ul>
        </div>
    </div>
    <!-- /navbar -->

<?php include_once('layouts/pageheader.php'); ?>

<!-- Page container -->
<div class="page-container container-fluid">


           <?php echo display_msg_popup($msg);  ?>

            <?php

            if(!isset($_SESSION['expcode']) && basename($_SERVER['SCRIPT_FILENAME'])!='home.php'){

            $msg_warn = '<script type="text/javascript">'.
                      "$.jGrowl('No Project Selected', { life: 20000, theme: 'growl-warning' });".
                   '</script>';

            echo $msg_warn;

            }

            ?>


                    <div class="row">
                        <div class="col-md-12">

                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h6 class="panel-title"> Data Summary For:   <span id="pname"></span>  </h6>
                                    <div class="btn-group pull-right">

                                        <?php include_once('scripts/selectproject.php'); ?>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                   

                     <div class="row">
                       <div class="col-md-12">

                           <div class="panel panel-default">
                                <div class="panel-body">

                                  <!-- filter -->
                                <div class="">
                                 <form role="form" method="post" action="" id="filterform" name="filterform">


                                  <div class="row">

                          
                                    <div class="top10 col-xl-3 col-lg-3 col-md-3 col-sm-3 col-6">
                                   
                                         <p><code>Method (ME):</code></p>

                                         <select  class="select-full" name="me" id="me">

                                           <option value="">Select</option>
                                             <?php
                                              if(count($mes) > 0){
                      
                                                 foreach ($mes as $me):
                                                    $selected = ( $_SESSION['me'] == $me['me'] )? ' selected="selected"': '';
                                                    echo '<option '.$selected.' value="'.$me['me'].'" >'.labelvalue($method,"me",$me['me']) .'</option>';

                                                  endforeach;

                                              }else{

                                                  echo '<option value="">No options available</option>';

                                              }

                                              ?>

                                        </select>


                                    </div>

                                   

                                    <div class="top10 col-xl-3 col-lg-3 col-md-3 col-sm-3 col-6">

                                      <p><code>Location (IND):</code></p>

                                         <select class="select-full" name="ind" id="ind">

                                           <option value="">Select</option>
                                             <?php
                                              if(count($inds) > 0){
                      
                                                 foreach ($inds as $ind):
                                                    $selected = ( $_SESSION['ind'] == $ind['ind'] )? ' selected="selected"': '';
                                                    echo '<option '.$selected.' value="'.$ind['ind'].'" >'.labelvalue($tableind,"ind",$ind['ind']) .'</option>';

                                                  endforeach;

                                              }else{

                                                  echo '<option value="">No options available</option>';

                                              }

                                              ?>

                                        </select>

                                    </div>

                                   
                                    <div class="top10 col-xl-3 col-lg-3 col-md-3 col-sm-3 col-6">
                                      <p><code>Date</code></p>
                                     
                                        <div class="input-group">
                                          <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                          </div>
                                          <input name="daterange" id="daterange"  type="text" class="form-control" placeholder="Date" value="<?php echo $_SESSION['daterange']; ?>">
                                        </div>

                                    </div>

                                   <div class="top10 col-xl-3 col-lg-3 col-md-3 col-sm-3 col-6">

                                       <p><code>Enumeration Area (EA):</code></p>
                                        <select  class="select-full" name="ea" id="ea">
                                          <option value="">Select</option>
                                              <?php
                                              if(count($eas) > 0){
                      
                                                 foreach ($eas as $ea):
                                                    $selected = ( $_SESSION['ea'] == $ea['ea'] )? ' selected="selected"': '';
                                                    echo '<option '.$selected.' value="'.$ea['ea'].'" >'.labelvalue($enumerationarea,"ea",$ea['ea']) .'</option>';

                                                  endforeach;

                                              }else{

                                                  echo '<option value="">No options available</option>';

                                              }

                                              ?>
                                        </select>

                                    </div>


                          
                                     <div class="top10 col-xl-3 col-lg-3 col-md-3 col-sm-3 col-6">

                                       <p><code>Habitat type (HT):</code></p>
                                        <select  class="select-full" name="ea" id="ea">
                                          <option value="">Select</option>
                                              <?php
                                              if(count($hts) > 0){
                      
                                                 foreach ($hts as $ht):
                                                    $selected = ( $_SESSION['ht'] == $ht['ht'] )? ' selected="selected"': '';
                                                    echo '<option '.$selected.' value="'.$ht['ht'].'" >'.labelvalue($habitattype,"ht",$ht['ht']) .'</option>';

                                                  endforeach;

                                              }else{

                                                  echo '<option value="">No options available</option>';

                                              }

                                              ?>
                                        </select>

                                    </div>
                                    <div class="top10 col-xl-3 col-lg-3 col-md-3 col-sm-3 col-6">

                                       <p><code>Treatment (TR):</code></p>
                                         <select  class="select-full" name="ea" id="ea"> 
                                          <option value="">Select</option> 
                                              <?php
                                              if(count($trs) > 0){
                      
                                                 foreach ($trs as $tr):
                                                    $selected = ( $_SESSION['tr'] == $tr['tr'] )? ' selected="selected"': '';
                                                    echo '<option '.$selected.' value="'.$tr['tr'].'" >'.labelvalue($treatment,"tr",$tr['tr']) .'</option>';

                                                  endforeach;

                                              }else{

                                                  echo '<option value="">No options available</option>';

                                              }

                                              ?>
                                        </select>
                                        
                                     </div> 




                                   </div>

                                     <br />

                                     <div class="">

                                       <input type="hidden" name="action" id="action" value="" >

                                       <button type="submit" name="filter" id="filter" class="btn btn-primary btn-lg btn-flat ">Apply Filter<i class="glyphicon glyphicon-filter"> </i></button>

                                        <button type="submit" name="filterclear" id="filterclear" class="btn btn-default btn-lg btn-flat ">Clear</button>
                                     
                                     </div>

                                </div>
                              </form>
                                <!-- filter -->

                                
                                </div>
                            </div>

                        </div>
                      </div>


                   
<?php

$col1 = <<< EOT

                <div class="row">
                    <div class="col-md-12">
                        <!-- chart -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h6 class="panel-title">Mosquito Population Summary</h6>
                            </div>
                            <div class="has-padding2">

                                <ul class="nav nav-pills nav-jt">
                                    <li class="active"><a data-toggle="tab" href="#tab21">Chart</a></li>
                                    <li><a data-toggle="tab" id= "bs-tab2" href="#tab22">Table</a></li>
                                </ul>
                                <div class="tab-content has-padding">
                                    <div id="tab21" class="tab-pane fade active in">
                                        <div id="load2"></div>

                                         <div class="text-right">
                                            <input type="button" class="btn btn-xs btn-default" value="Bar" onClick="f2req('B')">
                                            <input type="button" class="btn btn-xs btn-default" value="Line" onClick="f2req('L')">
                                            <input type="button" class="btn btn-xs btn-default" value="Pie" onClick="f2req('P')">
                                            <input type="button" class="btn btn-xs btn-default" value="Polar Area" onClick="f2req('D')">
                                         </div>


                                        <br />

                                        <canvas id="canvas2" class="chart1"></canvas>
                                        <canvas id="canvas2l" class="chart1"></canvas>
                                        <canvas id="canvas2p" class="chart1"></canvas>
                                        <canvas id="canvas2d" class="chart1"></canvas>

                                    </div>
                                    <div id="tab22" class="tab-pane">
                                        <div class="table-responsive">
                                            <div id="tbl2"> </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- chart -->
                    </div>
                </div>
EOT;


if(in_array("mps",$checked_fields)){
  echo $col1;
}


$col2 = <<< EOT
                <div class="row">
                 <div class="col-md-12">

                     <!-- chart -->
                     <div class="panel panel-default">
                        <div class="panel-heading">
                            <h6 class="panel-title">Female Mosquito Caught vs Month</h6>
                        </div>
                        <div class="has-padding2">

                            <ul class="nav nav-pills nav-jt">
                                <li class="active"><a data-toggle="tab" href="#tab1">Chart</a></li>
                                <li><a data-toggle="tab" id= "bs-tab2" href="#tab2">Table</a></li>
                            </ul>
                            <div class="tab-content has-padding">
                                <div id="tab1" class="tab-pane fade active in">
                                    <div id="load1"></div>
                                    
                                      <div class="text-right">
                                        <input type="button" class="btn btn-xs btn-default " value="Bar" onClick="f1req('B')">
                                        <input type="button" class="btn btn-xs btn-default" value="Line" onClick="f1req('L')">
                                        <input type="button" class="btn btn-xs btn-default" value="Pie" onClick="f1req('P')">
                                        <input type="button" class="btn btn-xs btn-default" value="Polar Area" onClick="f1req('D')">
                                      </div>

                                        <br />

                                        <canvas id="canvas1" class="chart1"></canvas>
                                        <canvas id="canvas1l" class="chart1"></canvas>
                                        <canvas id="canvas1p" class="chart1"></canvas>
                                        <canvas id="canvas1d" class="chart1"></canvas>


                                </div>
                                <div id="tab2" class="tab-pane">
                                    <div class="table-responsive">
                                        <div id="tbl1"> </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!--  chart -->

                  </div>
                </div>
EOT;


if(in_array("fmcm",$checked_fields)){
  echo $col2;
}


$col3 = <<< EOT
                <div class="row">
                 <div class="col-md-12">

                     <!-- chart -->
                     <div class="panel panel-default">
                        <div class="panel-heading">
                            <h6 class="panel-title">Female Mosquito Caught vs Date</h6>
                        </div>
                        <div class="has-padding2">

                            <ul class="nav nav-pills nav-jt">
                                <li class="active"><a data-toggle="tab" href="#tab31">Chart</a></li>
                                <li><a data-toggle="tab" id= "bs-tab2" href="#tab32">Table</a></li>
                            </ul>
                            <div class="tab-content has-padding">
                                <div id="tab31" class="tab-pane fade active in">
                                    <div id="load3"></div>

                                      <div class="text-right">
                                        <input type="button" class="btn btn-xs btn-default" value="Bar" onClick="f3req('B')">
                                        <input type="button" class="btn btn-xs btn-default" value="Line" onClick="f3req('L')">
                                        <input type="button" class="btn btn-xs btn-default" value="Pie" onClick="f3req('P')">
                                        <input type="button" class="btn btn-xs btn-default" value="Polar Area" onClick="f3req('D')">
                                      </div>

                                        <br />

                                        <canvas id="canvas3" class="chart1"></canvas>
                                        <canvas id="canvas3l" class="chart1"></canvas>
                                        <canvas id="canvas3p" class="chart1"></canvas>
                                        <canvas id="canvas3d" class="chart1"></canvas>


                                </div>
                                <div id="tab32" class="tab-pane">
                                    <div class="table-responsive">
                                        <div id="tbl3"> </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!--  chart -->

                  </div>
                </div>
EOT;




if(in_array("fmcd",$checked_fields)){
  echo $col3;
}


$col4 = <<< EOT
                <div class="row">
                 <div class="col-md-12">

                     <!-- chart -->
                     <div class="panel panel-default">
                        <div class="panel-heading">
                            <h6 class="panel-title">Mosquito Population Summary by site</h6>
                        </div>
                        <div class="has-padding2">

                            <ul class="nav nav-pills nav-jt">
                                <li class="active"><a data-toggle="tab" href="#tab41">Chart</a></li>
                                <li><a data-toggle="tab" id= "bs-tab2" href="#tab42">Table</a></li>
                            </ul>
                            <div class="tab-content has-padding">
                                <div id="tab41" class="tab-pane fade active in">
                                    <div id="load4"></div>
                                   
                                      <div class="text-right">
                                        <input type="button" class="btn btn-xs btn-default" value="Bar" onClick="f4req('B')">
                                        <input type="button" class="btn btn-xs btn-default" value="Line" onClick="f4req('L')">
                                        <input type="button" class="btn btn-xs btn-default" value="Pie" onClick="f4req('P')">
                                        <input type="button" class="btn btn-xs btn-default" value="Polar Area" onClick="f4req('D')">
                                      </div>

                                        <br />

                                        <canvas id="canvas4" class="chart1"></canvas>
                                        <canvas id="canvas4l" class="chart1"></canvas>
                                        <canvas id="canvas4p" class="chart1"></canvas>
                                        <canvas id="canvas4d" class="chart1"></canvas>


                                </div>
                                <div id="tab42" class="tab-pane">
                                    <div class="table-responsive">
                                        <div id="tbl4"> </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!--  chart -->

                  </div>
                </div>
EOT;


if(in_array("mpss",$checked_fields)){
  echo $col4;
}

$col5 = <<< EOT
                <div class="row">
                 <div class="col-md-12">

                     <!-- chart -->
                     <div class="panel panel-default">
                        <div class="panel-heading">
                            <h6 class="panel-title">An. Gambiae SAS status</h6>
                        </div>
                        <div class="has-padding2">

                            <ul class="nav nav-pills nav-jt">
                                <li class="active"><a data-toggle="tab" href="#tab51">Chart</a></li>
                                <li><a data-toggle="tab" id= "bs-tab2" href="#tab52">Table</a></li>
                            </ul>
                            <div class="tab-content has-padding">
                                <div id="tab51" class="tab-pane fade active in">
                                    <div id="load5"></div>
                                  
                                      <div class="text-right">
                                        <input type="button" class="btn btn-xs btn-default" value="Bar" onClick="f5req('B')">
                                        <input type="button" class="btn btn-xs btn-default" value="Line" onClick="f5req('L')">
                                        <input type="button" class="btn btn-xs btn-default" value="Pie" onClick="f5req('P')">
                                        <input type="button" class="btn btn-xs btn-default" value="Polar Area" onClick="f5req('D')">
                                      </div>

                                        <br />

                                        <canvas id="canvas5" class="chart1"></canvas>
                                        <canvas id="canvas5l" class="chart1"></canvas>
                                        <canvas id="canvas5p" class="chart1"></canvas>
                                        <canvas id="canvas5d" class="chart1"></canvas>


                                </div>
                                <div id="tab52" class="tab-pane">
                                    <div class="table-responsive">
                                        <div id="tbl5"> </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!--  chart -->

                  </div>
                </div>
EOT;


if(in_array("gsas",$checked_fields)){
  echo $col5;
}

$col6 = <<< EOT
                <div class="row">
                 <div class="col-md-12">

                     <!-- chart -->
                     <div class="panel panel-default">
                        <div class="panel-heading">
                            <h6 class="panel-title">An. Funestus SAS status</h6>
                        </div>
                        <div class="has-padding2">

                            <ul class="nav nav-pills nav-jt">
                                <li class="active"><a data-toggle="tab" href="#tab61">Chart</a></li>
                                <li><a data-toggle="tab" id= "bs-tab2" href="#tab62">Table</a></li>
                            </ul>
                            <div class="tab-content has-padding">
                                <div id="tab61" class="tab-pane fade active in">
                                    <div id="load6"></div>
                                    
                                      <div class="text-right">
                                        <input type="button" class="btn btn-xs btn-default" value="Bar" onClick="f6req('B')">
                                        <input type="button" class="btn btn-xs btn-default" value="Line" onClick="f6req('L')">
                                        <input type="button" class="btn btn-xs btn-default" value="Pie" onClick="f6req('P')">
                                        <input type="button" class="btn btn-xs btn-default" value="Polar Area" onClick="f6req('D')">
                                      </div>

                                        <br />

                                        <canvas id="canvas6" class="chart1"></canvas>
                                        <canvas id="canvas6l" class="chart1"></canvas>
                                        <canvas id="canvas6p" class="chart1"></canvas>
                                        <canvas id="canvas6d" class="chart1"></canvas>


                                </div>
                                <div id="tab62" class="tab-pane">
                                    <div class="table-responsive">
                                        <div id="tbl6"> </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!--  chart -->

                  </div>
                </div>
EOT;


if(in_array("fsas",$checked_fields)){
  echo $col6;
}

?>
            

                <div class="row">
                 <div class="col-md-12">

                     <!-- chart -->
                    
                     <!-- chart -->

                  </div>
                </div>

                <div class="row">
                 <div class="col-md-12">

                     <!-- chart -->
                    
                     <!-- chart -->

                  </div>
                </div>



            <!-- Footer -->
            <div class="footer">
                &copy; Copyright <?php echo date("Y"); ?>. All rights reserved <a href="#" title="">Mosquito Database Management System</a>
            </div>
            <!-- /footer -->

      
    </div>


</body>
</html>

