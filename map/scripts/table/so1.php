<?php
include_once('../../includes/load.php');

//$limit =10;
//$offset = 50;
$limit = $_GET['limit'];
$offset = $_GET['offset'];


$table = "custso";
$table2 = "SO1";

$col = getcolumnname($_SESSION['expcode'], $table, $table2);

$col = renamecolumn($col, "so1");

if (isset($_GET['search'])) {
    $searchText = $_GET['search'];
    $where = "WHERE CONCAT_WS('', $col) LIKE '%" . $searchText . "%'";
} else {
    $where = '';
}

$prefixtable = $_SESSION['expcode'] . "_";

$ed1 = $prefixtable . "ed1";
$ss1 = $prefixtable . "ss1";
$ss3 = $prefixtable . "ss3";
$edss = $prefixtable . "edss";
$ssso = $prefixtable . "ssso";
$so1 = $prefixtable . "so1";

$sql = "SELECT
        so1.sssoid as id ,$col
        FROM
        $so1 as so1
        ORDER BY so1.ssen, so1.rc ASC $where limit $offset, $limit ";

$sql2 = "SELECT
       so1.sssoid as id ,$col
        FROM
        $so1 as so1
        ORDER BY so1.ssen, so1.rc ASC";

$so1data = find_by_sql($sql);

$count = find_row_count($sql2);

$test = array(
    'total' => $count,
    'rows' => $so1data
);

header('Content-Type: application/json');

echo json_encode($test);
