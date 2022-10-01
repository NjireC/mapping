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


                        
<td class="text-center">

<div class="btn-group">
    <button class="btn btn-primary">  <i class="fa fa-file-text"></i>CDC Test</button>
    <button class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
        <span class="caret caret-split"></span>
    </button>
    <ul class="dropdown-menu">
    <li class="<?php echo $ss3ft; ?>"><a tabindex="-1" href="cdctest.php">CDC Test</a></li>
        <li class=""><a tabindex="-1" href="whoconetest.php">WHO Cone Test</a></li>
        <li class=""><a tabindex="-1" href="whotubetest.php">WHO TubeTest</a></li>
        
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
                         
                         array_push($fields_array, "GPS Accuracy (GA)",
                          "GPS Data Source (GDS)", "Specify GPS data source (SGDS)");
                           
                       array_push($fields_array,"Nets distributed in past 3 years (NDis)",
                       "Mosquito Origin (MO)", "Mosquito Species Tested (MST)", "Mosquito Age (MA)");




                     array_push($fields_array,"Insecticide Tested (IT)","What Synergist Was Tested (SynT)", 
                     "Insecticide Concentration (IC)", 
                     "Synergist Concentration (SC)", "Storage Room Temp (SRTemp)");

                     array_push($fields_array,"Exposure Period Max Temp (ETMax)", "Exposure Period Min Temp (ETMin)",
                     "Holding Period Max Temp (HTMax)","Holding Period Min Temp (HTMin)", 
                     "Exposure Period Max Humidity (EHMax)", "Exposure Period Min Humidity (EHMin)",
                     "Holding Period Max Humidity (HHMax)", "Holding Period Min Humidity (HHMin)");

                     array_push($fields_array,
                     "No of Mosquitoes Tested Bottle1 Insecticide (MTI1)",
                     "No of Mosquitoes Tested Bottle2 Insecticide (MTI2)",
                     "No of Mosquitoes Tested Bottle3 Insectcicide (MTI3)",
                     "No of Mosquitoes Tested Bottle4 Insectcicide (MTI4)",
                     "No of Mosquitoes Tested Bottle5 Insectcicide (MTI5)",
                     "No of Mosquitoes Tested Bottle6 Insectcicide (MTI6)");


              array_push($fields_array,
              "No of Mosquitoes Tested Solvent Control (MTS)",
              "No of Mosquitoes Tested Bottle1 Insecticide & Synergist (MTISy1)",
              "No of Mosquitoes Tested Bottle2 Insecticide & Synergist (MTISy2)",
              "No of Mosquitoes Tested Bottle3 Insecticide & Synergist (MTISy3)",
              "No of Mosquitoes Tested Bottle4 Insecticide & Synergist (MTISy4)",
              "No of Mosquitoes Tested Bottle5 Insecticide & Synergist (MTISy5)");
              
             array_push($fields_array, 
            "No of Mosquitoes Tested Bottle6 Insecticide & Synergist (MTISy6)",
            "No of Mosquitoes Tested Synergist Control (MTSy)",
            "Bottle Code Bottle1 Insecticide (BTCI1)",
            "Bottle Code Bottle2 Insecticide (BTCI2)",
            "Bottle Code Bottle3 Insecticide (BTCI3)",
            "Bottle Code Bottle4 Insecticide (BTCI4)");

            array_push($fields_array,
            "Bottle Code Bottle5 Insecticide (BTCI5)",
            "Bottle Code Bottle6 Insecticide (BTCI6)",
            "Bottle code Solvent Control (BC_S)");



            array_push($fields_array,
            "Bottle Code Bottle1 Synergist & Insecticide (BTCSy_I1)",
            "Bottle Code Bottle2 Synergist & Insecticide (BTCSy_I2)",
            "Bottle Code Bottle3 Synergist & Insecticide (BTCSy_I3)",
            "Bottle Code Bottle4 Synergist & Insecticide (BTCSy_I4)",
            "Bottle Code Synergist Control (BC_Sy)",
            "Date Bottle was Coated Bottle1 Insecticide (DBC_I1)");
  
            array_push($fields_array,
            "Date Bottle was Coated Bottle2 Insecticide (DBC_I2)",
            "Date Bottle was Coated Bottle3 Insecticide (DBC_I3)",
            "Date Bottle was Coated Bottle4 Insecticide (DBC_I4)",
            "Date Bottle was Coated Bottle5 Insecticide (DBC_I5)",
            "Date Bottle was Coated Bottle6 Insecticide (DBC_I6)",
            "Date Bottle was Coated Solvent Control (DBC_S)");


            array_push($fields_array,
            "Date Bottle was Coated Bottle1 Synergist & Insecticide (DBC_SyI1)",
            "Date Bottle was Coated Bottle2 Synergist & Insecticide (DBC_SyI2)",
            "Date Bottle was Coated Bottle3 Synegrist & Insecticide (DBC_SyI3)",
            "Date Bottle was Coated Bottle4 Synergist & Insecticide (DBC_SyI4)",
            "Date Bottle was Coated Synergist Control (DBC_Sy)",
            "Times Bottle coated used Bottle1 Insecticide (TBC_I1)");

            array_push($fields_array,
            "Times Bottle coated used Bottle2 Insecticide (TBC_I2)",
            "Times Bottle coated used Bottle3 Insecticide (TBC_I3)",
            "Times Bottle coated used Bottle4 Insecticide (TBC_I4)",
            "Times Bottle coated used Bottle5 Insecticide (TBC_I5)",
            "Times Bottle coated used Bottle6 Insecticide (TBC_I6)",
            "Times Bottle coated used Solvent Control (TBC_S)");
  
            array_push($fields_array,
            "Times Bottle coated used Bottle1 Synergist & Insecticide (TBC_SyI1)",
            "Times Bottle coated used Bottle2 Synergist & Insecticide (TBC_SyI2)",
            "Times Bottle coated used Bottle3 Synergist & Insecticide (TBC_SyI3)",
            "Times Bottle coated used Bottle4 Synergist & Insecticide (TBC_SyI4)",
            "Times Bottle coated used Synergist Control (TBC_Sy)");
           


  
            array_push($fields_array,
            "Knock Down/ Dead  Time 0min (KD_D0)",
            "Knock Down/ Dead  Time 15min (KD_D15)",
            "Knock Down/ Dead  Time 30min (KD_D30)",
            "Knock Down/ Dead  Time 45min (KD_D45)",
            "Knock Down/ Dead  Time 60min (KD_D60)",
            "Knock Down/ Dead  Time 75min (KD_D75)",
            "Knock Down/ Dead  Time 90min (KD_D90)",
            "Knock Down/ Dead  Time 105min (KD_D105)",
            "Knock Down/ Dead  Time 120min (KD_D120)",
            "Knock Down/ Dead  Time 24hr (KD_D24)",
            "Knock Down/ Dead  Time 72hr (KD_D72)");


          
           

  

            $disabled_fields_array = array("Serial No. (SEN)","ED Form Serial Number (SSEN)","ED Form row (SFR)", "Form row (FR)");
         
            

            array_push($disabled_fields_array,"Date of Test (DOT)");
                         
            array_push($disabled_fields_array, "GPS Accuracy (GA)",
             "GPS Data Source (GDS)", "Specify GPS data source (SGDS)");
              
          array_push($disabled_fields_array,"Nets distributed in past 3 years (NDis)",
          "Mosquito Origin (MO)", "Mosquito Species Tested (MST)", "Mosquito Age (MA)");



        array_push($disabled_fields_array,"Type of Bottle Bioassay (TB)", "Bioassay for Intensity Assay (BIA)");
        
        array_push($disabled_fields_array,"Insecticide Tested (IT)","What Synergist Was Tested (SynT)", 
        "Insecticide Concentration (IC)", 
        "Synergist Concentration (SC)", "Storage Room Temp (SRTemp)");

        array_push($disabled_fields_array,"Exposure Period Max Temp (ETMax)", "Exposure Period Min Temp (ETMin)",
        "Holding Period Max Temp (HTMax)","Holding Period Min Temp (HTMin)", 
        "Exposure Period Max Humidity (EHMax)", "Exposure Period Min Humidity (EHMin)",
        "Holding Period Max Humidity (HHMax)", "Holding Period Min Humidity (HHMin)");

       //definition
       


       $fields_array_two = array("Serial No. (SEN)","ED Form Serial Number (SSEN)","ED Form row (SFR)", "Form row (FR)");
                     
                     

                         array_push($fields_array_two,"Date of Test (DOT)");
                         
                         array_push($fields_array_two, "GPS Accuracy (GA)",
                          "GPS Data Source (GDS)", "Specify GPS data source (SGDS)");
                           
                       array_push($fields_array_two,"Where Nets distributed in past 3 years (NDis)",
                       "Mosquito Origin (MO)", "What Mosquito Species are Tested (MST)", "Mosquito Age (MA)");




                     array_push($fields_array_two,"What Insecticide Was Tested (IT)","If synergist assay completed, What Synergist Was Tested (SynT)", 
                     " What Was the Insecticide Concentration (IC)", 
                     "What Was the Synergist Concentration (SC)", "Storage Room Temp (SRTemp)");

                     array_push($fields_array_two,"Exposure Period Max Temp (ETMax)", "Exposure Period Min Temp (ETMin)",
                     "Holding Period Max Temp (HTMax)","Holding Period Min Temp (HTMin)", 
                     "Exposure Period Max Humidity (EHMax)", "Exposure Period Min Humidity (EHMin)",
                     "Holding Period Max Humidity (HHMax)", "Holding Period Min Humidity (HHMin)");

                     array_push($fields_array_two,
                     "No of Mosquitoes Tested in Bottle1 with Insecticide (MTI1)",
                     "No of Mosquitoes Tested in Bottle2 with Insecticide (MTI2)",
                     "No of Mosquitoes Tested in Bottle3 with Insectcicide (MTI3)",
                     "No of Mosquitoes Tested in Bottle4 with Insectcicide (MTI4)",
                     "No of Mosquitoes Tested in Bottle5 with Insectcicide (MTI5)",
                     "No of Mosquitoes Tested in Bottle6 with Insectcicide (MTI6)");


              array_push($fields_array_two,
              "No of Mosquitoes Tested in Solvent Control (MTS)",
              "No of Mosquitoes Tested in Bottle1 with Insecticide & Synergist (MTISy1)",
              "No of Mosquitoes Tested in Bottle2 with Insecticide & Synergist (MTISy2)",
              "No of Mosquitoes Tested in Bottle3 with Insecticide & Synergist (MTISy3)",
              "No of Mosquitoes Tested in Bottle4 with Insecticide & Synergist (MTISy4)",
              "No of Mosquitoes Tested in Bottle5 with Insecticide & Synergist (MTISy5)");
              
             array_push($fields_array_two, 
            "No of Mosquitoes Tested in Bottle6 with Insecticide & Synergist (MTISy6)",
            "No of Mosquitoes Tested in Synergist Control only (MTSy)",
            "Bottle Code Bottle1 with Insecticide (BTCI1)",
            "Bottle Code Bottle2 with Insecticide (BTCI2)",
            "Bottle Code Bottle3 with Insecticide (BTCI3)",
            "Bottle Code Bottle4 with Insecticide (BTCI4)");

            array_push($fields_array_two,
            "Bottle Code Bottle5 with Insecticide (BTCI5)",
            "Bottle Code Bottle6 with Insecticide (BTCI6)",
            "Bottle code Solvent with Control (BC_S)");



            array_push($fields_array_two,
            "Bottle Code Bottle1 with Synergist & Insecticide (BTCSy_I1)",
            "Bottle Code Bottle2 with Synergist & Insecticide (BTCSy_I2)",
            "Bottle Code Bottle3 with Synergist & Insecticide (BTCSy_I3)",
            "Bottle Code Bottle4 with Synergist & Insecticide (BTCSy_I4)",
            "Bottle Code with Synergist Control only (BC_Sy)",
            "Date Bottle was coated Bottle1 with Insecticide (DBC_I1)");
  
            array_push($fields_array_two,
            "Date Bottle was coated Bottle2 with Insecticide (DBC_I2)",
            "Date Bottle was coated Bottle3 with Insecticide (DBC_I3)",
            "Date Bottle was coated Bottle4 with Insecticide (DBC_I4)",
            "Date Bottle was coated Bottle5 with Insecticide (DBC_I5)",
            "Date Bottle was coated Bottle6 with Insecticide (DBC_I6)",
            "Date Bottle was coated with Solvent Control only (DBC_S)");


            array_push($fields_array_two,
            "Date Bottle1 was coated with Synergist & Insecticide (DBC_SyI1)",
            "Date Bottle2 was coated with Synergist & Insecticide (DBC_SyI2)",
            "Date Bottle3 was coated with Synegrist & Insecticide (DBC_SyI3)",
            "Date Bottle4 was coated with Synergist & Insecticide (DBC_SyI4)",
            "Date Bottle was coated with Synergist Control only (DBC_Sy)",
            "Number of Times coated Bottle was used- Bottle1 with Insecticide (TBC_I1)");

            array_push($fields_array_two,
            "Number of Times coated Bottle was used- Bottle2 with Insecticide (TBC_I2)",
            "Number of Times coated Bottle was used- Bottle3 with Insecticide (TBC_I3)",
            "Number of Times coated Bottle was used- Bottle4 with Insecticide (TBC_I4)",
            "Number of Times coated Bottle was used- Bottle5 with Insecticide (TBC_I5)",
            "Number of Times coated Bottle was used- Bottle6 with Insecticide (TBC_I6)",
            "Number of Times coated Bottle was used with Solvent Control (TBC_S)");
  
            array_push($fields_array_two,
            "Number of Times coated Bottle was used- Bottle1 with Synergist & Insecticide (TBC_SyI1)",
            "Number of Times coated Bottle was used- Bottle2 with Synergist & Insecticide (TBC_SyI2)",
            "Number of Times coated Bottle was used- Bottle3 with Synergist & Insecticide (TBC_SyI3)",
            "Number of Times coated Bottle was used- Bottle4 with Synergist & Insecticide (TBC_SyI4)",
            "Number of Times coated Bottle was used with Synergist Control (TBC_Sy)");
           


  
            array_push($fields_array_two,
            "Number of Mosquitoes Knocked Down/ Dead when Time 0min (KD_D0)",
            "Number of Mosquitoes Knocked Down/ Dead when Time 15min (KD_D15)",
            "Number of Mosquitoes Knocked Down/ Dead when Time 30min (KD_D30)",
            "Number of Mosquitoes Knocked Down/ Dead when Time 45min (KD_D45)",
            "Number of Mosquitoes Knocked Down/ Dead when Time 60min (KD_D60)",
            "Number of Mosquitoes Knocked Down/ Dead when Time 75min (KD_D75)",
            "Number of Mosquitoes Knocked Down/ Dead when Time 90min (KD_D90)",
            "Number of Mosquitoes Knocked Down/ Dead when Time 105min (KD_D105)",
            "Number of Mosquitoes Knocked Down/ Dead when Time 120min (KD_D120)",
            "Number of Mosquitoes Knocked Down/ Dead when Time 24hr (KD_D24)",
            "Number of Mosquitoes Knocked Down/ Dead when Time 72hr (KD_D72)");


        //     $disabled_fields_array = array("Serial No. (SEN)","ED Form Serial Number (SSEN)","ED Form row (SFR)", "Form row (FR)");
         
            

        //     array_push($disabled_fields_array,"Date of Test (DOT)");
                         
        //     array_push($disabled_fields_array, "GPS Accuracy (GA)",
        //      "GPS Data Source (GDS)", "Specify GPS data source (SGDS)");
              
        //   array_push($disabled_fields_array,"Nets distributed in past 3 years (NDis)",
        //   "Mosquito Origin (MO)", "Mosquito Species Tested (MST)", "Mosquito Age (MA)");



        // array_push($disabled_fields_array,"Type of Bottle Bioassay (TB)", "Bioassay for Intensity Assay (BIA)");
        
        // array_push($disabled_fields_array,"Insecticide Tested (IT)","What Synergist Was Tested (SynT)", 
        // "Insecticide Concentration (IC)", 
        // "Synergist Concentration (SC)", "Storage Room Temp (SRTemp)");

        // array_push($disabled_fields_array,"Exposure Period Max Temp (ETMax)", "Exposure Period Min Temp (ETMin)",
        // "Holding Period Max Temp (HTMax)","Holding Period Min Temp (HTMin)", 
        // "Exposure Period Max Humidity (EHMax)", "Exposure Period Min Humidity (EHMin)",
        // "Holding Period Max Humidity (HHMax)", "Holding Period Min Humidity (HHMin)");



                  
                      
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