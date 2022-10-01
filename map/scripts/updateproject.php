<?php include_once('../includes/load.php'); ?>

<?php

page_require_level(2);

if (isset($_POST['updateproj'])) {

  $req_fields = array('pc', 'pn', 'expno');
  validate_fields($req_fields);

  if (empty($errors)) {

    $pn   = remove_junk($db->escape($_POST['pn']));
    $pc   = remove_junk($db->escape($_POST['pc']));
    $exp  = remove_junk($db->escape($_POST['expno']));
    $site_id   = remove_junk($db->escape($_POST['site']));
    $esd   = remove_junk($db->escape($_POST['esd']));
    $efd   = remove_junk($db->escape($_POST['efd']));
    $eap   = 1;
    $rsn   = remove_junk($db->escape($_POST['rsn']));
    $pin   = remove_junk($db->escape($_POST['rsn']));

    $id = $_POST['pid'];


    $sql = "UPDATE projectreg SET pn ='{$pn}', pc ='{$pc}', expno ='{$exp}', esd ='{$esd}', efd ='{$efd}', eap ='{$eap}',rsn ='{$rsn}',pin ='{$pin}' WHERE id='{$id}'";

    delete_by_("projectregsite", "projectreg_id", $id);

    $sql2 = "UPDATE projectregsite SET site_id ='{$site_id}' WHERE projectreg_id='{$id}'";

    $result2 = $db->query($sql2);

    $result = $db->query($sql);

    //create missing tables if any
    createtables($id);

    if (($result2 or $result)) {
      $session->msg_('s', "Project updated ");
      redirect('../project_manage_e.php?id=' . $id, false);
    } else {
      $session->msg_('d', ' Sorry failed to update!');
      redirect('../project_manage_e.php?id=' . $id, false);
    }
  } else {
    $session->msg_("d", $errors);
    redirect('../project_manage_e.php?id=' . $id, false);
  }
}

?>