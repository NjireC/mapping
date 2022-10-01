<?php
/**
 * Created by Dickson Msacky @ Ifakara Health Insitute (2018)
**/

include_once('../includes/load.php');

$temptype = $_POST["te"];
$table = $_POST["ta"];

if (isset($_POST['downloadtemp'])) {

	if(isset($_SESSION['expcode'])){

		$tablename = explode('_', $_POST["ta"]);
		
		$csvname = $tablename[1];

		$fetchfields = $db->query("SELECT number,$temptype FROM {$db->escape($table)}");

		$count = $db->num_rows($fetchfields);


		if ($count > 0) {

			header('Content-Type: text/csv; charset=utf-8');
			header('Content-Disposition: attachment; filename='.$csvname.'.csv');
			ob_end_clean();
			$output = fopen('php://output', 'w+');
			fputcsv($output, array('Number', 'Text')); 

			$result = $db->query("SELECT number,$temptype FROM {$db->escape($table)}");

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