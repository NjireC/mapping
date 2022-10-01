<?php

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
 **/

include_once('includes/load.php');
//setting header to json
header('Content-Type: application/json');

$prefixtable = $_SESSION['expcode'] . "_";
$tablelabel = $prefixtable . "custlabel";

$q = $_GET['q'];

$fetchfields = $db->query("SELECT * FROM {$db->escape($tablelabel)} WHERE pc='{$db->escape($_SESSION['expcode'])}' AND location='home' LIMIT 1");

if ($db->num_rows($fetchfields) > 0) {
   $result        = $db->fetch_assoc($fetchfields);
   $checked_fields = explode(",", $result['p_attri']);
}

if (isset($_POST['drange'])) {

   $daterange = $_POST['drange'];

   $sdate = getsdate($daterange);
   $edate = getedate($daterange);

   $_SESSION['hFromDate'] = $sdate;
   $_SESSION['hToDate']   = $edate;
   $_SESSION['hdaterange'] = $daterange;
} else {
   $wherecon = "";
}

if (isset($_SESSION['hFromDate']) && isset($_SESSION['hToDate'])) {
   $wherecon .= " AND ed1.dt BETWEEN '" . date('Y-m-d', strtotime($_SESSION['hFromDate'])) . "' AND '" . date('Y-m-d', strtotime($_SESSION['hToDate'])) . "' ";
} else if (isset($_SESSION['hFromDate'])) {
   $wherecon .= " AND ed1.dt >= '" . date('Y-m-d', strtotime($_SESSION['hFromDate'])) . "'";
} else if (isset($_SESSION['hToDate'])) {
   $wherecon .= " AND ed1.dt <= '" . date('Y-m-d', strtotime($_SESSION['hToDate'])) . "'";
}

if ($q === 'f1req_ss1') {

   if (in_array("ED1", $edformtype)) {
      $query = "SELECT taxon.taxon_name AS TaxonName,
                     SUM(CASE WHEN ss1.sas = 1 THEN ss1.n ELSE 0 end) AS TotalMale,
                     SUM(CASE WHEN ss1.sas = 2 THEN ss1.n ELSE 0 end) AS Unfed,
                     SUM(CASE WHEN ss1.sas = 3 THEN ss1.n ELSE 0 end) AS PartlyFed,
                     SUM(CASE WHEN ss1.sas = 4 THEN ss1.n ELSE 0 end) AS Fed,
                     SUM(CASE WHEN ss1.sas = 5 THEN ss1.n ELSE 0 end) AS Gravid,
                     SUM(CASE WHEN ss1.sas = 6 THEN ss1.n ELSE 0 end) AS TotalFemale
                     FROM projectregsite
                     INNER JOIN projectreg ON (projectregsite.projectreg_id = projectreg.id)
                     INNER JOIN site ON (projectregsite.site_id = site.site_id)
                     INNER JOIN " . $prefixtable . "ed1 as ed1 ON (ed1.projectregsite_id = projectregsite.id)
                     INNER JOIN " . $prefixtable . "edss as edss ON (ed1.id = edss.ed1id)
                     INNER JOIN " . $prefixtable . "ss1 as ss1 ON (ss1.edssid = edss.id)
                     LEFT JOIN method ON (ed1.me = method.meth_code)
                     LEFT JOIN taxon ON (ss1.tx = taxon.taxon_code)
                     LEFT JOIN sexabdominal ON (ss1.sas = sexabdominal.sex_code) where 1=1
                     $wherecon GROUP BY taxon.taxon_name HAVING TotalFemale > 0 or  TotalMale > 0 ORDER BY taxon.taxon_code ASC";
   }
}

if ($q === 'f1req_ed1') {

   (in_array("ea", $checked_fields) ? $ea = TRUE : $ea = FALSE);

   ($ea ? $fieldcol = "enumerationarea.ea" : $fieldcol = "ed1.ea");

   $query = "SELECT $fieldcol, count(*) as frequency
           FROM " . $prefixtable . "ed1 as ed1
           LEFT JOIN " . $prefixtable . "enumerationarea as enumerationarea ON (ed1.ea = enumerationarea.number)
           WHERE 1=1 $wherecon
           GROUP BY ea";
}

