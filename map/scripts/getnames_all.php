<?php include_once('../includes/load.php'); ?>

<?php

$staff_id = $current_user['staff_id'];

$col = "fname,lname,username";


if(!isset($_POST['searchTerm'])){
    $sql = "select * from staff order by staff_id limit 1";
    $result = $db->query($sql);
}else{
    $search = $_POST['searchTerm'];
    $sql = "select * from staff WHERE CONCAT_WS('', $col) like '%".$search."%' limit 1";
    $result = $db->query($sql);
}
 
$data = array();

while( $row = mysqli_fetch_array($result) ){
    $data[] = array("id"=>$row['staff_id'], "text"=>$row['fname']. " ". $row['lname']);
}

echo json_encode($data);

?>


