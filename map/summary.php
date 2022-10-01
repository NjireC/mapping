<?php

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
 **/

require_once('includes/load.php');
$page_title = 'Summary | MosquitoDB';
page_require_level(3);
include_once('layouts/head.php');

if (isset($_SESSION['expcode'])) {

    //filter fields
    if (in_array("ED1", $edformtype)) {
        $eas = find_all_distinct($ed, "ea");
        $inds = find_all_distinct($ed, "ind");
        $mes = find_all_distinct($ed, "me");
        $hts = find_all_distinct($ed, "ht");
        $trs = find_all_distinct($ed, "tr");
        $vcs = find_all_distinct($ed, "vc");
    } else if (in_array("ED2", $edformtype)) {
        $trs = find_all_distinct($ed, "tr");
    }
}

?>

<!-- Page content -->
<div class="page-content">
    <!-- Page title -->
    <div class="page-title">
        <h5><i class="fa fa-bars"></i> Home
            <small>Welcome, <?php echo $name; ?> </small>
        </h5>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h6 class="panel-title"> Data Summary For:
                        <span id="pname"></span></h6>
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
                                    <br />
                                    <p><code>Method (ME):</code></p>
                                    <select class="select-full" name="me" id="me">
                                        <option value="">Select</option>
                                        <?php
                                        if (count($mes) > 0) {
                                            foreach ($mes as $me) :
                                                $selected = ($_SESSION['me'] == $me['me']) ? ' selected="selected"' : '';
                                                echo '<option ' . $selected . ' value="' . $me['me'] . '" >' . labelvalue($method, "me", $me['me']) . '</option>';
                                            endforeach;
                                        } else {
                                            echo '<option value="">No options available</option>';
                                        }

                                        ?>
                                    </select>
                                </div>

                                <div class="top10 col-xl-3 col-lg-3 col-md-3 col-sm-3 col-6">
                                    <br />
                                    <p><code>Location (IND):</code></p>
                                    <select class="select-full" name="ind" id="ind">
                                        <option value="">Select</option>
                                        <?php
                                        if (count($inds) > 0) {
                                            foreach ($inds as $ind) :
                                                $selected = ($_SESSION['ind'] == $ind['ind']) ? ' selected="selected"' : '';
                                                echo '<option ' . $selected . ' value="' . $ind['ind'] . '" >' . labelvalue($tableind, "ind", $ind['ind']) . '</option>';
                                            endforeach;
                                        } else {
                                            echo '<option value="">No options available</option>';
                                        }

                                        ?>
                                    </select>
                                </div>


                                <div class="top10 col-xl-3 col-lg-3 col-md-3 col-sm-3 col-6">
                                    <br />
                                    <p><code>Date</code></p>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input name="daterange" id="daterange" type="text" class="form-control" placeholder="Date" value="
                                        <?php
                                        if (isset($_SESSION['daterange'])) {
                                            echo $_SESSION['daterange'];
                                        }
                                        ?>">
                                    </div>

                                </div>

                                <div class="top10 col-xl-3 col-lg-3 col-md-3 col-sm-3 col-6">
                                    <br />
                                    <p><code>Enumeration Area (EA):</code></p>
                                    <select class="select-full" name="ea" id="ea">
                                        <option value="">Select</option>
                                        <?php
                                        if (count($eas) > 0) {
                                            foreach ($eas as $ea) :
                                                $selected = ($_SESSION['ea'] == $ea['ea']) ? ' selected="selected"' : '';
                                                echo '<option ' . $selected . ' value="' . $ea['ea'] . '" >' . labelvalue($enumerationarea, "ea", $ea['ea']) . '</option>';
                                            endforeach;
                                        } else {
                                            echo '<option value="">No options available</option>';
                                        }

                                        ?>
                                    </select>

                                </div>


                            </div>

                            <div class="row">
                                <div class="top10 col-xl-3 col-lg-3 col-md-3 col-sm-3 col-6">
                                    <br />
                                    <p><code>Habitat type (HT):</code></p>
                                    <select class="select-full" name="ea" id="ea">
                                        <option value="">Select</option>
                                        <?php
                                        if (count($hts) > 0) {
                                            foreach ($hts as $ht) :
                                                $selected = ($_SESSION['ht'] == $ht['ht']) ? ' selected="selected"' : '';
                                                echo '<option ' . $selected . ' value="' . $ht['ht'] . '" >' . labelvalue($habitattype, "ht", $ht['ht']) . '</option>';
                                            endforeach;
                                        } else {
                                            echo '<option value="">No options available</option>';
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="top10 col-xl-3 col-lg-3 col-md-3 col-sm-3 col-6">
                                    <br />
                                    <p><code>Treatment (TR):</code></p>
                                    <select class="select-full" name="ea" id="ea">
                                        <option value="">Select</option>
                                        <?php
                                        if (count($trs) > 0) {
                                            foreach ($trs as $tr) :
                                                $selected = ($_SESSION['tr'] == $tr['tr']) ? ' selected="selected"' : '';
                                                echo '<option ' . $selected . ' value="' . $tr['tr'] . '" >' . labelvalue($treatment, "tr", $tr['tr']) . '</option>';
                                            endforeach;
                                        } else {
                                            echo '<option value="">No options available</option>';
                                        }
                                        ?>
                                    </select>
                                </div>


                            </div>


                            <br />
                            <input type="hidden" name="action" id="action" value="">
                            <button type="submit" name="filter" id="filter" class="btn btn-primary btn-lg btn-flat ">Apply Filter<i class="glyphicon glyphicon-filter"> </i>
                            </button>
                            <button type="submit" name="filterclear" id="filterclear" class="btn btn-default btn-lg btn-flat ">Clear</button>


                    </div>
                    </form>
                    <!-- filter -->
                </div>
            </div>

        </div>
    </div>


    <!-- Data Summary -->
    <h3 class="subtitle">Data Summary</h3>
    <div class="widget">
        <div class="tabbable">
            <ul class="nav nav-pills nav-justified">
                <li class="<?php echo $disabless1; ?>"><a href="#panel_ss1" data-toggle="tab"><i class="fa fa-tasks"></i> SS1 - </a></li>
                <li class="<?php echo $disabless2; ?>"><a href="#panel_ss2" data-toggle="tab"><i class="fa fa-tasks"></i> SS2 - </a></li>
                <li class="<?php echo $disabless3; ?>"><a href="#panel_ss3" data-toggle="tab"><i class="fa fa-tasks"></i> SS3 - </a></li>
                <li class="<?php echo $disabless4; ?>"><a href="#panel_ss4" data-toggle="tab"><i class="fa fa-tasks"></i> SS4 - </a></li>
                <li><a class="active" href="#panel_frequency" data-toggle="tab"><i class="fa fa-tasks"></i>
                        Frequency distribution (ED1) </a></li>
            </ul>

            <div class="tab-content pill-content">
                <div class="tab-pane fade in" id="panel_ss1">

                    <ul class="nav nav-list">
                        <li class="nav-header">Descriptive Summary</li>
                        <li>
                            <a onclick="f13req_ss1('P')" data-toggle="modal" role="button" data-target="#sumchart_f13req_ss1">Species Composition</a>
                        </li>
                        <li>
                            <a onclick="f1req_ss1('B')" data-toggle="modal" role="button" data-target="#sumchart_f1req_ss1">Anopheline Mosquito Population Summary </a>
                        </li>
                        <li>
                            <a onclick="f2req_ss1('B')" data-toggle="modal" role="button" data-target="#sumchart_f2req_ss1">Culicine Mosquito Population Summary </a>
                        </li>
                        <li>
                            <a onclick="f3req_ss1('L')" data-toggle="modal" role="button" data-target="#sumchart_f3req_ss1"> Daily - Anopheline Female Mosquito Caught</a>
                        </li>
                        <li>
                            <a onclick="f4req_ss1('L')" data-toggle="modal" role="button" data-target="#sumchart_f4req_ss1"> Weekly - Anopheline Female Mosquito Caught </a>
                        </li>
                        <li>
                            <a onclick="f5req_ss1('B')" data-toggle="modal" role="button" data-target="#sumchart_f5req_ss1"> Monthly - Anopheline Female Mosquito Caught </a>
                        </li>
                        <li>
                            <a onclick="f6req_ss1('L')" data-toggle="modal" role="button" data-target="#sumchart_f6req_ss1"> Daily - Culicine Female Mosquito Caught </a>
                        </li>
                        <li>
                            <a onclick="f7req_ss1('L')" data-toggle="modal" role="button" data-target="#sumchart_f7req_ss1"> Weekly - Culicine Female Mosquito Caught </a>
                        </li>
                        <li>
                            <a onclick="f8req_ss1('B')" data-toggle="modal" role="button" data-target="#sumchart_f8req_ss1"> Monthly - Culicine Female Mosquito Caught </a>
                        </li>
                        <li>
                            <a onclick="f9req_ss1('B')" data-toggle="modal" role="button" data-target="#sumchart_f9req_ss1">Mosquito Population Summary by site </a>
                        </li>
                        <li>
                            <a onclick="f10req_ss1('P')" data-toggle="modal" role="button" data-target="#sumchart_f10req_ss1"> An. gambiae s.l abdominal status </a>
                        </li>
                        <li>
                            <a onclick="f11req_ss1('P')" data-toggle="modal" role="button" data-target="#sumchart_f11req_ss1">An. funestus abdominal status</a>
                        </li>
                        <li>
                            <a onclick="f12req_ss1('B')" data-toggle="modal" role="button" data-target="#sumchart_f12req_ss1">Hourly Biting Rate</a>
                        </li>
                    </ul>

                </div>

                <div class="tab-pane fade" id="panel_ss2">

                    <ul class="nav nav-list">
                        <li class="nav-header">Descriptive Summary</li>
                        <li>
                            <a onclick="f1req_ss2('B')" data-toggle="modal" role="button" data-target="#sumchart_f1req_ss2"> Pupae density - Daily </a>
                        </li>
                        <li>
                            <a onclick="f2req_ss2('B')" data-toggle="modal" role="button" data-target="#sumchart_f2req_ss2"> Pupae density - Weekly </a>
                        </li>
                        <li>
                            <a onclick="f3req_ss2('B')" data-toggle="modal" role="button" data-target="#sumchart_f3req_ss2"> Pupae density - Monthly </a>
                        </li>
                        <li>
                            <a onclick="f4req_ss2('B')" data-toggle="modal" role="button" data-target="#sumchart_f4req_ss2"> Larvae density - Daily </a>
                        </li>
                        <li>
                            <a onclick="f5req_ss2('B')" data-toggle="modal" role="button" data-target="#sumchart_f5req_ss2"> Larvae density - Weekly </a>
                        </li>
                        <li>
                            <a onclick="f6req_ss2('B')" data-toggle="modal" role="button" data-target="#sumchart_f6req_ss2"> Larvae density - Monthly </a>
                        </li>
                        <li>
                            <a onclick="f7req_ss2('B')" data-toggle="modal" role="button" data-target="#sumchart_f7req_ss2"> Larvae Population Summary </a>
                        </li>



                    </ul>

                </div>

                <div class="tab-pane fade" id="panel_ss3">

                    <ul class="nav nav-list">
                        <li class="nav-header">Descriptive Summary</li>
                        <li>
                            <a onclick="f1req_ss3('B')" data-toggle="modal" role="button" data-target="#sumchart_f1req_ss3"> CDC Resistance: Count vs KnockDown Time </a>
                        </li>
                        <li>
                            <a onclick="f2req_ss3('B')" data-toggle="modal" role="button" data-target="#sumchart_f2req_ss3"> WHO Cone Resistance: Count vs KnockDown Time </a>
                        </li>
                        <li>
                            <a onclick="f3req_ss3('B')" data-toggle="modal" role="button" data-target="#sumchart_f3req_ss3"> WHO Tube Resistance: Count vs KnockDown Time </a>
                        </li>

                        <li>
                            <a onclick="f4req_ss3('B')" data-toggle="modal" role="button" data-target="#sumchart_f4req_ss3"> CDC Resistance: Mortality vs Insecticide Tested</a>
                        </li>
                        <li>
                            <a onclick="f5req_ss3('B')" data-toggle="modal" role="button" data-target="#sumchart_f5req_ss3"> WHO CONE Resistance: Mortality vs Insecticide Tested </a>
                        </li>
                        <li>
                            <a onclick="f6req_ss3('B')" data-toggle="modal" role="button" data-target="#sumchart_f6req_ss3"> WHO TUBE Resistance: Mortality vs Insecticide Tested </a>
                        </li>

                    </ul>

                </div>

                <div class="tab-pane fade" id="panel_ss4">

                    <ul class="nav nav-list">
                        <li class="nav-header">Descriptive Summary</li>
                        <li>
                            <a onclick="f1req_ss4('B')" data-toggle="modal" role="button" data-target="#sumchart_f1req_ss4"> Snails Caught - Daily </a>
                        </li>
                        <li>
                            <a onclick="f2req_ss4('B')" data-toggle="modal" role="button" data-target="#sumchart_f2req_ss4"> Snails Caught - Weekly </a>
                        </li>
                        <li>
                            <a onclick="f3req_ss4('B')" data-toggle="modal" role="button" data-target="#sumchart_f3req_ss4"> Snails Caught - Monthly </a>
                        </li>
                        <li>
                            <a onclick="f4req_ss4('P')" data-toggle="modal" role="button" data-target="#sumchart_f4req_ss4"> Snail Population Summary </a>
                        </li>

                    </ul>

                </div>

                <div class="tab-pane fade" id="panel_frequency">

                    <ul class="nav nav-list">
                        <li class="nav-header">Frequency distribution Graphs</li>
                        <li>
                            <a onclick="f1req_ed1('B')" data-toggle="modal" role="button" data-target="#sumchart_f1req_ed1">Enumeration area</a>
                        </li>
                        <li>
                            <a onclick="f2req_ed1('B')" data-toggle="modal" role="button" data-target="#sumchart_f2req_ed1">Cluster</a>
                        </li>
                        <li>
                            <a onclick="f3req_ed1('B')" data-toggle="modal" role="button" data-target="#sumchart_f3req_ed1">Compound</a>
                        </li>
                        <li>
                            <a onclick="f4req_ed1('B')" data-toggle="modal" role="button" data-target="#sumchart_f4req_ed1">Method</a>
                        </li>
                        <li>
                            <a onclick="f5req_ed1('B')" data-toggle="modal" role="button" data-target="#sumchart_f5req_ed1">Location</a>
                        </li>
                        <li>
                            <a onclick="f6req_ed1('B')" data-toggle="modal" role="button" data-target="#sumchart_f6req_ed1">Start time</a>
                        </li>
                        <li>
                            <a onclick="f7req_ed1('B')" data-toggle="modal" role="button" data-target="#sumchart_f7req_ed1">Finish time</a>
                        </li>
                        <li>
                            <a onclick="f8req_ed1('B')" data-toggle="modal" role="button" data-target="#sumchart_f8req_ed1">Round</a>
                        </li>
                        <li>
                            <a onclick="f9req_ed1('B')" data-toggle="modal" role="button" data-target="#sumchart_f9req_ed1">Volunteer initials </a>
                        </li>

                    </ul>

                </div>
            </div>
        </div>
    </div>
    <!-- /Data Summary -->

    <!-- ss1 -->
    <?php include_once('layouts/summary_ss1.php'); ?>
    <!--/ss1 -->

    <!-- ed1 -->
    <?php include_once('layouts/summary_ed1.php'); ?>
    <!--/ed1 -->

    <!--ss2-->
    <?php include_once('layouts/summary_ss2.php'); ?>
    <!--/ss2 -->

    <!-- ss4 -->
    <?php include_once('layouts/summary_ss4.php'); ?>
    <!--/ss4 -->

    <!-- ss3-->
    <?php include_once('layouts/summary_ss3.php'); ?>
    <!--/ss3 -->


</div>


<script>
    $(document).ready(function() {
        $("#FromDate").datepicker({
            dateFormat: 'yy/mm/dd',
            maxDate: 0,
            numberOfMonths: 1,
            onSelect: function(selected) {
                $("#ToDate").datepicker("option", "minDate", selected)

            }
        });

        $("#ToDate").datepicker({
            dateFormat: 'yy/mm/dd',
            minDate: 0,
            maxDate: 0,
            numberOfMonths: 1,
            onSelect: function(selected) {
                $("#FromDate").datepicker("option", "maxDate", selected)
            }
        });

        $('#daterange').daterangepicker();
    });
</script>

<?php include_once('layouts/foot.php'); ?>