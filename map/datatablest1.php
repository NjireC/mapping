<?php

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
 **/
require_once('includes/load.php');
$page_title = 'Sample Storage | MosquitoDB';
page_require_level(3);
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


    <!-- /page title -->
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h6 class="panel-title"> Data Table For: <span id="pname"></span>
            </h6>
            <div class="btn-group pull-right">

                <?php include_once('scripts/selectproject.php'); ?>

            </div>
        </div>
    </div>


    <!-- Pre-scrollable table -->
    <div class="panel panel-default">
        <div class="panel-heading">
            <h6 class="panel-title"> Sample Sorting </h6>
        </div>
        <div class="table-responsive has-padding2">

            <table id="tabledata" class="table animate__animated animate__slideInUp" data-url="scripts/table/st1.php" data-toolbar="#toolbar" data-page-size="15" data-page-list="[100,500,1000,2000,5000,8000,10000,All]" data-export-options='{"fileName": "ED1-<?php echo date('Y-m-d'); ?>"}'>


            </table>

        </div>
    </div>
    <!-- /pre-scrollable table -->


    <script>
        $(function() {
            tablest1();
        });

        function tablest1() {

            $('#tabledata').bootstrapTable({
                classes: 'table table-responsive',
                queryParams: function(params) {
                    return {
                        offset: params.offset,
                        limit: params.limit,
                        search: params.search,
                        order: params.order,
                        ordername: params.sort,
                    };
                },

                search: true,
                cache: true,
                mobileResponsive: true,
                maintainSelected: true,
                paginationVAlign: 'both',
                sidePagination: 'server',
                sortable: true,
                showRefresh: true,
                pagination: true,
                showExport: true,
                showFooter: false,
                showColumns: true,
                trimOnSearch: true,
                paginationFirstText: "First",
                paginationLastText: "Last",
                paginationPreText: "Previous",
                paginationNextText: "Next",

                columns: [
                    <?php

                    $table = "custso";
                    $table2 = "ST1";

                    $col = getcolumnname($_SESSION['expcode'], $table, $table2);
                    $col2 = getcolumnname2($_SESSION['expcode'], $table, $table2);

                    $array1 = explode(',', $col);
                    $array2 = explode(',', $col2);


                    if (strlen($col) > 0) {

                        echo getcolumnnametable2($array1, $array2);
                    }


                    ?>

                    /*,{
                     field: "keyid",
                     title: 'Action',
                     align: 'center',
                     formatter: auditFormatter
                     } */


                ],

                formatLoadingMessage: function() {
                    return '<h4><i class="fa fa-spinner fa-spin" aria-hidden="true"></i> Loading... please wait.... </h4>';
                }

            });
        }


        function auditFormatter(value, row, index) {

            if (value) {
                return ['<a class="btn btn-primary iconaudit" pid="' + value + '" title="Audit"><i class="fa fa-eye">Audit Logs</i></a>'];
            } else {
                return ['<a class="btn btn-primary iconaudit" pid="' + value + '" title="Audit" disabled="disabled"><i class="fa fa-eye">Audit Logs</i></a>'];
            }


        }
    </script>

    <?php include_once('layouts/foot.php'); ?>