<?php 

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
 */

require_once('includes/load.php');
$page_title = 'Settings | MosquitoDB'; 
page_require_level(2);
include_once('layouts/head.php');

$formtype = "ED1";
$table = "custed";


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

               $result2 = $db->query("INSERT INTO {$db->escape($table)} (pc, ft, num_split, p_attri,p_attri2) VALUES('".$_SESSION['expcode']."','".$formtype."','".$fieldarraysize."','".$fieldsshort_array2."','".$fieldsarr."')");
                 
                   
                     if($result2){

                           $_SESSION['msg'] = '<script type="text/javascript">'.
                                        "$.jGrowl('Fields saved!', {  theme: 'growl-success', header: '' });".
                                     '</script>';

                           echo $_SESSION['msg']; 
                           unset($_SESSION['msg']);
                         }
                  
            }else{
            
                 $sql = "UPDATE {$db->escape($table)} SET num_split='".$fieldarraysize."',p_attri='".$fieldsshort_array2."',p_attri2='".$fieldsarr."' WHERE pc ='{$_SESSION['expcode']}' AND ft='{$formtype}' LIMIT 1";

                 $result2 =  $db->query($sql);
                 
                  if($result2){

                           $_SESSION['msg'] = '<script type="text/javascript">'.
                                        "$.jGrowl('Fields saved!', {  theme: 'growl-success', header: '' });".
                                     '</script>';

                           echo $_SESSION['msg']; 
                           unset($_SESSION['msg']);
                         }
                
            }

       }

  
    }

 } else if(isset($_POST['cleared'])){


      if (!empty($_SESSION['expcode'])){
          
        $resultcust = $db->query("SELECT * FROM {$db->escape($table)} WHERE pc='{$db->escape($_SESSION['expcode'])}' AND ft='{$formtype}' LIMIT 1");

      if($db->num_rows($resultcust) === 0){

          $_SESSION['msg'] = '<script type="text/javascript">'.
          "$.jGrowl('Fields saved!', {  theme: 'growl-error', header: 'Not customized' });".
          '</script>';

        //echo $_SESSION['msg']; 
        //unset($_SESSION['msg']);
              
        }else{
        
            $sql = "DELETE FROM ".$db->escape($table);
            $sql .= " WHERE ".$db->escape($field)."=".$_SESSION['expcode']." AND ".$db->escape($field2)."="."'ED1'";
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
    <?php echo display_msg_popup($msg);  ?>
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
            <h6 class="panel-title">Experimental Design</h6>

            <div class="btn-group pull-right">
                <form action="scripts/exporttemp.php" method="post">

                    <a href="settings_edtemp.php" <button class="btn btn-success btn-flat"><i
                                class="fa fa-cog"></i>Customize General Template</button> </a>

                    <button type="submit" name='downloadtemp' class="btn btn-warning btn-flat"><i
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
                                    "$.jGrowl('Fields not customized!', { life: 20000, theme: 'growl-error', header: 'Info' });".
                                  '</script>';

                        echo $msg_warn; 
                    }

                  }

                
                $fields_array = array("Serial No. (SEN)","Formrow (FR)","Date of collection (DT)","Region/ Province (RE)","District (DI)","Sector/Council (SEC)","Cell/Ward (CEW)","Village/Street (VIS)","Enumeration area (EA)");
                array_push($fields_array, "Cluster (CR)", "Compound or plot (CP)","Household (HH)","Animals in Household (NAH)","Structure ID (SID)","Method (ME)","Indoor/Outdoor (IND)");
                array_push($fields_array, "Habitat type (HT)", "Start time (ST)","Finish time (FT)","Holding period (HP)","Round (RND)");

                array_push($fields_array, "Season (SN)","Weather Conditions (WTC)","Agriculture status (AGRT)","Intervention (INVN)","Livestock (LVK)","Roof type (RFE)","Wall type (WLE)","Eaves (EVS)","Block ventilation (BV)","Block ventilation screening (BVS)","Window screening (WSN)","Window screening Condition (WSNC)","Cooking location (CKL)","Cooking Energy source (CKE)");

                array_push($fields_array, "Block (BLK)", "House/Hut (SHH)","Station (STN)","Volunteer initials (VI)","Volunteer gender (VIG)","Treatment (TR)","Experimental day (DY)","Temperature (TMP)",
                  "Humidity (HMD)","Wind speed (WS)","No. Household Sampled (HS)","Sprayed (SP)","Last spray date (LSD)","Insectside (ISE)",
                  "Valid catch (VC)","Notes (Notes)","GPSlocation (GPS)","Destination Form Serial (DSEN)");


                $disabled_fields_array = array("Serial No. (SEN)","Formrow (FR)","Date of collection (DT)");
                array_push($disabled_fields_array, "Method (ME)","Indoor/Outdoor (IND)","Start time (ST)","Finish time (FT)","Valid catch (VC)","Destination Form Serial (DSEN)");


            
                //definition
                $fields_array_two = array("Unique identifier for each form","Unique identifier of each row on the data collection form","The date of the morning on which the
                mosquitoes were collected ","Region","District","Sector/Council","Cell/Ward","Village/Street","Defined geographic location within the study site");
                array_push($fields_array_two, "The smallest geographical statistical unit within the EA", "A specific physical area with an identifiable owner or user and with clear boundaries","A person or group of persons who live together in the same dwelling unit, who acknowledge one adult as the head of the household and who share the same housekeeping arrangements","Animals in Household","A free-standing building that can have one or more rooms for residential or commercial use","The method by which the mosquitoes
                were collected or trapped","Whether the collection was made inside 
                a house or hut");
                array_push($fields_array_two, "Classification of the aquatic habitat in 
                which the collection was made", "The time that the collection started in 24 h time ","The time that the collection finished in 24 h time","The period of time for which the 
                mosquitoes were held, to allow
                 insecticides to kill them after they were
                 collected","Sequential cycle or rotation of the treatments as per a pre-defined experimental plan");

                array_push($fields_array_two, "The season of the geographic location where the study is being conducted ","Weather Conditions","Agriculture practices found geographic location where the study is being conducted","Intervention found in the geographic location where the study is being conducted","Livestock presence in the geographic location where the study is being conducted","Roof type of the house where mosquitoes were collected or trapped ","Wall type of the house where mosquitoes were collected or trapped ","Eaves presence in the house where mosquitoes were collected or trapped ","Block ventilation of the house where mosquitoes were collected or trapped ","Block ventilation screening of the house where mosquitoes were collected or trapped ","Window screening presence of the house where mosquitoes were collected or trapped ","Window screening Condition of the house where mosquitoes were collected or trapped ","Cooking location of the house where mosquitoes were collected or trapped ","Cooking Energy source of the house where mosquitoes were collected or trapped ");

                array_push($fields_array_two, "A defined area or set of positions
                (e.g. houses) through which treatments  are rotated in a Latin square or similar  rank design", "A project-specific unique ID for a specific house or experimental hut","A project-specific unique ID of a specific station where a trap may be positioned","The initial of the volunteer who completed the informed consent form ","The gender of the volunteer who completed the informed consent form ","Coding for the unique experimental 
                treatment (e.g., different types of insecticide)","The sequence number of the experiment day since the experiment commenced"," The temperature of the geographic location where mosquitoes were collected or trapped ",
                  "The humidity of the geographic location where mosquitoes were collected or trapped ","The wind speed of the geographic location where mosquitoes were collected or trapped ","No. Household Sampled","Sprayed","Last spray date","Insectside",
                  "Legitimacy of the experimental assay","On-site observations","Geographic location information where the study is being conducted (Latitude,Longitude,Altitude and Accuracy)","Unique identifier for the destination data collection form");


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
                      echo '<td style="width:25%"> <div class="checkbox"><h5> <label> <input class="btn-success styled" type="checkbox" name="fieldsarr[]" value="'.$fields_array[$i].'" '.$disable.' '.$checked.' > '.$fields_array[$i].' </label></h5> </div></td>';
                      echo '<td style="width:75%"> <h5> '.$fields_array_two[$i].' </h5> </td>';
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
                                    fields </button>

                            </div>


                        </form>


                    </div>
                    <!-- /first tab -->


                    <!-- Second tab -->
                    <div class="tab-pane fade" id="tabtwo">
                        <div class="animate__animated animate__fadeIn">
                            <img src="assets/images/ED1_form.png" alt="">
                        </div>
                    </div>
                    <!-- /second tab -->

                </div>
            </div>
            <!-- /page tabs -->

        </div>
    </div>



    <?php include_once('layouts/foot.php'); ?>