<?php 
/**
 * Created by Gerald @ Ifakara Health Insitute (2021)
 */
 
require_once('includes/load.php');
$page_title = 'Settings | MosquitoDB'; 
page_require_level(2);
include_once('layouts/head.php');
 
$formtype = "SS4";
$table = "custss";
 
$field = "pc";
$field2 = "ft";
 
  if(isset($_POST['submited2'])){
 
    if(!empty($_POST['fieldsarr'])) {
 
 
        $fieldsshort_array = array();
 
        foreach($_POST['fieldsarr'] as $field){
 
        preg_match('#\((.*?)\)#', $field, $match);
        $my =  strtolower($match[1])."\n";
 
        array_push($fieldsshort_array,$my);
         
        }
 
 
         $fieldsarr = implode(",",$_POST['fieldsarr']);
         $fieldsarr = str_replace("\n", "", $fieldsarr);
 
         $fieldsshort_array2 = implode(",",$fieldsshort_array);
         $fieldsshort_array2 = str_replace("\n", "", $fieldsshort_array2);
 
         $fieldarraysize = sizeof($_POST['fieldsarr']);
 
      
 
 
       if (!empty($_SESSION['expcode'])){
       
            $resultcust = $db->query("SELECT * FROM {$db->escape($table)} WHERE pc='{$db->escape($_SESSION['expcode'])}' AND ft='{$formtype}' LIMIT 1");
 
   
           if($db->num_rows($resultcust) === 0){
               $result2 =  $db->query("INSERT INTO {$db->escape($table)} (pc, ft, num_split, p_attri,p_attri2) VALUES('".$_SESSION['expcode']."','".$formtype."','".$fieldarraysize."','".$fieldsshort_array2."','".$fieldsarr."')");
 
                    if($result2){
 
                           $_SESSION['msg'] = '<script type="text/javascript">'.
                                        "$.jGrowl('Fields successfuly saved!', {  theme: 'growl-success', header: '' });".
                                     '</script>';
 
                           echo $_SESSION['msg']; 
                           unset($_SESSION['msg']);
                         }
 
            }else{
               
                 $sql = "UPDATE {$db->escape($table)} SET num_split='".$fieldarraysize."',p_attri='".$fieldsshort_array2."',p_attri2='".$fieldsarr."' WHERE pc ='{$_SESSION['expcode']}' AND ft='{$formtype}' LIMIT 1";
                  $result2 =  $db->query($sql);
 
                    if($result2){
 
                           $_SESSION['msg'] = '<script type="text/javascript">'.
                                        "$.jGrowl('Fields successfuly saved!', {  theme: 'growl-success', header: '' });".
                                     '</script>';
 
                           echo $_SESSION['msg']; 
                           unset($_SESSION['msg']);
                         }
            }
 
       }
 
  
    }
 
 }else if(isset($_POST['cleared'])){
 
 
  if (!empty($_SESSION['expcode'])){
      
    $resultcust = $db->query("SELECT * FROM {$db->escape($table)} WHERE pc='{$db->escape($_SESSION['expcode'])}' AND ft='{$formtype}' LIMIT 1");
 
  if($db->num_rows($resultcust) === 0){
 
     
          
    }else{
    
        $sql = "DELETE FROM ".$db->escape($table);
        $sql .= " WHERE ".$db->escape($field)."=".$_SESSION['expcode']." AND ".$db->escape($field2)."="."'SS4'";
        $sql .= " LIMIT 1";
 
      
        $result2 =  $db->query($sql);
        
          if($result2){
 
                  $_SESSION['msg'] = '<script type="text/javascript">'.
                                "$.jGrowl('Fields cleared!', {  theme: 'growl-success', header: '' });".
                            '</script>';
 
                  echo $_SESSION['msg']; 
                  unset($_SESSION['msg']);
                }
        
    }
 
}
 
 
 
} else if(isset($_POST['downloadtemp'])){
 
 
 
}
 
 
  ?>
  
 <!-- Page content -->
 <div class="page-content">
   <?php echo display_msg_popup($msg); ?>
  <!-- Page title -->
  <div class="page-title">
    <h5><i class="fa fa-bars"></i> Home <small>Welcome, <?php   echo $name;  ?> </small></h5>
  </div>
 
 
 
  <!-- /page title -->
  <div class="panel panel-primary">
    <div class="panel-heading">
      <h6 class="panel-title"> Dataset Table For:   <span id="pname"></span>  </h6>
      <div class="btn-group pull-right">
 
        <?php include_once('scripts/selectproject.php'); ?>
 
      </div>
    </div>
  </div>
 
 
  <?php include_once('layouts/settingsmenu.php'); ?>
 
  <br />
 
 
  <div class="panel panel-default">
         <div class="panel-heading"><h6 class="panel-title">Sample Sorting 4 Customize</h6>
          
          <div class="btn-group pull-right">
             <form action="scripts/exporttemp.php" method="post">
 
      
               <a href="settings_ss4temp.php" <button class="btn btn-default"><i class="fa fa-cog"></i>Customize General Template</button> </a>
 
              <button type="submit" name='downloadtemp' class="btn btn-default"><i class="fa fa-download"></i>Download Entry Template</button>
 
              <input type="hidden" name="fo" value="<?php echo $formtype; ?>" >  
              <input type="hidden" name="ta" value="<?php echo $table; ?>" >  
 
            </form> 
          </div>
 
 
         </div>
    <div class="panel-body">
 
       
 
    </div>
  </div>
              
<?php include_once('layouts/foot.php'); ?>    
      
  
           
