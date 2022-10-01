<?php include_once('../includes/load.php'); ?>

<?php

if (isset($_POST['updatedet'])) {

  $req_fields = array('firstname', 'secondname', 'lastname', 'mobnumber', 'email', 'theme');
  validate_fields($req_fields);

  if (empty($errors)) {

    $fname   = ucfirst(remove_junk($db->escape($_POST['firstname'])));
    $sname   = ucfirst(remove_junk($db->escape($_POST['secondname'])));
    $lname   = ucfirst(remove_junk($db->escape($_POST['lastname'])));
    $email   = remove_junk($db->escape($_POST['email']));
    $phone   = remove_junk($db->escape($_POST['mobnumber']));
    $theme   = remove_junk($db->escape($_POST['theme']));

    $sql = "UPDATE staff SET fname ='{$fname}', mname ='{$sname}', lname ='{$lname}', mobinum ='{$phone}', email ='{$email}',theme ='{$theme}' WHERE staff_id='{$current_user['staff_id']}'";

    $result = $db->query($sql);

    if ($result && $db->affected_rows() === 1) {
      $session->msg_('s', "Profile updated ");
      redirect('../user_eprofile.php', false);
    } else {
      $session->msg_('d', ' Sorry failed to update!');
      redirect('../user_eprofile.php', false);
    }
  } else {
    $session->msg_("d", $errors);
    redirect('../user_eprofile.php', false);
  }
}

?>