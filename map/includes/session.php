<?php

/**
* Created by Dickson Msaky @ Ifakara Health Insitute (2018)
**/ 


session_start();

class Session {

 public $msg;
 public $msg_pp;
 private $user_is_logged_in = false;

 function __construct(){
   $this->flash_msg();
   $this->userLoginSetup();
 }

  public function isUserLoggedIn(){
    return $this->user_is_logged_in;
  }
  public function login($user_id){
    $_SESSION['user_id'] = $user_id;
  }
  public function projectset($project){
    $_SESSION['projectcode'] = $project;
  }
  public function projectunset(){
    unset($_SESSION['projectcode']);
  }
   public function expset($exp){
    $_SESSION['expcode'] = $exp;
  }
  public function expunset(){
    unset($_SESSION['expcode']);
  }
  private function userLoginSetup()
  {
    if(isset($_SESSION['user_id']))
    {
      $this->user_is_logged_in = true;
    } else {
      $this->user_is_logged_in = false;
    }

  }
  public function logout(){
      $_SESSION = array();
      if (ini_get("session.use_cookies")) {
        $params = session_get_cookie_params();
        setcookie(session_name(), '', time() - 42000,
            $params["path"], $params["domain"],
            $params["secure"], $params["httponly"]
        );
      }
      session_destroy();
  }


  public function msg_($type ='', $msg =''){
    if(!empty($msg)){
       if(strlen(trim($type)) == 1){
         $type = str_replace( array('d', 'w','s'), array('error', 'warning','success'), $type );
       }
       $_SESSION['msg'][$type] = $msg;
    } else {
      return $this->msg;
    }
  }

    public function msg($type ='', $msg =''){
    if(!empty($msg)){
       if(strlen(trim($type)) == 1){
         $type = str_replace( array('d', 'w','s'), array('error', 'warning','success'), $type );
       }
       $_SESSION['msg'][$type] = $msg;
    } else {
      return $this->msg;
    }
  }

  private function flash_msg(){

    if(isset($_SESSION['msg'])) {
      $this->msg = $_SESSION['msg'];
      unset($_SESSION['msg']);
    } else {
      $this->msg;
    }
  }
}

$session = new Session();
$msg = $session->msg();

?>



