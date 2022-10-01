<?php 

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
 */
require_once('includes/load.php');
$page_title = 'Settings | MosquitoDB'; 
page_require_level(2);
include_once('layouts/head.php');

$formtype = "SS3";
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
        $sql .= " WHERE ".$db->escape($field)."=".$_SESSION['expcode']." AND ".$db->escape($field2)."="."'SS3'";
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
            <h6 class="panel-title"> Dataset Table For: <span id="pname"></span> </h6>
            <div class="btn-group pull-right">

                <?php include_once('scripts/selectproject.php'); ?>

            </div>
        </div>
    </div>


    <?php include_once('layouts/settingsmenu.php'); ?>

    <br />


    <div class="panel panel-default">
        <div class="panel-heading">
            <h6 class="panel-title">Sample Sorting 3 Customize</h6>

            <div class="btn-group pull-right">
                <form action="scripts/exporttemp.php" method="post">


                    <a href="settings_ss3temp.php"> <button class="btn btn-success"><i class="fa fa-cog"></i>Customize
                            General Template</button> </a>

                    <button type="submit" name='downloadtemp' class="btn btn-warning"><i
                            class="fa fa-download"></i>Download Entry Template</button>


                    <input type="hidden" name="fo" value="<?php echo $formtype; ?>">
                    <input type="hidden" name="ta" value="<?php echo $table; ?>">

                </form>
            </div>

        </div>
        <div class="">

            <!-- Page tabs -->
            <div class="tabbable page-tabs">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tabone" data-toggle="tab"><i class="fa fa-align-justify"></i> Fields to
                            customize</a></li>
                    <li><a href="#tabtwo" data-toggle="tab"><i class="fa fa-tasks"></i> Paper Form </a></li>
                </ul>

                <div class="tab-content has-padding">

                    <!-- First tab -->
                    <div class="tab-pane active fade in" id="tabone">

                        <div class="panel-heading"></div>

                        <form method="post" action="">

                        <div class="btn-group">
    <button class="btn btn-primary">  <i class="fa fa-file-text"></i>WHO Cone Test</button>
    <button class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
        <span class="caret caret-split"></span>
    </button>
    <ul class="dropdown-menu">


    <li class=""><a tabindex="-1" href="cdctest.php">CDC Test</a></li>
         <li class="<?php echo $ss3ft; ?>"><a tabindex="-1" href="whoconetest.php">WHO Cone Test</a></li>
         <li class=""><a tabindex="-1" href="whotubetest.php">WHO Tube Test</a></li>
    </ul>
</div>

</td>

