<?php include_once('../includes/load.php'); ?>

<?php



$staff_id = $current_user['staff_id'];

$sql = "SELECT * FROM  staff where staff_id=$staff_id limit 1";

$result = $db->query($sql);


 
echo '<option value="">Select name</option>';
while( $row = mysqli_fetch_array($result) ){

    if ( $row['staff_id'] === $staff_id ) { 
        $selected = ' selected'; 
      }else{
        $selected = ' '; 
      } 

    echo '<option value="'.$row['staff_id'].'"'. $selected .' disabled>' .$row['fname']." ".$row['lname'].'</option>';

}

?>