<?php 

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
 */
require_once('includes/load.php');
$page_title = 'Settings | MosquitoDB'; 
page_require_level(2);
include_once('layouts/head.php');

$formtype = "ED2";
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
        $sql .= " WHERE ".$db->escape($field)."=".$_SESSION['expcode']." AND ".$db->escape($field2)."="."'ED2'";
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

                    <a href="settings_ed2temp.php" <button class="btn btn-success"><i class="fa fa-cog"></i>Customize
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

                              $msg_warn = '<script type="text/javascript">'.
                                            "$.jGrowl('Fields customized!', { life: 20000, theme: 'growl-success', header: '' });".
                                         '</script>';

                               echo $msg_warn; 

                            }else{
                              
                              $msg_warn = '<script type="text/javascript">'.
                                            "$.jGrowl('Fields not customized!', { life: 20000, theme: 'growl-error', header: '' });".
                                         '</script>';

                               echo $msg_warn; 
                            }

                         }


                       
                        $fields_array = array("Serial No. (SEN)","Formrow (FR)","Source Form Serial No. (SSEN)","Source Form Row (SFR)");
                       
                        array_push($fields_array, "Sample Lable Code (SLC)", "Source Body Part (SBP)","Source Sample Type (SST)","Source Sample ID (SSID)");

                        array_push($fields_array,"Source Colony Code (SCC)"," Source Taxon (STX)","Source Sex and Abdominal Status (SSAS)","Age (AG)","Number of Mosquitoes (N)");

                        array_push($fields_array, "Start Date (SD)", "Start Time (ST)");
                        
                        array_push($fields_array, "Treatment (TR)","Volunteer initials (VI)","Round (RND)","Experimental Day (DY)","Other1 (OTH1)","Other2 (OTH2)", "Other3 (OTH3)","Valid Assay (VA)","Notes (Notes)","Destination Form Serial (DSEN)");
               

                        $disabled_fields_array = array("Serial No. (SEN)","Formrow (FR)");
                        #array_push($disabled_fields_array, "Sample Lable Code (SLC)", "Source Body Part (SBP)","Source Sample Type (SST)","Source Sample ID (SSID)");

                        #array_push($disabled_fields_array,"Source Colony Code (SCC)"," Source Taxon (STX)","Source Sex and Abdominal Status (SSAS)","Age (AG)","Number of Mosquitoes (N)");

                        array_push($disabled_fields_array, "Number of Mosquitoes (N)","Start Date (SD)", "Start Time (ST)","Destination Form Serial (DSEN)");


                        //definition
                        $fields_array_two = array("Unique identifier for each form","Unique identifier of each row on the data collection form","Unique identifier for the source data collection form","Unique identifier for the row of the source data collection form");                   
                        array_push($fields_array_two, "Unique label code for each sample or set of samples - labelled using the current date in yyyymmdd format followed by 3 digits to different samples", "The body part of the source sample","Designates the category of sample as
                        either individual or batch or pool","Unique identifier of each sample within one sample type from the source form");
                        array_push($fields_array_two,"Unique identifier for each distinct insectary colony","Taxonomic classification of the mosquitoes","The sex of the mosquitoes or if female, the visual classification of abdomen","The known or estimated age in days of the mosquitoes","The number of mosquitoes used in each experiment counted after being sorted or into a defined category or prepared for inclusion in an experiment");
                        array_push($fields_array_two, "The date that the observation started", "The time that the observation started");                     
                        array_push($fields_array_two, "Coding for the unique experimental 
                        treatment","The initial of the volunteer who completed the informed consent form ","Sequential cycle or rotation of the treatments as per a pre-defined experimental plan","The sequence number of the experiment day since the experiment commenced","Other field 1","Other field 2", "Other field 3","Legitimacy of the experimental assay ","On-site observations ","Unique identifier for the destination data collection form");
               

                        for ($i = 0; $i < count($fields_array_two); $i++) {
                      
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
                            <img src="assets/images/ED2_form.png" alt="">
                        </div>
                    </div>
                    <!-- /second tab -->

                </div>
            </div>
            <!-- /page tabs -->


        </div>
    </div>

    <?php include_once('layouts/foot.php'); ?>