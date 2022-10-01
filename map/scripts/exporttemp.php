<?php
/**
 * Created by Dickson Msacky @ Ifakara Health Insitute (2018)
**/

include_once('../includes/load.php');

$formtype = $_POST["fo"];
$table = $_POST["ta"];

if(isset($_SESSION['expcode'])){

	$projectname = projectname($_SESSION['expcode']);

	$csvname = $projectname."_".$_POST["fo"];

	$fetchfields = $db->query("SELECT p_attri,p_attri2 FROM {$db->escape($table)} WHERE pc='{$db->escape($_SESSION['expcode'])}' AND ft='{$formtype}' LIMIT 1");

	$checked_fields = array();
	if($db->num_rows($fetchfields) > 0){
		$result = $db->fetch_assoc($fetchfields);
		$checked_fields = explode(",",$result['p_attri2']);

	}

	if (count($checked_fields) > 0) {

		header('Content-Type: text/csv; charset=utf-8');
		header('Content-Disposition: attachment; filename='.$csvname.'_Template_'.date('Ymd').'.csv');
		ob_end_clean();
		$output = fopen('php://output', 'w+');
		fputcsv($output, $checked_fields); 
		

	}else{

		$session->msg_("d", "Fields not customized.");
		header('Location: ' . $_SERVER['HTTP_REFERER']);
	}

}else{

	$session->msg_("d", "No Project Selected");
    header('Location: ' . $_SERVER['HTTP_REFERER']);
}


?>