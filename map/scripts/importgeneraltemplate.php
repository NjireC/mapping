<?php include_once('../includes/load.php');
/**
 * Created by Dickson Msacky @ Ifakara Health Insitute (2018)
**/

$formtype = $_POST["fo"];
$table = $_POST["ta"];


$formtype1 = $_POST["fo1"];
$table1 = $_POST["ta1"];


$fields_array = array();

$columns = getcolumnname($_SESSION['expcode'],$table1,$formtype1);  

$fields_array = explode(",",$columns);

if(isset($_SESSION['expcode'])){

	$allowed =  array('csv');
	
	$filename = $_FILES['file']['name'];
	
	$filepath = pathinfo($filename);
	

	if(!empty($_FILES['file']['name']) && in_array($filepath['extension'],$allowed)){
		if(is_uploaded_file($_FILES['file']['tmp_name'])){

            //open uploaded csv file with read only
			$csvFile = fopen($_FILES['file']['tmp_name'], 'r');

            //skip first line
			fgetcsv($csvFile);

            //parse data from csv file line by line
			while(($line = fgetcsv($csvFile, 1000, ",")) !== FALSE){
                
                $line2 = "'".implode("','", $line)."'";

			    $prevQuery = "SELECT * FROM {$db->escape($table)} WHERE fr = '".$line[1]."'";
				$prevResult = $db->query($prevQuery);
				if($prevResult->num_rows > 0){
                   
				  	$db->query("DELETE FROM {$db->escape($table)} WHERE fr = '".$line[1]."'");
					$db->query("INSERT INTO {$db->escape($table)} ($columns) VALUES ($line2)");

				}else{

                    $db->query("INSERT INTO {$db->escape($table)} ($columns) VALUES ($line2)");

				}

			}

            //close opened csv file
			fclose($csvFile);

			$session->msg_("s", "Data has been uploaded successfully");
            header('Location: ' . $_SERVER['HTTP_REFERER']);

		}else{

			$session->msg_("d", "Some problem occurred, please try again");
            header('Location: ' . $_SERVER['HTTP_REFERER']);
		}

	}else{

		$session->msg_("d", "Please upload a valid CSV file");
        header('Location: ' . $_SERVER['HTTP_REFERER']);
	}

}else{

	$session->msg_("d", "No Project Selected");
    header('Location: ' . $_SERVER['HTTP_REFERER']);
}


?>