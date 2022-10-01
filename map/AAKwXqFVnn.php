<?php

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
**/

require_once('includes/load.php');


$email = $_GET['email'];
$timp  = $_GET['qFVnn'];
$expire   = 86400; 
$valid = $_GET['MjvWW'];

$sql = "SELECT * FROM staff WHERE email='{$email}'";
$result = $db->query($sql);
$row = $db->fetch_assoc($result);


 if (empty($row['email'])) {
        header("Location: register.php?KwXqF=no-email");
     }elseif ($valid !== '0') {
         header('Location: login.php?KwXqF=no&MjvWW=error');
    }elseif ($_SERVER["REQUEST_TIME"] - $timp > $expire) {
         header("Location: register.php?email=" . $email . "&KwXqF=no&rNvIl=error");
    } elseif ($row['valid'] > 0) {
     header('Location: login.php?KwXqF=no&MjvWW=yes');
    }  else {

			
		$sql2 = "UPDATE staff SET valid = 1 WHERE email='{$email}'";
		$result2 = $db->query($sql2);
		

		if(($result2 ) ){
		  $session->msg_('s','Successfully activated');
		  redirect('login.php', false);
		} else {
		  $session->msg_('d','Sorry failed to activate');
		  redirect('login.php', false);
		}
	
	}

?>