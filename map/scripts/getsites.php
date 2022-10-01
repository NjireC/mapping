<?php include_once('../includes/load.php');

$e_project = find_by_('projectregsite','projectreg_id',$_SESSION['expcode']);

$sql = "SELECT * FROM  site";

$result = $db->query($sql);

echo '<option value="">Select Site</option>';
while( $row = mysqli_fetch_array($result) ){

    $selected = '';
                    if ( $e_project['site_id'] === $row['site_id'] ) { 
                             $selected = 'selected'; 
                      }

    echo '<option value="'.$row['site_id'].'" '. $selected. '>'.$row['site_name'].'</option>';

}

?>