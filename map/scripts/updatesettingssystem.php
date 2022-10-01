<?php include_once('../includes/load.php'); 

  if(isset($_POST['updatesystem'])){

   $req_fields = array('oname','ocolour');
   validate_fields($req_fields);
  
   if(empty($errors)){

    $oname   = remove_junk($db->escape($_POST['oname']));
    $ocolour   = remove_junk($db->escape($_POST['ocolour']));

    $sql = "UPDATE settings SET organization_name ='{$oname}', organization_theme ='{$ocolour}' WHERE id=1";

    $result = $db->query($sql);

  if($result && $db->affected_rows() === 1){
      $session->msg_('s',"System settings updated ");
      redirect('../settingssystem.php', false);
    } else {
      $session->msg_('d',' Sorry failed to update!');
      redirect('../settingssystem.php', false);
    }

   }  else {
    $session->msg_("d", $errors);
    redirect('../settingssystem.php',false);
   }

}

?>