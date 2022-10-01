<?php

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
 **/

define("URL_SEPARATOR", '/');
define("DS", DIRECTORY_SEPARATOR);
defined('SITE_ROOT') ? NULL : define('SITE_ROOT', realpath(dirname(__FILE__)));
define("LIB_PATH_INC", SITE_ROOT . DS);

require_once(LIB_PATH_INC . 'config.php');
require_once(LIB_PATH_INC . 'functions.php');
require_once(LIB_PATH_INC . 'function.php');
require_once(LIB_PATH_INC . 'menu.php');
require_once(LIB_PATH_INC . 'session.php');
require_once(LIB_PATH_INC . 'upload.php');
require_once(LIB_PATH_INC . 'database.php');
require_once(LIB_PATH_INC . 'sql.php');

error_reporting(E_ALL);
ini_set('display_errors', 0);

$k = "fgnhgDFGGHN34567JVCBNM";
define('SEC', $k);

define('SITE_KEY', "6LdKp5UUAAAAAAU7T5BibQlnSkbZqksMN2Smvtxr");
define('SECRET_KEY', "6LdKp5UUAAAAAJdFAUlQp-HlKYFuN5gtOsl9z_SL");

$url = URL;

$current_user = current_user();

$settings = find_by_('settings', 'id', 1);

if (!empty($current_user)) {

   $staff_id = $current_user['staff_id'];
   $fname    = $current_user['fname'];
   $lname    = $current_user['lname'];
   $theme    = $current_user['theme'];
   $name     = $fname . " " . $lname;
}

$i = 0;
//$theme = get_theme($i);

if (isset($_SESSION['expcode'])) {

   $prefixtable = $_SESSION['expcode'] . "_";

   //form type ed
   $edformtype = cust_formtype('custed', $_SESSION['expcode']);
   $disableed1 = "disabled";
   $disableed2 = "disabled";

   if (in_array("ED1", $edformtype)) {
      $ed = $prefixtable . "ed1";
      $edss  = $prefixtable . "edss";
      $edssid = "$edss.ed1id";

      $edresult = $db->query("SELECT * FROM $ed");

      $disableed1 = "";
   } else if (in_array("ED2", $edformtype)) {
      $ed = $prefixtable . "ed2";
      $edss = $prefixtable . "edss";
      $edssid = "$edss.ed2id";

      $edresult = $db->query("SELECT * FROM $ed");

      $disableed2 = "";
   }


   //form type ss
   $ssformtype = cust_formtype('custss', $_SESSION['expcode']);
   $disabless1 = "disabled";
   $disabless2 = "disabled";
   $disabless3 = "disabled";
   $disabless4 = "disabled";

   if (in_array("SS1", $ssformtype)) {
      $ss = $prefixtable . "ss1";
      $ssso = $prefixtable . "ssso";
      $ssssid = "$ssso.ss1id";

      $ssresult = $db->query("SELECT * FROM $ss");

      $disabless1 = "";
   } else if (in_array("SS2", $ssformtype)) {
      $ss = $prefixtable . "ss2";
      $ssso = $prefixtable . "ssso";
      $ssssid = "$ssso.ss2id";
      $ssresult = $db->query("SELECT * FROM $ss");

      $disabless2 = "";
   } else if (in_array("SS3", $ssformtype)) {
      $ss        = $prefixtable . "ss3";
      $ssso      = $prefixtable . "ssso";
      $ssssid    = "$ssso.ss3id";
      $ssresult = $db->query("SELECT * FROM $ss");

      $disabless3 = "";
   } else if (in_array("SS4", $ssformtype)) {
      $ss        = $prefixtable . "ss4";
      $ssso      = $prefixtable . "ssso";
      $ssssid    = "$ssso.ss4id";
      $ssresult = $db->query("SELECT * FROM $ss");

      $disabless4 = "";
   }


   //form type so
   $soformtype = cust_formtype('custso', $_SESSION['expcode']);
   $disableso1 = "disabled";
   $disableso2 = "disabled";

   if (in_array("SO1", $soformtype)) {
      $so = $prefixtable . "so1";
      $soresult = $db->query("SELECT * FROM $so");

      $disableso1 = "";
   } else {
      $soresult = "";
   }
   if (in_array("SO2", $soformtype)) {
      $so  = $prefixtable . "so2";
      $soresult = $db->query("SELECT * FROM $so");

      $disableso2 = "";
   } else {
      $soresult = "";
   }



   //form type st
   $stformtype = cust_formtype('custst', $_SESSION['expcode']);
   $disablest1 = "disabled";
   $disablest2 = "disabled";

   if (in_array("ST1", $stformtype)) {
      $st = $prefixtable . "st1";
      $stresult = $db->query("SELECT * FROM $st");
      $disablest1 = "";
   } else {
      $stresult = "";
   }
   if (in_array("ST1", $stformtype)) {
      $st = $prefixtable . "st2";
      $stresult = $db->query("SELECT * FROM $st");
      $disablest2 = "";
   } else {
      $stresult = "";
   }

   //Other tables

   $tablelabel = $prefixtable . "custlabel";
   $tableind = $prefixtable . "location";
   $method = $prefixtable . "method";
   $cluster = $prefixtable . "cluster";
   $compound = $prefixtable . "compound";
   $treatment = $prefixtable . "treatment";
   $habitattype = $prefixtable . "habitattype";
   $enumerationarea = $prefixtable . "enumerationarea";
} else {

   $disableed1 = "disabled";
   $disableed2 = "disabled";
   $disabless1 = "disabled";
   $disabless2 = "disabled";
   $disabless3 = "disabled";
   $disabless4 = "disabled";
   $disableso1 = "disabled";
   $disableso2 = "disabled";
   $disablest1 = "disabled";
   $disablest2 = "disabled";
}
