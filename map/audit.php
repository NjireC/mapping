<?php

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
 **/

require_once('includes/load.php');
$page_title = 'Audit Trail';
page_require_level(2);
include_once('layouts/head.php');

?>

<!-- Page content -->
<div class="page-content">
    <!-- Page title -->
    <div class="page-title">
        <h5><i class="fa fa-bars"></i> Home <small>Welcome, <?php echo $name;  ?> </small></h5>
    </div>



    <!-- /page title -->
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h6 class="panel-title"> Audit Trail For: <span id="pname"></span> </h6>
            <div class="btn-group pull-right">

                <?php include_once('scripts/selectproject.php'); ?>

            </div>
        </div>
    </div>


    <!-- Pre-scrollable table -->
    <div class="panel panel-default">
        <div class="panel-heading">
            <h6 class="panel-title"> Audit Trail </h6>
        </div>
        <div class="table-responsive has-padding2">

            <table id="tabledata" class="table" data-toggle="table" name="tabledata" data-url="scripts/audit.php" data-pagination="true" data-show-refresh="false" data-show-columns="true" data-toolbar="#toolbar" data-page-size="100" data-id-field="id" data-page-list="[100,500,1000,2000,5000,8000,10000,All]" data-show-export="false" data-export-options='{"fileName": "auditTrail-<?php echo date('Y-m-d'); ?>"}' data-advanced-search="true" data-search="true">
                <thead>

            </table>

        </div>
    </div>
    <!-- /pre-scrollable table -->




    <script>
        var $table = $('#tabledata');
        $(function() {
            buildTable($table);
        });

        function buildTable($el) {

            $el.bootstrapTable({
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
                mobileResponsive: true,
                maintainSelected: true,
                height: 650,
                paginationVAlign: 'both',
                sidePagination: 'server',
                sortable: true,
                showRefresh: false,
                pagination: true,
                showExport: true,
                showFooter: false,
                showColumns: true,
                trimOnSearch: false,
                paginationFirstText: "First",
                paginationLastText: "Last",
                paginationPreText: "Previous",
                paginationNextText: "Next",

                columns: [{
                    "field": "auditid",
                    "searchable": true,
                    "sortable": false,
                    "title": "ID",
                    "visible": false
                }, {
                    "field": "auditformtype",
                    "searchable": true,
                    "sortable": false,
                    "title": "Formtype",
                    "visible": true,
                    formatter: function(value, row, index) {
                        if (value == '1') {
                            return "Experimental Design";
                        } else if (value == '2') {
                            return "Sample Sorting";
                        } else if (value == '3') {
                            return "Sample Observation";
                        } else if (value == '4') {
                            return "Sample Storage";
                        }

                    }



                }, {
                    "field": "keyid",
                    "searchable": true,
                    "sortable": false,
                    "title": "Sen:Fr",
                    "visible": true
                }, {
                    "field": "audituser",
                    "searchable": true,
                    "sortable": false,
                    "title": "Modified by",
                    "visible": true
                }, {
                    "field": "auditdate",
                    "searchable": true,
                    "sortable": false,
                    "title": "Date",
                    "visible": true
                }, {
                    "field": "auditaction",
                    "searchable": true,
                    "sortable": false,
                    "title": "Action",
                    "visible": true
                }, {
                    "field": "auditdetail",
                    "searchable": true,
                    "sortable": false,
                    "title": "Detail",
                    "visible": true
                }],

                formatLoadingMessage: function() {
                    return '<h4><i class="fa fa-spinner fa-spin" aria-hidden="true"></i> Loading... please wait.... </h4>';
                }

            });
        }
    </script>

    <?php include_once('layouts/foot.php'); ?>