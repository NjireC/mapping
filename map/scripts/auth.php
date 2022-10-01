<?php include_once('../includes/load.php'); ?>

<?php

$req_fields = array('username','password' );
validate_fields($req_fields);
validate_status($_POST['username']);
$username = remove_junk($_POST['username']);
$password = remove_junk($_POST['password']);


if(empty($errors)){
  $user_id = authenticate($username, $password);
  if($user_id){
    //create session with id
     $session->login($user_id);
    //Update Sign in time
     updateLastLogIn($user_id);
     historylog("Has signed in");
     $current_user = current_user();
     $session->msg_("s", "Welcome ".$current_user['fname']."  ");
     redirect('../home.php',false);


  } else {
    $session->msg_("d", "Sorry Email/Password incorrect.");
    redirect('../login.php',false);
  }

} else {
   $session->msg_("d", $errors);
   redirect('../login.php',false);
}

?>