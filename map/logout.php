<?php

/**
* Created by Dickson Msaky @ Ifakara Health Insitute (2018)
**/

  require_once('includes/load.php');
     historylog("Has signed out");
  if(!$session->logout()) {redirect("login.php");}
?>
