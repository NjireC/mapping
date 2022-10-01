<?php

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018).
 **/
require_once 'includes/load.php';
$page_title = 'Experimental Design | MosquitoDB';
page_require_level(3);
include_once 'layouts/head.php';

$formtype = 'ED1';
$table   = 'custed';

//Show error occur during posting of data
function show_report($recorded, $skip, $errors)
{
   echocsverror('<font color="green"><span class="has-padding">-->Rows Successfully recorded :<b>' . $recorded . '</b></span></font>');
   echocsverror('<font color="red"><span class="has-padding">-->Rows Skipped :<b>' . $skip . '</b></span></font>');
   echocsverror('<span class="has-padding">-->These rows are: </span>');

   foreach ($errors as $error) {
      //call function echocsv() to display those error
      echocsverror($error);
   }
   //exit();

   echo '
        <div class="btn-group pull-right">
        <input class="btn custom-btn btn-primary" type="button" value="Back" onclick="return goback();"/>
        </div>
        ';
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

            <?php include_once 'scripts/selectproject.php'; ?>

         </div>
      </div>
   </div>

   <div class="panel panel-default">
      <div class="panel-heading">
         <h6 class="panel-title">Experimental Design</h6>

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
                  global $HTTP_POST_VARS, $print_again, $error, $db; ?>

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
                                 <button id="upload" type="button" class="btn custom-btn btn-info"><span><i class="fa fa-upload"></i> Upload File</span>
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
                  //  createtableed1($projectid);
                  //call function to show form
                  //show_form("", "");
                  //Prepare file
                  global $db;

                  $formtype = 'ED1';
                  $table   = 'custed';

                  $prefixtable = $projectid . '_';

                  $ed1 = $prefixtable . 'ed1';
                  $edss = $prefixtable . 'edss';

                  echo '<div class="text-center">';

                  echo '<span class="has-padding"> <h4><u>Summary of Upload Report</u> </h4><span><br />';

                  echo '</div>';

                  echo '<span class="has-padding"> -->Preparing file <span><br />';
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
                        $projectregsite = $row['id'];
                     } //check number if is equal to zero then insert those values to table projectregsite after that pull out id
                     elseif ($num_row == 0) {
                        //create query to insert data in projectregsite
                        $query_2 = "INSERT INTO projectregsite (site_id, projectreg_id) VALUES ('$siteid','$projectid')";
                        //execute query to insert data into projectregsite Entity
                        $result = $db->query($query_2);
                        //check if query execute successfull
                        if ($result == TRUE) {
                           //query to databese using query_1
                           $result = $db->query($query_1);
                           //count number of row return
                           $row = $db->fetch_assoc($result);
                           //Link found
                           //echo "Link found  <br />";
                           //hold this value from result above in session
                           $projectregsite = $row['id'];
                        }
                     }
                     //check if variable $projectregsite is greater than zero
                     if ($projectregsite > 0) {
                        //check if customize form for ED1 is available in the system
                        //create query
                        $query = "SELECT custed.num_split, custed.p_attri  FROM $table WHERE custed.pc='$projectid' AND  custed.ft='$formtype'";
                        //execute query
                        $result = $db->query($query);
                        //detect number of row from query execute above
                        $num_row = $db->num_rows($result);
                        if ($num_row == 1) {
                           //fetch data from query executed above
                           $row = $db->fetch_assoc($result);
                           //assign value to valiable
                           $umbersplit      = $row['num_split'];
                           $patternattribute = $row['p_attri'];

                           $_SESSION['P_ATTRI_ED1'] = $patternattribute;

                           $uploaddir  = './upload_temp/';
                           $user       = $_SESSION['user_id'];
                           $projectcode = $_SESSION['projectcode'] . '/';
                           $uploaddir  = $uploaddir . $projectcode;
                           $target_path = $uploaddir . '' . $user . '.csv';

                           //file open in read mode
                           $file = @fopen($target_path, 'r');
                           //check if file is open
                           if (!$file) {
                              //call function show_form() with message to user
                              show_form(2, 'Error opening file uploaded file');
                              show_formdown();
                              exit();
                           }
                           //Opening file
                           echo '<span class="has-padding"> --> File opened  <span><br />';

                           //check file size
                           $size = filesize($target_path);
                           //check if file in not empty
                           if (!$size) {
                              //call function show_form() with message to user
                              show_form(2, 'File is empty');
                              show_formdown();
                              exit();
                           }
                           //file size
                           // echo "File size is $size  <br />";
                           //hold file content
                           //read content of file and store in filecontent

                           $csv = explode("\n", file_get_contents($target_path));

                           $arraycsv1 = explode(',', $csv[1]);
                           //echo $arraycsv1[1];
                           $arraypattern = explode(',', $patternattribute);
                           //echo count($arraypattern);

                           //read file contents
                           echo '<span class="has-padding"> -->Start of reading file  <span> <br />';

                           fclose($file);
                           //delete file upload
                           @unlink($target_path);
                           //hold number of line from cvs
                           $numberline = 1;
                           //hold array from line array after split it
                           $linearray = [];

                           $recorded = 0;
                           //for recorded skipped rows which didn't inserted into database
                           $skip = 0;

                           if (count($arraycsv1) == count($arraypattern)) {
                              foreach ($csv as $key => $line) {
                                 //trim tab in field
                                 //remove tab in field
                                 $line = trim($line, " \t");
                                 //Replace all occurrences of  \r in haystack with "".
                                 $line = str_replace("\r", '', $line);
                                 //call function rowIdentifier
                                 list($rowtype, $data) = rowIdentifier($line, 'ed1', $patternattribute);
                                 // echo $line."<br />";
                                 //start to detect which type of row
                                 //row contain serial number of ED
                                 if ($rowtype == 1) {
                                 } //row contain heading of columns
                                 elseif ($rowtype == 2) {
                                    //message to user
                                    //echo "Row number:".$numberline." Headers of columns<br />";
                                    //allow data to be inserted into database
                                    $pass = 1;
                                 } //row contain rowdata (dataset)
                                 elseif ($rowtype == 3/* && $pass ==1*/) {
                                    /************************************
                                     * This line escapes the special character.
                                     * remove it if entries are already escaped
                                     * in the csv file
                                     ************************************/
                                    $line = str_replace(',', "','", $line);
                                    /*************************************/

                                    //split array $line into $_session["num_split"]   pieces
                                    //$linearray = split(",", $line, $_SESSION["num_split"]);
                                    $linearray = explode(',', $line, $umbersplit);
                                    //combine array $linearray to one variable
                                    //$linearray=implode(',', $linearray);
                                    $linearray = "'" . implode(", ", $linearray) . "'";
                                    //message to user
                                    //echo "Row number:".$numberline." Prepare information.....";
                                    //prepare query for insertion of data into system


                                    $query = "INSERT INTO $ed1 (projectregsite_id, $patternattribute,userid,submitted) VALUES($projectregsite,$linearray,$staff_id,'$submitted')";
                                    //echo $query . "<br />";
                                    //execute query
                                    $result = $db->mysqliquery($query);
                                    //successful of query
                                    if ($result == TRUE) {
                                       //display message to user
                                       // echo "<font color=\"green\"> Successfull save </font> <br />";
                                       //Increment row recorded
                                       $recorded++;
                                    } elseif ($result == FALSE) {
                                       //display message to user
                                       $errors[] = '<span class="has-padding"><font color="red"> -->Row number:' . $numberline . " Failed to save details. Reason '" . $db->mysqlierror() . "'</font></span> ";
                                       //Increment row skipped
                                       $skip++;
                                    }
                                 } //row contain empty first column
                                 elseif ($rowtype == 4) {
                                    //message to user
                                    $errors[] = '<span class="has-padding"> -->Row number:' . $numberline . ' column is empty</span>';
                                 } //row contain show end of form
                                 elseif ($rowtype == 5) {
                                    //message to user
                                    $errors[] = '<span class="has-padding"> --> Row number:' . $numberline . ' end of file</span>';
                                    //disallow data to be inserted into database
                                    $pass = 2;
                                 }

                                 //increment number line
                                 $numberline++;
                              } //end of foreach function

                              //create query for insertion of data to EdSs Table which link to Ss table
                              $query_insert_edss = "INSERT INTO $edss (ed1id)
                                                      SELECT `ed1`.`id`
                                                      FROM $edss as edss
                                                      RIGHT JOIN $ed1 as ed1
                                                      ON (`edss`.`ed1id` = `ed1`.`id`)
                                                      WHERE edss.ed1id IS NULL";
                              //execute query to insert into EdSs table from Ed1 Table
                              //echo $query_insert_edss;

                              $result = $db->query(strtolower($query_insert_edss));

                              //check if query execute correct
                              if ($result == TRUE) {
                                 show_report($recorded, $skip, $errors);

                                 //echo "<h5><span class=\"has-padding\"> --><font color=\"green\">Rows Successfully Recorded: <b>$recorded</b></font> ; <font color=\"red\">Failed: <b>$skip </b> </span></font></h5>";
                                 show_formdown();
                              }
                              //if query execute wrong show message to user
                              if ($result != TRUE) {
                                 //call function show_form() with message to user
                                 echo "<p id=\"grantaccess\">Query is not successfully executed '" . $db->mysqlierror() . "' </p>";
                                 show_form(2, 'Information unsuccessfuly saved to edss Table reason" ' . $db->mysqlierror() . '  "');
                                 show_formdown();
                                 exit();
                              }

                              exit();
                           } //endifcolumnnotmatch

                           else {
                              //read file contents
                              echo '<span class="has-padding"> <font color="red"> <h3> ** Fields dont much with template ** </h3></font><span> <br />';

                              echo '<div class="btn-group pull-right">
                                      <input class="btn custom-btn btn-primary" type="button" value="Back" onclick="return goback();"/>
                                      </div>';

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
                           show_form(3, 'They are no columns customized from this project (' . $row['pc'] . $row['expno'] . ') please see ' . $row['fname'] . ' ' . $row['mname'] . ' ' . $row['lname']);
                           show_formdown();

                           exit();
                        }
                     }
                  } //detect if logic above have got some error or some one cheat from it
                  elseif ($result != TRUE) {
                     //call function show_form() with message to user
                     show_form(2, 'Information provided is not correct reason "' . mysqli_error($db) . ' "');
                     show_formdown();
                     exit();
                  }
               }

               if (isset($_POST['submit'])) {

                  $submitted = 'submitted_via_web';
                  insertdata($_SESSION['expcode'], $_POST['site_id'], $staff_id, $submitted);
               } else {
                  show_form('', '');
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


<?php
               }
?>

<?php include_once 'layouts/foot.php'; ?>