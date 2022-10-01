<?php 

/**
* Created by Dickson Msaky @ Ifakara Health Insitute (2018)
**/

require_once('includes/load.php');
$page_title = 'Settings | MosquitoDB'; 
page_require_level(2);
include_once('layouts/head.php');

if(isset($_SESSION['expcode'])){

$expcode = $_SESSION['expcode'];
$prefixtable = $expcode."_";


$table = $prefixtable."custgraph";

}

$formtype = "home";

$formtype2 = "summary";

//$table = "custgraph";


if(isset($_POST['submited2'])){

  
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
       
            $resultcust = $db->query("SELECT * FROM {$db->escape($table)} WHERE pc='{$db->escape($_SESSION['expcode'])}' AND location='{$formtype}' LIMIT 1");

           if($db->num_rows($resultcust) === 0){

               $result2 = $db->query("INSERT INTO {$db->escape($table)} (pc, location, num_split, p_attri,p_attri2) VALUES('".$_SESSION['expcode']."','".$formtype."','".$fieldarraysize."','".$fieldsshort_array2."','".$fieldsarr."')");
                 
                   
                     if($result2){

                           $_SESSION['msg'] = '<script type="text/javascript">'.
                                        "$.jGrowl('Fields successfuly saved!', {  theme: 'growl-success', header: 'Success!' });".
                                     '</script>';

                           echo $_SESSION['msg']; 
                           unset($_SESSION['msg']);
                         }
                  
            }else{
            
                 $sql = "UPDATE {$db->escape($table)} SET num_split='".$fieldarraysize."',p_attri='".$fieldsshort_array2."',p_attri2='".$fieldsarr."' WHERE pc ='{$_SESSION['expcode']}' AND location='{$formtype}' LIMIT 1";

                 $result2 =  $db->query($sql);
                 
                  if($result2){

                           $_SESSION['msg'] = '<script type="text/javascript">'.
                                        "$.jGrowl('Fields successfuly saved!', {  theme: 'growl-success', header: 'Success!' });".
                                     '</script>';

                           echo $_SESSION['msg']; 
                           unset($_SESSION['msg']);
                         }
                
            }

       }


 }



