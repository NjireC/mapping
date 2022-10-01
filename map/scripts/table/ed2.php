<?php

include_once '../../includes/load.php';

$limit =$_GET['limit'];
$offset=$_GET['offset'];

//$limit = 10;
//$offset = 20;

$table ="custed";
$table2="ED2";

$prefixtable=$_SESSION['expcode']."_";

$ed1=$prefixtable."ed2";
$ss1=$prefixtable."ss1";
$ss3=$prefixtable."ss3";
$edss=$prefixtable."edss";
$ssso=$prefixtable."ssso";
$so1 =$prefixtable."so1_sk";

$tablelabel=$prefixtable."custlabel";
$colonycode=$prefixtable."colonycode";
$treatment =$prefixtable."treatment_two";

$audit_trail=$prefixtable."audit_trail";

$fetchfields=$db->query("SELECT * FROM {$db->escape($tablelabel)} WHERE pc='{$db->escape($_SESSION['expcode'])}' AND location='home' LIMIT 1");

if($db->num_rows($fetchfields)>0){
   $result        =$db->fetch_assoc($fetchfields);
   $checked_fields=explode(",", $result['p_attri']);
   
}

$col=getcolumnname($_SESSION['expcode'], $table, $table2);

//$col = renamecolumn($col,"ed1");
$arraycol=explode(",", $col);

$col=implode(",", $arraycol);

if(isset($_GET['search'])){
   $searchText=$_GET['search'];
   $where     ="WHERE CONCAT_WS('', $col) LIKE '%".$searchText."%'";
} else{
   $where='';
}

$sql="SELECT
ed1.id as id ,$col
,CONCAT(auditsen,':',auditfr) AS keyid
FROM
projectregsite
INNER JOIN projectreg
ON (projectregsite.projectreg_id = projectreg.id)
INNER JOIN site
ON (projectregsite.site_id = site.site_id)
INNER JOIN ".$prefixtable."ed2 as ed1
ON (ed1.projectregsite_id = projectregsite.id)
INNER JOIN ".$prefixtable."edss as edss
ON (ed1.id = edss.ed2id)
LEFT JOIN (
  SELECT * FROM $audit_trail as audit_trail
    GROUP BY CONCAT(auditsen,':',auditfr)
) AS audit ON (ed1.sen = audit.auditsen and ed1.fr = audit.auditfr and audit.auditformtype = 1)
$where ORDER BY ed1.sen ASC,ed1.fr ASC limit $offset, $limit ";

$sql2="SELECT
ed1.id as id ,$col
,CONCAT(auditsen,':',auditfr) AS keyid
FROM
projectregsite
INNER JOIN projectreg
ON (projectregsite.projectreg_id = projectreg.id)
INNER JOIN site
ON (projectregsite.site_id = site.site_id)
INNER JOIN ".$prefixtable."ed2 as ed1
ON (ed1.projectregsite_id = projectregsite.id)
INNER JOIN ".$prefixtable."edss as edss
ON (ed1.id = edss.ed2id) AND edss.ed2id IS NOT NULL
LEFT JOIN (
SELECT * FROM $audit_trail as audit_trail
GROUP BY CONCAT(auditsen,':',auditfr)
) AS audit ON (ed1.sen = audit.auditsen and ed1.fr = audit.auditfr and audit.auditformtype = 1) ";

$ed1data=find_by_sql($sql);

$count=find_row_count($sql2);

$res=array(
   'total'=>$count,
   'rows' =>$ed1data,
);

header('Content-Type: application/json');

echo json_encode($res);
