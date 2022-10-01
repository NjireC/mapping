<?php

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
 **/
require_once('includes/load.php');
$page_title = 'Sample Sorting | MosquitoDB';
page_require_level(3);
include_once('layouts/head.php');

$formtype = "SS4";
$table   = "custss";

?>

<?php

//Show error occur during posting of data
function show_report($recorded, $skip, $errors)
{

   echocsverror("<font color=\"green\"><span class=\"has-padding\">-->Rows Successfully recorded :<b>" . $recorded . "</b></span></font>");
   echocsverror("<font color=\"red\"><span class=\"has-padding\">-->Rows Skipped :<b>" . $skip . "</b></span></font>");
   echocsverror("<span class=\"has-padding\">-->These rows are: </span>");

   foreach ($errors as $error) {
      //call function echocsv() to display those error
      echocsverror($error);
   }
   //exit();

   echo "
    <div class=\"btn-group pull-right\">
    <input class=\"btn custom-btn btn-primary\" type=\"button\" value=\"Back\" onclick=\"return goback();\"/>
    </div>
    ";
}

?>


<!-- Page content -->
<div class="page-content">
   <?php echo display_msg_popup($msg); ?>
   <!-- Page title -->
   <div class="page-title">
      <h5><i class="fa fa-bars"></i> Home
         <small>Welcome, <?php echo $name; ?> </small>
      </h5>
   </div>


   <!-- /page title -->
   <div class="panel panel-primary">
      <div class="panel-heading">
         <h6 class="panel-title"> Forms For: <span id="pname"></span></h6>
         <div class="btn-group pull-right">

            <?php include_once('scripts/selectproject.php'); ?>

         </div>
      </div>
   </div>

   <div class="panel panel-default">
      <div class="panel-heading">
         <h6 class="panel-title">Sample Sorting</h6>

         <div class="btn-group pull-right">
            <form action="scripts/exporttemp.php" method="post">

               <button type="submit" name='downloadtemp' class="btn btn-default">
                  <i class="fa fa-download"></i>Download Template
               </button>
               <input type="hidden" name="fo" value="<?php echo $formtype; ?>">
               <input type="hidden" name="ta" value="<?php echo $table; ?>">

            </form>
         </div>


      </div>
      <div class="panel-body"><br />


         <div class="results">

            <div id="body_n">

               <!-- InstanceBeginEditable name="Body part" -->
               <?php

               function show_form($messagenumber, $message)
               {
                  global $HTTP_POST_VARS, $print_again, $error, $db;
               ?>

                  <form method="post" action="">

                     <br />

                     <div class="form-actions text-center">

                        <div class="center-block" style="width:300px">
                           <select class="select-full" name="site_id" id="site_id"> </select>
                        </div>

                     </div>
                     <br />


                     <div class="row">
                        <div class="center-block" style="width:300px">
                           <div class="input-group">
                              <div class="input-group-btn">
                                 <button id="upload" type="button" class="btn custom-btn btn-info">
                                    <span><i class="fa fa-upload"></i> Upload File</span>
                                 </button>
                              </div>
                              <input id="status" type="text" class="form-control field-heightc" disabled="disabled">
                           </div>
                        </div>
                     </div>

                     <br />

                     <div class="form-actions text-center">
                        <button name="submit" type="submit" id="submit" value="Save" class="btn custom-btn btn-primary" />
                        <i class="fa fa-check" aria-hidden="true"></i>Submit </button>
                     </div>
                  </form>


               <?php
               }

               function insertdata($projectid, $siteid, $staff_id, $submitted)
               {

                  global $db;

                  $formtype = "SS4";
                  $table   = "custss";

                  $prefixtable = $projectid . "_";

                  $ed1 = $prefixtable . "ed1";
                  $ss4 = $prefixtable . "ss4";
                  $edss = $prefixtable . "edss";
                  $ssso = $prefixtable . "ssso";

                  echo '  <div class="text-center">';

                  echo "<span class=\"has-padding\"> <h4><u>Summary of Upload Report</u> </h4><span><br />";

                  echo '</div>';

                  echo "<span class=\"has-padding\"> -->Preparing file <span><br />";

                  //fetch link key join projectregister and site
                  $query_1 = "SELECT id FROM projectregsite WHERE site_id='$siteid' AND projectreg_id='$projectid'";
                  //execute query above
                  $result = $db->query($query_1);
                  //fetching link
                  //echo "Fetching link <br />";
                  //check if query execute successfull
                  if ($result == TRUE) {
                     //check number of row`s found in table projectregsite
                     //count number of row return
                     $num_row = $db->num_rows($result);
                     //fetch data from database
                     $row = $db->fetch_assoc($result);
                     //check if number of row is equal to one
                     if ($num_row == 1) {
                        //Link found
                        //echo "Link found  <br />";
                        //hold value of projectregsite identification
                        $projectregsite = $row["id"];
                     }

                     $pquery = "SELECT * FROM $table  WHERE custss.pc='$projectid' AND  custss.ft='$formtype'";
                     //execute query
                     $presult = $db->query($pquery);
                     //detect number of row from query execute above
                     $pnum_row = $db->num_rows($presult);

                     if ($pnum_row == 1) {

                        //fetch data from query executed above
                        $row = $db->fetch_assoc($presult);
                        //assign value to valiable
                        $umbersplit = $row["num_split"];

                        $patternattribute = $row["p_attri"];

                        //check if variable $projectregsite is greater than zero

                        //check if variable $projectregsite is greater than zero
                        if ($projectregsite > 0) {

                           $uploaddir  = './upload_temp/';
                           $user       = $_SESSION['user_id'];
                           $projectcode = $_SESSION['projectcode'] . "/";
                           $uploaddir  = $uploaddir . $projectcode;
                           $target_path = $uploaddir . "" . $user . ".csv";

                           //file open in read mode
                           $file = @fopen($target_path, "r");
                           //check if file is open
                           if (!$file) {
                              //call function show_form() with message to user
                              show_form(2, "Error opening file uploaded file");
                              show_formdown();
                              exit();
                           }
                           //Opening file

                           echo "<span class=\"has-padding\"> -->File opened </span><br />";
                           //check file size
                           $size = filesize($target_path);
                           //check if file in not empty
                           if (!$size) {
                              //call function show_form() with message to user
                              show_form(2, "File is empty");
                              show_formdown();
                              exit();
                           }
                           //file size

                           $csv = explode("\n", file_get_contents($target_path));

                           $arraycsv1 = explode(",", $csv[1]);
                           //echo count($arraycsv1);
                           $arraypattern = explode(",", $patternattribute);
                           //echo count($arraypattern);

                           //read file contents
                           echo "<span class=\"has-padding\"> -->Start of reading file  <span> <br />";

                           //close file / pointer
                           fclose($file);
                           //delete file upload
                           @unlink($target_path);
                           //hold number of line from cvs
                           $numberline = 1;
                           //hold array from line array after split it
                           $linearray = array();
                           //data separator and line separator valiable
                           $fieldseparator = ",";
                           $lineseparator = "\n";
                           //for recorded successfull rows inserted into database
                           $recorded = 0;
                           //for recorded skipped rows which didn't inserted into database
                           $skip = 0;

                           if (count($arraycsv1) == count($arraypattern)) {

                              foreach ($csv as $key => $line) {

                                 //trim tab in field
                                 //remove tab in field
                                 $line = trim($line, " \t");
                                 //Replace all occurrences of  \r in haystack with "".
                                 $line = str_replace("\r", "", $line);
                                 //call function rowIdentifier
                                 list($rowtype, $data) = rowIdentifier($line, "SS1", $patternattribute);
                                 //echo $line."<br />";
                                 //start to detect which type of row
                                 //row contain serial number of ED
                                 if ($rowtype == 1) {
                                 } //row contain heading of columns
                                 elseif ($rowtype == 2) {
                                    //message to user
                                    // echo "Row number:".$numberline." Headers of columns<br />";
                                    //allow data to be inserted into database
                                    $pass = 1;
                                 } //row contain rowdata (dataset)
                                 elseif ($rowtype == 3/* && $pass ==1*/) {

                                    //split array $line into $_session["num_split"]   pieces
                                    //$linearray = split(",", $line, $_SESSION["num_split"]);
                                    $line_array = explode(",", $line, $umbersplit);
                                    //combine array $linearray to one variable
                                    $line_array = "'" . implode("', '", $line_array) . "'";
                                    //echo $line_array;
                                    //message to user
                                    //  echo "<span class=\"has-padding\"> --> Row number:".$numberline." Prepare information.. ";
                                    //assign value
                                    $arraycsvss = explode(",", $line);
                                    //echo $arraycsvss[0];

                                    $sen  = $arraycsvss[0];
                                    $ssen = $arraycsvss[1];
                                    $sfr  = $arraycsvss[2];
                                    $senfr = $arraycsvss[0] . $arraycsvss[4];

                                    //create query for fetching link value from edss entity
                                    $query_fetch = "SELECT
                                              edss.id
                                              FROM
                                              $edss as edss
                                              INNER JOIN
                                              $ed1 as ed1
                                              ON (edss.ed1id = ed1.id)
                                              WHERE ed1.sen=$ssen AND ed1.dsen=$sen AND
                                              ed1.projectregsite_id=$projectregsite AND ed1.fr=$sfr";
                                    //echo query_fetch data
                                    //echo $query_fetch.'<br />';
                                    //execute query
                                    //call function linkFetch()
                                    list($resulttype, $datareturn) = linkFetch($query_fetch);
                                    //echo '<br />'.$resulttype.'<br />';
                                    if ($resulttype == 1) {
                                       //message to user display multiple linkage
                                       $errors[] = "<span class=\"has-padding\"><font color=\"red\">  -->No link Found (Upload Relevant ED File first) - SEN: $sen,SSEN: $ssen,SFR: $sfr </font></span>";
                                       //Increment row skipped
                                       $skip++;
                                    }
                                    //choose type value return
                                    if ($resulttype == 2) {
                                       //retrive integer value from variable $datareturn
                                       $data = intval($datareturn);
                                       //determine if data return from the system is integer by using function is_int()
                                       if (is_int($data)) {
                                          //set environment for linking two form ed and ss
                                          $edssid = $data;
                                          // echo "<font color=\"green\"> Link found. </font>";
                                          //prepare query to insert into SS1

                                          $query_part = "INSERT INTO $ss4 (edssid,$patternattribute,senfr,userid,submitted) VALUES($edssid,$line_array,$senfr,$staff_id,'$submitted')";

                                          //echo $query_part."<br />";
                                          //execute query
                                          $result = $db->mysqliquery($query_part);
                                          //successful of query
                                          if ($result == TRUE) {

                                             $recorded++;
                                          } elseif ($result == FALSE) {
                                             //display message to user

                                             if ($db->mysqlierrorno() === 1062) {
                                                $error = 'Dublicate Record:SEN:' . $arraycsvss[0] . ',SSEN:' . $arraycsvss[1] . ',SFR:' . $arraycsvss[2];
                                             } else {
                                                $error = $db->mysqlierror();
                                             }

                                             $errors[] = "<span class=\"has-padding\"><font color=\"red\"> -->Row number :" . $numberline . "Failed to save details.Reason:  '" . $error . "'</font></span> ";

                                             //Increment row skipped
                                             $skip++;
                                          }
                                       }
                                    }
                                    if ($resulttype == 3) {
                                       //message to user display multiple linkage
                                       $errors[] = "<span class=\"has-padding\"><font color=\"red\">  Found multiple link see system administrator</font> </span>";
                                       //Increment row skipped
                                       $skip++;
                                    }
                                 } //row contain empty first column
                                 elseif ($rowtype == 4) {
                                    //message to user
                                    $errors[] = "<span class=\"has-padding\"> -->Row number:" . $numberline . " columns are empty</span>";
                                 } //row contain show end of form
                                 elseif ($rowtype == 5) {
                                    //message to user

                                    $errors[] = "<span class=\"has-padding\"> --> Row number:" . $numberline . " end of file</span>";
                                    //disallow data to be inserted into database
                                    $pass = 2;
                                 }

                                 //increment number line
                                 $numberline++;
                              } //end of foreach function

                           } //endifcolumnnotmatch

                           else {
                              echo "<span class=\"has-padding\"> <font color=\"red\"> <h3> ** Fields dont match with template ** </h3></font><span> <br />";

                              echo "
                                      <div class=\"btn-group pull-right\">
                                      <input class=\"btn custom-btn btn-primary\" type=\"button\" value=\"Back\" onclick=\"return goback();\"/>
                                      </div>
                                      ";
                              exit();
                           }

                           $query_insert_edss = "INSERT INTO  $ssso (ss4id) SELECT `ss4`.`id` FROM
                                  $ssso as ssso RIGHT JOIN  $ss4 as ss4 ON (`ssso`.`ss4id` = `ss4`.`id`) WHERE ssso.ss4id IS NULL";

                           $result = $db->query($query_insert_edss);

                           show_report($recorded, $skip, $errors);
                           //message to user to show row`s recorded successfull and failed
                           //echo "<h5><span class=\"has-padding\"> --><font color=\"green\">Rows Successfully Recorded: <b>$recorded</b></font> ; <font color=\"red\">Failed: <b>$skip </b> </span></font></h5>";
                           show_formdown();
                           exit();
                        }
                     } else {

                        //create query
                        $query = "SELECT staff.fname, staff.mname, staff.lname, projectreg.pc, projectreg.expno FROM  staff INNER JOIN projectreg  ON (staff.staff_id = projectreg.pin) WHERE projectreg.id='$projectid'";
                        //execute query
                        $result = $db->query($query);
                        //fetch data from query executed above
                        $row = $db->fetch_assoc($result);
                        //call function show_form() with message to user
                        show_form("", "");

                        $_SESSION['msg'] = '<script type="text/javascript">' . "$.jGrowl('They are no customized columns from this Experiment :(" . $row["pc"] . "-" . $row["expno"] . ")', { life: 12000, theme: 'growl-error', header: 'Error!' });" . '</script>';

                        echo $_SESSION['msg'];
                        unset($_SESSION['msg']);

                        show_formdown();
                        exit();
                     }
                  } //detect if logic above have got some error or some one cheat from it
                  elseif ($result != TRUE) {
                     //call function show_form() with message to user
                     show_form(2, "The information provided is not correct reason \"" . $db->mysqlierror() . " \"");
                     show_formdown();
                     exit();
                  }
               }

               if (isset($_POST["submit"])) {

                  $submitted = 'submitted_via_web';

                  insertdata($_SESSION['expcode'], $_POST['site_id'], $staff_id, $submitted);
               } else {
                  show_form("", "");
                  show_formdown();
               }
               function show_formdown()
               {
               ?>
                  <!-- InstanceEndEditable -->
            </div>


         </div>
      </div>


   </div>
</div>


<?php include_once('layouts/foot.php'); ?>


<?php
               }
?>