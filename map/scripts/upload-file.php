<?php

require_once('../includes/load.php');

$uploaddir = '../upload_temp/'; 

$user = $current_user['staff_id'];

$projectcode = $_SESSION['projectcode']."/";


if (!is_dir($uploaddir.$projectcode)) {
		    mkdir($uploaddir.$projectcode, 0777, true);
}

$uploaddir = $uploaddir.$projectcode;
	

$file = $uploaddir."/".$user.".csv";

 
if (move_uploaded_file($_FILES['uploadfile']['tmp_name'], $file)) { 
     echo "success"; 
} else {
	 echo "error";
}
?>

