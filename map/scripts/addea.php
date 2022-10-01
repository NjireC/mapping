<?php include_once('../includes/load.php');


if(isset($_POST['add_ea'])){
    $req_field = array('ea-name');
    validate_fields($req_field);
    $ea_name = remove_junk($db->escape($_POST['ea-name']));
    $ea_code= remove_junk($db->escape($_POST['ea-code']));
    $pid = $_SESSION['projectcode'];
    
   if(empty($errors)){
        $query = "INSERT INTO enum (";
        $query .="ID,NAME,PROJECTID,STAFFID";
        $query .=") VALUES (";
        $query .="'{$ea_name}', '{$ea_code}', '{$pid }', '{$staff_id}'";
        $query .=")";

      if($db->query($query)){
        historylog("Has added ea-code:".$ea_code);
        $session->msg_("s", "Successfully Added ");
        redirect('../settings_addea.php',false);
      } else {
        $session->msg_("d", "Sorry Failed to insert.");
        redirect('../settings_addea.php',false);
      }
   } else {
     $session->msg_("d", $errors);
     redirect('../settings_addea.php',false);
   }
 }

?>

