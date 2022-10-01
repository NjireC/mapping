<?php include_once('../includes/load.php'); ?>

<?php
  
  page_require_level(1);

  $delete_id = delete_by_('staff','staff_id',(int)$_GET['id']);  
  
  if($delete_id){
       historylog("Has deleted user_".$_GET['id']);
      $session->msg_("s","User deleted.");
      redirect('../user_manage.php');
  } else {
      $session->msg_("d","User deletion failed .");
      redirect('../user_manage.php');
  }

?>
