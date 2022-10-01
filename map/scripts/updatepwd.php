<?php include_once('../includes/load.php'); ?>

<?php

if(isset($_POST['Register'])){


  $pwd_db = $current_user['password'];

  $oldpwd   = remove_junk($db->escape($_POST['oldpwd']));
 
  $password   = remove_junk($db->escape($_POST['password']));
  
  
   if(password_verify($oldpwd,$pwd_db)){

    $password = hashPass($password);

    $sql = "UPDATE staff SET password ='{$password}' WHERE staff_id='{$current_user['staff_id']}'";

    $result = $db->query($sql);

    if($result && $db->affected_rows() === 1){
      $session->msg_('s',"Password changed ");
      redirect('../user_epassword.php', false);
    } else {
      $session->msg_('d',' Failed to change!');
      redirect('../user_epassword.php', false);
    }

  }  else {
    $session->msg_("d", 'New password dont match with old');
    redirect('../user_epassword.php',false);
  }

}

?>