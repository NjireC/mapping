<?php

/**
* Created by Dickson Msaky @ Ifakara Health Insitute (2018)
**/

require_once('includes/load.php');

$uploaddir = './upload_temp/'; 

$projectcode = $_SESSION['projectcode']."/";


if (!is_dir($uploaddir.$projectcode)) {
		    mkdir($uploaddir.$projectcode, 0777, true);
}

$uploaddir = $uploaddir.$projectcode;
	
$file = $uploaddir . basename($_FILES['uploadfile']['name']); 

 
if (move_uploaded_file($_FILES['uploadfile']['tmp_name'], $file)) { 
     echo "success"; 
} else {
	 echo "error";
}
?>

