<?php
  require_once('../includes/load.php');
  
  page_require_level(2);

?>
<?php
  $enum = find_by_('enum','ID',(int)$_GET['id']);
  if(!$enum){
    $session->msg_("d","Missing  ID.");
    redirect('../settings_addea.php');
  }
?>
<?php
  $delete_id = delete_by_('enum','ID',(int)$enum['ID']);
  if($delete_id){
      historylog("Has deleted ea code-".$_GET['id']);
      $session->msg_("s","Name deleted.");
      redirect('../settings_addea.php');
  } else {
      $session->msg_("d","Name deletion failed.");
      redirect('../settings_addea.php');
       
  }
?>
