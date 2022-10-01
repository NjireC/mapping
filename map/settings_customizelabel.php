<?php

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
 **/
require_once('includes/load.php');
$page_title = 'Settings | MosquitoDB';
page_require_level(2);
include_once('layouts/head.php');




if (isset($_SESSION['expcode'])) {

  $expcode = $_SESSION['expcode'];
  $prefixtable = $expcode . "_";

  $table = $prefixtable . "custlabel";
}

$formtype = "home";


if (isset($_POST['submited2'])) {


  $fieldsshort_array = array();

  foreach ($_POST['fieldsarr'] as $field) {

    preg_match('#\((.*?)\)#', $field, $match);
    $my =  strtolower($match[1]) . "\n";

    array_push($fieldsshort_array, $my);
  }


  $fieldsarr = implode(",", $_POST['fieldsarr']);
  $fieldsarr = str_replace("\n", "", $fieldsarr);

  $fieldsshort_array2 = implode(",", $fieldsshort_array);
  $fieldsshort_array2 = str_replace("\n", "", $fieldsshort_array2);

  $fieldarraysize = sizeof($_POST['fieldsarr']);


  if (!empty($_SESSION['expcode'])) {

    $resultcust = $db->query("SELECT * FROM {$db->escape($table)} WHERE pc='{$db->escape($_SESSION['expcode'])}' AND location='{$formtype}' LIMIT 1");

    if ($db->num_rows($resultcust) === 0) {

      $result2 = $db->query("INSERT INTO {$db->escape($table)} (pc, location, num_split, p_attri,p_attri2) VALUES('" . $_SESSION['expcode'] . "','" . $formtype . "','" . $fieldarraysize . "','" . $fieldsshort_array2 . "','" . $fieldsarr . "')");


      if ($result2) {

        $_SESSION['msg'] = '<script type="text/javascript">' .
          "$.jGrowl('Fields successfuly saved!', {  theme: 'growl-success', header: 'Success!' });" .
          '</script>';

        echo $_SESSION['msg'];
        unset($_SESSION['msg']);
      }
    } else {

      $sql = "UPDATE {$db->escape($table)} SET num_split='" . $fieldarraysize . "',p_attri='" . $fieldsshort_array2 . "',p_attri2='" . $fieldsarr . "' WHERE pc ='{$_SESSION['expcode']}' AND location='{$formtype}' LIMIT 1";

      $result2 =  $db->query($sql);

      if ($result2) {

        $_SESSION['msg'] = '<script type="text/javascript">' .
          "$.jGrowl('Fields successfuly saved!', {  theme: 'growl-success', header: 'Success!' });" .
          '</script>';

        echo $_SESSION['msg'];
        unset($_SESSION['msg']);
      }
    }
  }
}


?>

<!-- Page content -->
<div class="page-content">
  <?php echo display_msg_popup($msg);  ?>
  <!-- Page title -->
  <div class="page-title">
    <h5><i class="fa fa-bars"></i> Home <small>Welcome, <?php echo $name . $table;  ?> </small></h5>
  </div>



  <!-- /page title -->
  <div class="panel panel-primary">
    <div class="panel-heading">
      <h6 class="panel-title"> Dataset Table For: <span id="pname"></span> </h6>
      <div class="btn-group pull-right">

        <?php include_once('scripts/selectproject.php'); ?>

      </div>
    </div>
  </div>


  <?php include_once('layouts/settingsmenu.php'); ?>

  <br />


  <div class="panel panel-default">
    <div class="panel-heading">
      <h6 class="panel-title">Customize Labels/Values displayed </h6>
    </div>
    <div class="panel-body">


      <form method="post" action=""><br />
        <?php

        $checked_fields = array();


        if (isset($_SESSION['expcode'])) {

          //fetchcheckedvalues
          $fetchfields = $db->query("SELECT * FROM {$db->escape($table)} WHERE pc='{$db->escape($_SESSION['expcode'])}' AND location='{$formtype}' LIMIT 1");


          if ($db->num_rows($fetchfields) > 0) {
            $result = $db->fetch_assoc($fetchfields);
            $checked_fields = explode(",", $result['p_attri2']);
          }
        }



        $fields_array = array("Method (ME)", "Indoor (IND)", "Enumeration area (EA)", "Cluster (CR)", "Compound or plot (CP)");
        array_push($fields_array, "Treatment (TR)", "Habitat type (HT)");

        $disabled_fields_array = array();

        echo '<ul style="list-style-type:square">';

        foreach ($fields_array as $field) {

          $disable = "";
          $checked = "";

          if (in_array($field, $checked_fields)) {
            $checked = "checked";
          }


          echo '<div class="checkbox"><h5> <label>  <input class="btn-success styled" type="checkbox" name="fieldsarr[]" value="' . $field . '" ' . $disable . ' ' . $checked . ' > ' . $field . '  </label></h5> </div>';
        }
        echo '</ul>';

        ?>


        <div class="footer form-actions text-right">
          <button name="submited2" type="submit" id="submited2" class="btn btn-primary btn-lg"> <i class="fa fa-check" aria-hidden="true"></i> Submit </button>
        </div>


      </form>




    </div>
  </div>

  <?php include_once('layouts/foot.php'); ?>