if ($q === 'f2req_ed1') {

   (in_array("cr", $checked_fields) ? $cr = TRUE : $cr = FALSE);

   ($cr ? $fieldcol = "cluster.cr" : $fieldcol = "ed1.me");

   $query = "SELECT $fieldcol, count(*) as frequency
           FROM " . $prefixtable . "ed1 as ed1
           LEFT JOIN " . $prefixtable . "cluster as cluster ON (ed1.cr = cluster.number)
           WHERE 1=1 $wherecon
           GROUP BY cr";
}

if ($q === 'f3req_ed1') {

   (in_array("cp", $checked_fields) ? $cp = TRUE : $cp = FALSE);

   ($cp ? $fieldcol = "compound.cp" : $fieldcol = "ed1.me");

   $query = "SELECT $fieldcol, count(*) as frequency
           FROM " . $prefixtable . "ed1 as ed1
           LEFT JOIN " . $prefixtable . "compound as compound ON (ed1.cp = compound.number)
           WHERE 1=1 $wherecon
           GROUP BY cp";
}

if ($q === 'f4req_ed1') {

   (in_array("me", $checked_fields) ? $me = TRUE : $me = FALSE);

   ($me ? $fieldcol = "method.me" : $fieldcol = "ed1.me");

   $query = "SELECT $fieldcol, count(*) as frequency
           FROM " . $prefixtable . "ed1 as ed1
           LEFT JOIN " . $prefixtable . "method as method ON (ed1.me = method.number)
           WHERE 1=1 $wherecon
           GROUP BY me";
}
if ($q === 'f5req_ed1') {

   (in_array("ind", $checked_fields) ? $ind = TRUE : $ind = FALSE);

   ($ind ? $fieldcol = "location.ind" : $fieldcol = "ed1.me");

   $query = "SELECT $fieldcol, count(*) as frequency
           FROM " . $prefixtable . "ed1 as ed1
           LEFT JOIN " . $prefixtable . "location  as location ON (ed1.ind = location.number)
           WHERE 1=1 $wherecon
           GROUP BY ind";
}
if ($q === 'f6req_ed1') {

   $query = "SELECT st, count(*) as frequency
           FROM " . $prefixtable . "ed1 as ed1
           WHERE 1=1 $wherecon
           GROUP BY st";
}

if ($q === 'f7req_ed1') {

   $query = "SELECT ft, count(*) as frequency
           FROM " . $prefixtable . "ed1 as ed1
           WHERE 1=1 $wherecon
           GROUP BY ft";
}

if ($q === 'f8req_ed1') {

   $query = "SELECT rnd, count(*) as frequency
           FROM " . $prefixtable . "ed1 as ed1
           WHERE 1=1 $wherecon
           GROUP BY rnd";
}


if ($q === 'f9req_ed1') {

   $query = "SELECT vi, count(*) as frequency
           FROM " . $prefixtable . "ed1 as ed1
           WHERE 1=1 $wherecon
           GROUP BY vi";
}

if ($q === 'f10req_ed1') {

   $query = "SELECT hp, count(*) as frequency
           FROM " . $prefixtable . "ed1 as ed1
           WHERE 1=1 $wherecon
           GROUP BY vi";
}

if ($q === 'f11req_ed1') {

   $query = "SELECT blk, count(*) as frequency
           FROM " . $prefixtable . "ed1 as ed1
           WHERE 1=1 $wherecon
           GROUP BY vi";
}

if ($q === 'f12req_ed1') {

   (in_array("tr", $checked_fields) ? $tr = TRUE : $tr = FALSE);

   ($tr ? $fieldcol = "treatment.tr" : $fieldcol = "ed1.tr");

   $query = "SELECT $fieldcol, count(*) as frequency
           FROM " . $prefixtable . "ed1 as ed1
           LEFT JOIN " . $prefixtable . "treatment as treatment ON (ed1.tr = treatment.number)
           WHERE 1=1 $wherecon GROUP BY tr";
}

//execute query
$result = $db->query($query);

//loop through the returned data
$data = array();
foreach ($result as $row) {
   $data[] = $row;
}

//free memory associated with result
$result->close();

//now print the data
print json_encode($data);
