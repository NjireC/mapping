<?php include_once('../includes/load.php'); ?>

<?php

page_require_level(1);

  if(isset($_POST['updatedet'])){

   $req_fields = array('firstname','secondname','lastname','mobnumber','email');
   validate_fields($req_fields);
  
   if(empty($errors)){

    $fname   = ucfirst(remove_junk($db->escape($_POST['firstname'])));
    $sname   = ucfirst(remove_junk($db->escape($_POST['secondname'])));
    $lname   = ucfirst(remove_junk($db->escape($_POST['lastname'])));
    $email   = remove_junk($db->escape($_POST['email']));
    $phone   = remove_junk($db->escape($_POST['mobnumber']));

  $securitylevel   = remove_junk($db->escape($_POST['securitylevel']));
  $staffgroup   = remove_junk($db->escape($_POST['staffgroup']));
  $staffstatus   = remove_junk($db->escape($_POST['staffstatus']));
    $staffid = $_POST['staffid'];

    $sql = "UPDATE staff SET fname ='{$fname}', mname ='{$sname}', lname ='{$lname}', mobinum ='{$phone}', email ='{$email}', seculevel ='{$securitylevel}',staff_group ='{$staffgroup}',status ='{$staffstatus}' WHERE staff_id='{$staffid}'";

    $result = $db->query($sql);

  if($result && $db->affected_rows() === 1){
      $session->msg_('s',"User updated ");
      redirect('../user_manage.php', false);
    } else {
      $session->msg_('d',' Sorry failed to update!');
        redirect('../user_manage.php', false);
    }

   }  else {
    $session->msg_("d", $errors);
  redirect('../user_manage_e.php?id='.$staffid, false);
   }

}

?>