if(isset($_POST['submited3'])){

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
       
            $resultcust = $db->query("SELECT * FROM {$db->escape($table)} WHERE pc='{$db->escape($_SESSION['expcode'])}' AND location='{$formtype2}' LIMIT 1");

           if($db->num_rows($resultcust) === 0){

               $result2 = $db->query("INSERT INTO {$db->escape($table)} (pc, location, num_split, p_attri,p_attri2) VALUES('".$_SESSION['expcode']."','".$formtype2."','".$fieldarraysize."','".$fieldsshort_array2."','".$fieldsarr."')");
                 
                   
                     if($result2){

                           $_SESSION['msg'] = '<script type="text/javascript">'.
                                        "$.jGrowl('Fields successfuly saved!', {  theme: 'growl-success', header: 'Success!' });".
                                     '</script>';

                           echo $_SESSION['msg']; 
                           unset($_SESSION['msg']);
                         }
                  
            }else{
            
                 $sql = "UPDATE {$db->escape($table)} SET num_split='".$fieldarraysize."',p_attri='".$fieldsshort_array2."',p_attri2='".$fieldsarr."' WHERE pc ='{$_SESSION['expcode']}' AND location='{$formtype2}' LIMIT 1";

                 $result2 =  $db->query($sql);
                 
                  if($result2){

                           $_SESSION['msg'] = '<script type="text/javascript">'.
                                        "$.jGrowl('Fields successfuly saved!', {  theme: 'growl-success', header: 'Success!' });".
                                     '</script>';

                           echo $_SESSION['msg']; 
                           unset($_SESSION['msg']);
                         }
                
            }

       }

 }




  ?>
  
 <!-- Page content -->
 <div class="page-content">
    <?php echo display_msg_popup($msg);  ?>
  <!-- Page title -->
  <div class="page-title">
    <h5><i class="fa fa-bars"></i> Home <small>Welcome, <?php   echo $name.$table ;  ?> </small></h5>
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
         <div class="panel-heading"><h6 class="panel-title">Customize graph displayed</h6></div>
    <div class="panel-body">

          
                 <span class="subtitle"> <h4>Customize Shown Frequency Graph in Homepage : </h4></span>
                 <div class="well widget">
                  <div class="tabbable">
                    <ul class="nav nav-pills nav-justified">
                      <li class="active"><a href="#justified-pill1" data-toggle="tab"><i class="fa fa-home"></i> Home Page</a></li>
                      <li><a href="#justified-pill2" data-toggle="tab"><i class=" fa fa-bar-chart-o"></i>  Data Summary Page </a></li>
                      
                    </ul>

                    <div class="tab-content pill-content">
                      <div class="tab-pane fade in active" id="justified-pill1">

                         <form method="post" action=""><br/>
                                <?php

                                $checked_fields = array();

                                
                                if(isset($_SESSION['expcode'])){

                                  //fetchcheckedvalues
                                   $fetchfields = $db->query("SELECT * FROM {$db->escape($table)} WHERE pc='{$db->escape($_SESSION['expcode'])}' AND location='{$formtype}' LIMIT 1");


                                    if($db->num_rows($fetchfields) > 0){
                                      $result = $db->fetch_assoc($fetchfields);
                                      $checked_fields = explode(",",$result['p_attri2']);

                                    }else{
                                      
                                      $msg_warn = '<script type="text/javascript">'.
                                                    "$.jGrowl('Graphs Home Page not customized!', { life: 20000, theme: 'growl-error', header: 'Info' });".
                                                 '</script>';

                                       echo $msg_warn; 
                                    }

                                 }

                               
                              
                                $fields_array = array("Enumeration area (EA)","Cluster (CR)", "Compound or plot (CP)","Method (ME)","Indoor (IND)");
                                array_push($fields_array,"Start time (ST)","Finish time (FT)","Holding period (HP)","Round (RND)");
                                array_push($fields_array, "Block (BLK)","Volunteer initials (VI)","Treatment (TR)",
                                  "Valid catch (VC)");


                              //$disabled_fields_array = array("Method (ME)","Indoor (IND)");
                               // array_push($disabled_fields_array, );


                                echo '<ul style="list-style-type:square">';

                                  foreach($fields_array as $field){
                                    
                                      $disable= "";     
                                      $checked = "";

                                      if(in_array($field,$checked_fields)){
                                      $checked = "checked";}

                                      
                                      echo '<input type="checkbox" name="fieldsarr[]" value="'.$field.'" '.$disable.' '.$checked.' > '.$field.' <br/>';
                                      
                                    }
                                echo '</ul>';
                    
                                ?>
                             

                              <div class="footer form-actions text-right">
                                  <button name="submited2" name="submited2" type="submit" id="submited2" class="btn btn-primary btn-lg"  > <i class="fa fa-check" aria-hidden="true"></i> Submit </button>
                              </div>


                         </form>
                       


                      </div>

                      <div class="tab-pane fade" id="justified-pill2">


                          <form method="post" action=""><br/>
                                <?php

                                $checked_fields = array();

                                
                                if(isset($_SESSION['expcode'])){

                                  //fetchcheckedvalues
                                   $fetchfields = $db->query("SELECT * FROM {$db->escape($table)} WHERE pc='{$db->escape($_SESSION['expcode'])}' AND location='{$formtype2}' LIMIT 1");


                                    if($db->num_rows($fetchfields) > 0){
                                      $result = $db->fetch_assoc($fetchfields);
                                      $checked_fields = explode(",",$result['p_attri2']);

                                    }else{
                                      
                                      $msg_warn = '<script type="text/javascript">'.
                                                    "$.jGrowl('Graphs Summary Page not customized!', { life: 20000, theme: 'growl-error', header: 'Info' });".
                                                 '</script>';

                                       echo $msg_warn; 
                                    }

                                 }

                               
                              
                                $fields_array = array("Mosquito Population Summary (MPS)","Female Mosquito Caught vs Month (FMCM)", "Female Mosquito Caught vs Date (FMCD)","Mosquito Population Summary vs site (MPSS)","An. Gambiae SAS status (GSAS)","An. Funestus SAS status (FSAS)");
                 

                                echo '<ul style="list-style-type:square">';

                                  foreach($fields_array as $field){
                                    
                                      $disable= "";     
                                      $checked = "";

                                      if(in_array($field,$checked_fields)){
                                      $checked = "checked";}
                       
                                      
                                      echo '<input type="checkbox" name="fieldsarr[]" value="'.$field.'" '.$disable.' '.$checked.' > '.$field.' <br/>';
                                      
                                    }
                                echo '</ul>';
                    
                                ?>
                             

                              <div class="footer form-actions text-right">
                                  <button name="submited3" type="submit" id="submited3" class="btn btn-primary btn-lg"  > <i class="fa fa-check" aria-hidden="true"></i> Submit </button>
                              </div>


                         </form>
                       
                       






                      </div>



                    </div>
                  </div>
                </div>


    </div>
  </div>
           
<?php include_once('layouts/foot.php'); ?>    
      
  
           