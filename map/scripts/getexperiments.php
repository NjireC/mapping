<?php include_once('../includes/load.php'); ?>

<?php


 $current_user = current_user();

    if(!empty($current_user)) {

     $id = $current_user['staff_id'];
     $fname = $current_user['fname'];
     $lname = $current_user['lname'];
     $name = $fname." ".$lname;

 }

  $pid =  $_POST['project'];   // project id

  $sql = "SELECT projectreg.id, projectreg.expno FROM grantproject
                     INNER JOIN projectreg ON (grantproject.pid = projectreg.id) WHERE grantproject.staff_id='".$id."' and projectreg.pc='".$pid."' ORDER BY projectreg.id ASC";

 $result = $db->query($sql);
  $rowCount = mysqli_num_rows($result);

    if($rowCount > 0){
        echo '<option value="">Select Experiment</option>';
        while($row = mysqli_fetch_assoc($result)){ 
                 
          $selected = '';

            if ( $_SESSION['expcode'] === $row['id'] ) { 
                     $selected = 'selected'; 
              }

            echo '<option value="'.$row['id'].'" '. $selected. '>'.$row['expno'].'</option>';
        }
    }else{
        echo '<option value="">Experiment not available</option>';
    }



?>