<br><br>


                            <div class="table-responsive animate__animated animate__fadeIn">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>
                                                <h4>Fields</h4>
                                            </th>
                                            <th>
                                                <h4> Definition</h4>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <?php

                        $checked_fields = array();

                           
                        if(isset($_SESSION['expcode'])){

                          //fetchcheckedvalues
                           $fetchfields = $db->query("SELECT * FROM {$db->escape($table)} WHERE pc='{$db->escape($_SESSION['expcode'])}' AND ft='{$formtype}' LIMIT 1");


                            if($db->num_rows($fetchfields) > 0){
                              $result = $db->fetch_assoc($fetchfields);
                              $checked_fields = explode(",",$result['p_attri2']);

                            }else{
                              
                              $msg_warn = '<script type="text/javascript">'.
                                            "$.jGrowl('Fields not customized!', { life: 20000, theme: 'growl-error', header: '' });".
                                         '</script>';

                               echo $msg_warn; 
                            }

                         }


                         $fields_array = array("Serial No. (SEN)","ED Form Serial Number (SSEN)","ED Form row (SFR)", "Form row (FR)");

                         array_push($fields_array,"Date of Test (DOT)");
                         
                         array_push($fields_array, "GPS Accuracy (GA)", "GPS Data Source (GDS)");
                         
                         array_push( $fields_array,"Specify GPS data source (SGDS)" , 
                         "Room Type (RT)", "Date of Spray (SpD)","Last Insecticide Used (LIU)");
                          
                                           
                         array_push($fields_array,
                       "Mosquito Origin (MO)", "Mosquito Species Tested (MST)", "Mosquito Age (MA)");
                       
                       array_push($fields_array,"Exposure Period Max Temp (ETMax)", "Exposure Period Min Temp (ETMin)" ,"Holding Period Max Temp (HTMax)","Holding Period Min Temp (HTMin)", "Exposure Period Max Humidity (EHMax)", "Exposure Period Min Humidity (EHMin)",
                       "Holding Period Max Humidity (HHMax)", "Holding Period Min Humidity (HHMin)");
                        
                       array_push($fields_array, "Exposed Location of Control Mosquitoes(ELCM)", 
                       "No of Mosquitoes Tested Cone Height 0.5m (MT1)",
                       "No of Mosquitoes Tested Cone Height 1.0m (MT2)", 
                       "No of Mosquitoes Tested Cone Height 2.0m (MT3)",
                       "No of Mosquitoes Tested Cone Height Other (MT4)");
     
                       array_push($fields_array, "Mosquitoes K/D 30min Cone Height 0.5m (MKD1)",
                       "Mosquitoes K/D 60min Cone Height 0.5m (MKD2)",
                        "Mosquitoes K/D Day1 Cone Height 0.5m (MKD3)",
                       "Mosquitoes K/D Day2 Cone Height 0.5m (MKD4)",
                        "Mosquitoes K/D Day3 Cone Height 0.5m (MKD5)");
     
                             array_push($fields_array, "Mosquitoes K/D 30min Cone Height 1.0m (MKD6)",
                       "Mosquitoes K/D 60min Cone Height 1.0m (MKD7)", 
                       "Mosquitoes K/D Day1 Cone Height 1.0m (MKD8)",
                       "Mosquitoes K/D Day2 Cone Height 1.0m (MKD9)", 
                       "Mosquitoes K/D Day3 Cone Height 1.0m (MKD10)");
     
                       array_push($fields_array, "Mosquitoes K/D 30min Cone Height 1.5m (MKD11)");
     
     
                       array_push($fields_array, "Mosquitoes K/D 60min Cone Height 1.5m (MKD12)",
                       
                         "Mosquitoes K/D Day1 Cone Height 1.5m (MKD13)",
                       "Mosquitoes K/D Day2 Cone Height 1.5m (MKD14)", 
                       "Mosquitoes K/D Day3 Cone Height 1.5m (MKD15)");
     
                       array_push($fields_array, "Mosquitoes K/D 30min Cone Height 2.0m (MKD16)",
                       "Mosquitoes K/D 60min Cone Height 2.0m (MKD17)",
                        "Mosquitoes K/D Day1 Cone Height 2.0m (MKD18)",
                       "Mosquitoes K/D Day2 Cone Height 2.0m (MKD19)",  
                        "Mosquitoes K/D Day3 Cone Height 2.0m (MKD20)");
     
     
                        array_push ($fields_array, "Mosquitoes K/D net other1 mins (O1)",
                        "Mosquitoes K/D net other2 mins (O2)", "Mosquitoes K/D net other3 mins (O3)");
                        
       
                           $disabled_fields_array = array("Serial No. (SEN)","ED Form Serial Number (SSEN)","ED Form row (SFR)", "Form row (FR)");
                          
                           array_push($disabled_fields_array,"Date of Test (DOT)");
                         
                           array_push($disabled_fields_array, "GPS Accuracy (GA)", "GPS Data Source (GDS)");
                           
                           array_push($disabled_fields_array,"Specify GPS data source (SGDS)" , 
                           "Room Type (RT)", "Date of Spray (SpD)","Last Insecticide Used (LIU)");
                            
                                             
                           array_push($disabled_fields_array,
                         "Mosquito Origin (MO)", "Mosquito Species Tested (MST)", "Mosquito Age (MA)");
                         
                         array_push($disabled_fields_array,"Exposure Period Max Temp (ETMax)", "Exposure Period Min Temp (ETMin)" ,"Holding Period Max Temp (HTMax)","Holding Period Min Temp (HTMin)", "Exposure Period Max Humidity (EHMax)", "Exposure Period Min Humidity (EHMin)",
                         "Holding Period Max Humidity (HHMax)", "Holding Period Min Humidity (HHMin)");
     
     
     //definition
     
     
     
     $fields_array_two = array("Serial No. (SEN)","ED Form Serial Number (SSEN)","ED Form row (SFR)", "Form row (FR)");
     
     array_push($fields_array_two,"Date of Test (DOT)");
     
     array_push($fields_array_two, "GPS Accuracy (GA)", "GPS Data Source (GDS)");
     
     array_push( $fields_array_two,"Specify GPS data source (SGDS)" , 
     "What is the type of room (RT)", "Date when the last Spray was done (SpD)","What Insecticide was Used at last house (LIU)");
      
                       
     array_push($fields_array_two,
     "Mosquito Origin (MO)", "What Mosquito Species were Tested (MST)", "Mosquito Age (MA)");
     
     array_push($fields_array_two,"Exposure Period Max Temp (ETMax)", "Exposure Period Min Temp (ETMin)" ,"Holding Period Max Temp (HTMax)","Holding Period Min Temp (HTMin)", "Exposure Period Max Humidity (EHMax)", "Exposure Period Min Humidity (EHMin)",
     "Holding Period Max Humidity (HHMax)", "Holding Period Min Humidity (HHMin)");
     
     array_push($fields_array_two, "Exposed Location of Control Mosquitoes(ELCM)", 
     "No of Mosquitoes Tested When Cone Height is 0.5m (MT1)",
     "No of Mosquitoes Tested When Cone Height is 1.0m (MT2)", 
     "No of Mosquitoes Tested When Cone Height is 2.0m (MT3)",
     "No of Mosquitoes Tested When Cone Height is Other (MT4)");
     
     array_push($fields_array_two, "Mosquitoes K/D 30min When Cone Height is 0.5m (MKD1)",
     "Mosquitoes K/D 60min When Cone Height is 0.5m (MKD2)",
     "Mosquitoes K/D Day1 When Cone Height is 0.5m (MKD3)",
     "Mosquitoes K/D Day2 When Cone Height is 0.5m (MKD4)",
     "Mosquitoes K/D Day3 When Cone Height is 0.5m (MKD5)");
     
         array_push($fields_array_two, "Mosquitoes K/D 30min When Cone Height 1.0m (MKD6)",
     "Mosquitoes K/D 60min When Cone Height 1.0m (MKD7)", 
     "Mosquitoes K/D Day1 When Cone Height 1.0m (MKD8)",
     "Mosquitoes K/D Day2 When Cone Height 1.0m (MKD9)", 
     "Mosquitoes K/D Day3 When Cone Height 1.0m (MKD10)");
     
     array_push($fields_array_two, "Mosquitoes K/D 30min When Cone Height is 1.5m (MKD11)");
     
     
     array_push($fields_array_two, "Mosquitoes K/D 60min When Cone Height is 1.5m (MKD12)",
     
     "Mosquitoes K/D Day1 When Cone Height is 1.5m (MKD13)",
     "Mosquitoes K/D Day2 When Cone Height is 1.5m (MKD14)", 
     "Mosquitoes K/D Day3 When Cone Height is 1.5m (MKD15)");
     
     array_push($fields_array_two, "Mosquitoes K/D 30min When Cone Height is 2.0m (MKD16)",
     "Mosquitoes K/D 60min When Cone Height is 2.0m (MKD17)",
     "Mosquitoes K/D Day1 When Cone Height is 2.0m (MKD18)",
     "Mosquitoes K/D Day2 When Cone Height is 2.0m (MKD19)",  
     "Mosquitoes K/D Day3 When Cone Height is 2.0m (MKD20)");
     
     
     array_push ($fields_array_two, "Mosquitoes K/D net other1 mins (O1)",
     "Mosquitoes K/D net other2 mins (O2)", "Mosquitoes K/D net other3 mins (O3)");
     
     
       $disabled_fields_array = array("Serial No. (SEN)","ED Form Serial Number (SSEN)","ED Form row (SFR)", "Form row (FR)");
      
       array_push($disabled_fields_array,"Date of Test (DOT)");
     
       array_push($disabled_fields_array, "GPS Accuracy (GA)", "GPS Data Source (GDS)");
       
       array_push($disabled_fields_array,"Specify GPS data source (SGDS)" , 
       "Room Type (RT)", "Date of Spray (SpD)","Last Insecticide Used (LIU)");
        
                         
       array_push($disabled_fields_array,
     "Mosquito Origin (MO)", "Mosquito Species Tested (MST)", "Mosquito Age (MA)");
     
     array_push($disabled_fields_array,"Exposure Period Max Temp (ETMax)", "Exposure Period Min Temp (ETMin)" ,"Holding Period Max Temp (HTMax)","Holding Period Min Temp (HTMin)", "Exposure Period Max Humidity (EHMax)", "Exposure Period Min Humidity (EHMin)",
     "Holding Period Max Humidity (HHMax)", "Holding Period Min Humidity (HHMin)");



                  
                      
                      for ($i = 0; $i < count($fields_array); $i++) {
                      
                            $disable= "";     
                            $checked = "";
      
                            if(in_array($fields_array[$i],$checked_fields)){
                            $checked = "checked";}
      
                            if (in_array($fields_array[$i],$disabled_fields_array)){
                            $checked = "checked";}
                            
                            if (in_array($fields_array[$i],$disabled_fields_array)){
                            $disable = 'readonly="readonly"';} 
      
      
                            echo '<tr>';
                            echo '<td style="width:30%"> <div class="checkbox"><h5> <label> <input class="btn-success styled" type="checkbox" name="fieldsarr[]" value="'.$fields_array[$i].'" '.$disable.' '.$checked.' > '.$fields_array[$i].' </label></h5> </div></td>';
                            echo '<td style="width:70%"> <h5> '.$fields_array_two[$i].' </h5> </td>';
                            echo '</tr>';
  
  
                    }
            
                        ?>

                                    </tbody>
                                </table>
                            </div>

                            <div class="panel-footer form-actions text-right">

                                <button name="cleared" name="cleared" type="submit" id="cleared"
                                    class="btn btn-danger btn-lg"> <i class="fa fa-times" aria-hidden="true"></i> Delete
                                    saved </button>

                                <button name="submited2" name="submited2" type="submit" id="submited2"
                                    class="btn btn-primary btn-lg"> <i class="fa fa-check" aria-hidden="true"></i> Save
                                    fields
                                </button>

                            </div>


                        </form>

                    </div>
                    <!-- /first tab -->


                    <!-- Second tab -->
                    <div class="tab-pane fade" id="tabtwo">
                        <div class="animate__animated animate__fadeIn">
                            <!--  <img src="assets/images/SS1_form.png" alt=""> -->
                        </div>
                    </div>
                    <!-- /second tab -->
                </div>
            </div>
            <!-- /page tabs -->
        </div>
    </div>

    <?php include_once('layouts/foot.php'); ?>