<?php

include_once('../includes/load.php');


$limit = $_GET['limit'];
$offset = $_GET['offset'];


$table = "audit_trail";

if(isset($_SESSION['expcode'])){

    $expcode = $_SESSION['expcode'];
    $prefixtable = $expcode."_";

}

$col = "formtype,user,date,action";

if (strlen($col)>0) {

    if(isset($_GET['search'])){
        $searchText = $_GET['search'];
        $where = "WHERE CONCAT_WS('', $col) LIKE '%".$searchText."%'";
    }else{
     $where='';
 }


 $sql ="SELECT auditformtype,audituser,auditdate,auditaction,auditdetail,CONCAT(auditsen,':',auditfr) AS keyid FROM ".$prefixtable."audit_trail as audit $where limit $offset, $limit ";

 $sql2 ="SELECT auditformtype,audituser,auditdate,auditaction,auditdetail,CONCAT(auditsen,':',auditfr) AS keyid FROM ".$prefixtable."audit_trail as audit ";


 $ed1data = find_by_sql($sql);

 $count = find_row_count($sql2);

 $res= array('total' => $count,'rows' => $ed1data );

 header('Content-Type: application/json');

 echo json_encode($res);

}


?>