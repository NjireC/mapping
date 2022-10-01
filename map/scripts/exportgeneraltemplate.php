<?php
/**
 * Created by Dickson Msacky @ Ifakara Health Insitute (2018)
**/

include_once('../includes/load.php');

$temptype = $_POST["te"];
$table = $_POST["ta"];


$formtype2 = $_POST["te1"];
$table2 = $_POST["ta1"];


$columns = getcolumnname($_SESSION['expcode'],$table2,$formtype2);  

if (isset($_POST['downloadtemp'])) {

	if(isset($_SESSION['expcode'])){

		$csvname = $_POST["te"];

		$fetchfields = $db->query("SELECT p_attri2 FROM {$db->escape($table2)} WHERE pc='{$db->escape($_SESSION['expcode'])}' AND ft='{$formtype2}' LIMIT 1");

		$count = $db->num_rows($fetchfields);

		$checked_fields = array();

		if($count > 0){
			$result = $db->fetch_assoc($fetchfields);
			$checked_fields = explode(",",$result['p_attri2']);

		}


		if ($count > 0) {

			header('Content-Type: text/csv; charset=utf-8');
			header('Content-Disposition: attachment; filename='.$csvname.'.csv');
			ob_end_clean();
			$output = fopen('php://output', 'w+');
			fputcsv($output, $checked_fields); 

			$result = $db->query("SELECT $columns FROM {$db->escape($table)}");

			while($row = $db->fetch_assoc($result))  
			{  
				fputcsv($output, $row);  
			}  
			fclose($output);  
			

		}else{

			$session->msg_("d", "Not records(s) .");
			header('Location: ' . $_SERVER['HTTP_REFERER']);
		}

	}else{

		$session->msg_("d", "No Project Selected");
		header('Location: ' . $_SERVER['HTTP_REFERER']);
	}

}

elseif (isset($_POST['deleteall'])) {

	page_require_level(2);

	$delete_id = delete_all($table);
	if($delete_id){
		historylog("Has cleared table-".$table);
		$session->msg_("s","Success.");
		header('Location: ' . $_SERVER['HTTP_REFERER']);
	} else {
		$session->msg_("d","Failed.");
		header('Location: ' . $_SERVER['HTTP_REFERER']);

	}




}


?>