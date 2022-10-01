<?php include_once('../includes/load.php'); ?>

<?php


$current_user = current_user();

if(!empty($current_user)) {

     $id = $current_user['staff_id'];
     $fname = $current_user['fname'];
     $lname = $current_user['lname'];
     $name = $fname." ".$lname;

 }

$session->projectunset();
$session->expunset();

$sql = "SELECT * FROM grantproject INNER JOIN projectreg ON (grantproject.pid = projectreg.id) WHERE grantproject.staff_id='".$id."'  ORDER BY projectreg.id ASC limit 1";

 $result = $db->query($sql);

  //$rowCount = mysqli_num_rows($query);
 //Display states list
// if($rowCount > 0){

$exp_arr = array();

$id ="" ;
$exp = "" ;
$pname = ""; 


while( $row = mysqli_fetch_array($result) ){

    $id = $row['id'];
    $exp = $row['expno'];
    $pname = $row['pc'];

    $exp_arr[] = array("id" => $id, "exp" => $exp, "pname" => $pname);
}

// encoding array to json format
//echo json_encode($exp_arr);


//Set project selected in session
if (isset($_POST["exp"]) && !empty($_POST["exp"])) {

    $pid =  $_POST['project'];   
    $exp =  $_POST['exp'];   
    
} else {  

   $pid =  $pname;   
   $exp =  $id;   

}

$session->projectset($pid);
$session->expset($exp);

 $exp_arr2[] = array("proj" => $pid, "exp" => $exp);
 
 echo json_encode($exp_arr2);


?>