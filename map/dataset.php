<?php
require_once('includes/load.php');
page_require_level(3);
$page_title = 'Dataset | MosquitoDB';
include_once('layouts/head.php');
?>
<!-- Page content -->
<div class="page-content">
    <!-- Page title -->
    <div class="page-title">
        <h5><i class="fa fa-bars"></i> Home
            <small>Welcome, <?php echo $name; ?> </small>
        </h5>
    </div>

    <div class="panel panel-primary">
        <div class="panel-heading">
            <h6 class="panel-title"> Dataset For: <span id="pname"></span></h6>
            <div class="btn-group pull-right">
                <?php include_once('scripts/selectproject.php'); ?>
            </div>
        </div>
    </div>

    <!-- Table inside panel body -->
    <div class="panel panel-default">
        <div class="panel-heading">
            <h6 class="panel-title">Generate various
                single/combined
                datasets</h6>
        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-bordered">

                    <tbody>

                        <tr>
                            <th>
                                <input class="styled" id="edc" name="edc" type="checkbox" />
                                Experimental Design

                            </th>
                            <th>
                                <input class="styled" id="ssc" name="ssc" type="checkbox" />
                                Sample Sorting
                            </th>
                            <th>
                                <input class="styled" id="soc" name="soc" type="checkbox" />
                                Sample Observation
                            </th>
                            <th>
                                <input class="styled" id="fsc" name="fsc" type="checkbox" />
                                Sample Storage
                            </th>
                            <th>
                                <input class="styled" id="joc" name="joc" type="checkbox" />
                                Other options
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="radio">
                                    <label class="opa1"><input type="radio" name="ed" id="ed" value="11" disabled="disabled">ED1</label>
                                </div>
                                <div class="radio">
                                    <label class="opa1">
                                        <input type="radio" name="ed" id="ed" value="12" disabled="disabled">ED2</label>
                                </div>
                            </td>
                            <td>
                                <div class="radio">
                                    <label class="opa2"><input type="radio" name="ss" id="ss" value="13" disabled="disabled">SS1</label>
                                </div>
                                <div class="radio">
                                    <label class="opa2">
                                        <input type="radio" name="ss" id="ss" value="14" disabled="disabled">SS2</label>
                                </div>
                                <div class="radio">
                                    <label class="opa2">
                                        <input type="radio" name="ss" id="ss" value="15" disabled="disabled">SS3</label>
                                </div>
                                <div class="radio">
                                    <label class="opa2">
                                        <input type="radio" name="ss" id="ss" value="23" disabled="disabled">SS4</label>
                                </div>

                            </td>
                            <td>
                                <div class="radio">
                                    <label class="opa3"><input type="radio" name="so" id="so" value="16" disabled="disabled">SO1</label>
                                </div>
                                <div class="radio">
                                    <label class="opa3">
                                        <input type="radio" name="so" id="so" value="17" disabled="disabled">SO2</label>
                                </div>

                            </td>
                            <td>
                                <div class="radio">
                                    <label class="opa5"><input type="radio" name="fs" id="fs" value="18" disabled="disabled">ST1</label>
                                </div>
                                <div class="radio">
                                    <label class="opa5">
                                        <input type="radio" name="fs" id="fs" value="19" disabled="disabled">ST2</label>
                                </div>

                            </td>
                            <td>
                                <div class="radio">
                                    <label class="opa4">
                                        <input type="radio" name="jo" value="22" id="tt" disabled="disabled">Transpose</label>
                                </div>

                                <!--   <div class="radio">
                                 <label class="opa4"> <input  type="radio" name="jo" value="21" id="jo" disabled="disabled">Inner Join</label>
                             </div> -->


                            </td>

                        </tr>

                    </tbody>
                </table>

                <input type="hidden" id="total" name="total">

                <br />

                <table border="0" align="center">
                    <tr>
                        <td align="left" valign="left">
                            <input type="button" value="Generate Dataset" class="btn btn-primary btn-space" id="generate">
                        </td>
                        <td align="left" valign="middle">
                            <div id="download"></div>
                        </td>
                        <td>
                            <div id="loaderIcon33" style="display:none">
                                <img src="assets/images/ajax.gif" /></div>
                        </td>

                    </tr>
                    <tr>
                        <td></td>
                    </tr>


                </table>


            </div>

        </div>

    </div>
    <!-- /table inside panel body -->

    <script type="text/javascript">
        $(document).ready(function() {

            $(".opa1").css('opacity', '.4');
            $(".opa2").css('opacity', '.4');
            $(".opa3").css('opacity', '.4');
            $(".opa4").css('opacity', '.4');
            $(".opa5").css('opacity', '.4');

            $("#edc").click(function() {
                if ($(this).is(":checked")) {
                    $("input[name='ed']").prop("disabled", false);
                    $(".opa1").css('opacity', '1');


                } else {
                    $("input[name='ed']").prop('checked', false);
                    $("input[name='ed']").prop("disabled", true);
                    $(".opa1").css('opacity', '.4');
                }
            });

            $("#ssc").click(function() {
                if ($(this).is(":checked")) {
                    $("input[name='ss']").prop("disabled", false);
                    $(".opa2").css('opacity', '1');
                } else {
                    $("input[name='ss']").prop('checked', false);
                    $("input[name='ss']").prop("disabled", true);
                    $(".opa2").css('opacity', '.4');


                }
            });

            $("#soc").click(function() {
                if ($(this).is(":checked")) {
                    $("input[name='so']").prop("disabled", false);
                    $(".opa3").css('opacity', '1');
                } else {
                    $("input[name='so']").prop('checked', false);
                    $("input[name='so']").prop("disabled", true);
                    $(".opa3").css('opacity', '.4');
                }
            });


            $("#joc").click(function() {
                if ($(this).is(":checked")) {
                    $("input[name='jo']").prop("disabled", false);
                    $(".opa4").css('opacity', '1');
                } else {
                    $("input[name='jo']").prop('checked', false);
                    $("input[name='jo']").prop("disabled", true);
                    $(".opa4").css('opacity', '.3');
                }
            });

            $("#fsc").click(function() {
                if ($(this).is(":checked")) {
                    $("input[name='fs']").prop("disabled", false);
                    $(".opa5").css('opacity', '1');
                } else {
                    $("input[name='fs']").prop('checked', false);
                    $("input[name='fs']").prop("disabled", true);
                    $(".opa5").css('opacity', '.3');
                }
            });


        });


        function doAdd() {

            var total = "";
            $("input[type=radio]:checked").each(function() {
                total += $(this).val();

            });

            document.getElementById('total').value = total;

            //alert(total);

        }

        $(document).ready(function() {

            $('input[type=checkbox]').click(function() {
                doAdd();
            });

            $('input[type=radio]').click(function() {
                doAdd();
            });
        });


        $(document).ready(function() {
            $('#generate').click(function() {

                var exp = document.getElementById('exp').value;
                var rp = document.getElementById('total').value;

                $("#download").empty();

                if (validate()) {

                    $.ajax({
                        url: 'edsspart.php',
                        cache: false,
                        data: {
                            rp: rp,
                            cp: exp
                        },
                        type: 'POST',
                        beforeSend: function() {
                            $("#loaderIcon").show();
                            $("#loaderIcon33").show();
                            $.jGrowl('Processing your dataset', {
                                life: 5000,
                                theme: 'growl-success',
                                header: 'Please wait!'
                            });
                            $("#download").empty();

                        },
                        success: function(html) {
                            setTimeout(function() {
                                $('#download').html(html);
                                $("#loaderIcon33").hide();
                                $("#loaderIcon").hide();
                            }, 2000);
                        }
                    });

                } //end if

            });


        });
    </script>

    <?php include_once('layouts/foot.php'); ?>