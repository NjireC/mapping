<?php include_once('includes/load.php'); ?>

<?php
 $current_user = current_user();
    if(!empty($current_user)) {

     $id = $current_user['staff_id'];   
 }

?>

<div id="">
    <?php
                                                                                                  //Get all project data
    $query = $db->query("SELECT distinct projectreg.pc FROM grantproject
        INNER JOIN projectreg ON (grantproject.pid = projectreg.id) WHERE grantproject.staff_id='".$id."' ORDER BY projectreg.pc ASC");

                                                                                                   //Count total number of rows
    $rowCount = $query->num_rows;

   

    ?>
    <i id="loaderexp" style="display:none" class="fa fa-spinner fa-spin" aria-hidden="true"></i>
    <select class="select" name="project" id="project">
        <option>- Select  Project -</option>
        <?php
        if($rowCount > 0){
            while($row = $query->fetch_assoc()){ 

                 $selected = '';
                    if ( $_SESSION['projectcode'] === $row['pc'] ) { 
                             $selected = 'selected'; 
                      }

                echo '<option '. $selected. '>'.$row['pc'].'</option>';
            
            }
        }else{
            echo '<option value="">Project not available</option>';
        }
        ?>
    </select>

    <select class="select" name="exp" id="exp">
        <option value=""> - Select project first - </option>  
    </select>


</div>