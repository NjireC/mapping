<?php

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
 **/


$errors = array();

global $HTTP_POST_VARS, $error, $print_again;

function real_escape($str)
{
  global $con;
  $escape = mysqli_real_escape_string($con, $str);
  return $escape;
}

function remove_junk($str)
{
  $str = nl2br($str);
  $str = htmlspecialchars(strip_tags($str, ENT_QUOTES));
  return $str;
}

function first_character($str)
{
  $val = str_replace('-', " ", $str);
  $val = ucfirst($val);
  return $val;
}

function validate_fields($var)
{
  global $errors;
  foreach ($var as $field) {
    $val = remove_junk($_POST[$field]);
    if (isset($val) && $val == '') {
      $errors = $field . " cant be blank.";
      return $errors;
    }
  }
}

function validate_password($var1, $var2)
{
  global $errors;

  if ($var1 != $var2) {
    $errors = "Password does not match";
    return $errors;
  }
}


function get_theme($i)
{

  $theme = "";

  switch ($i) {
    case 1:
      $theme = "";
      break;
    case 2:
      $theme = "aqu_";
      break;
    case 3:
      $theme = "bla_";
      break;
    case 4:
      $theme = "blu_";
      break;
    default:
      $theme = "";
  }

  return $theme;
}


function display_msg($msg = '')
{
  $output = array();
  if (!empty($msg)) {
    foreach ($msg as $key => $value) {
      $output  = "<div class=\"alert alert-{$key}\">";
      $output .= "<a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a>";
      $output .= remove_junk(first_character($value));
      $output .= "</div>";
    }
    return $output;
  } else {
    return "";
  }
}

function display_msg_popup($msg = '')
{
  $output = array();

  if (!empty($msg)) {
    foreach ($msg as $key => $value) {
      $tit = first_character($key);
      $value2 = first_character($value);
      $output  = '<script type="text/javascript">';
      $output .= "$.jGrowl('{$value2}', { life: 4000, theme: 'growl-{$key}', header: '{$tit}' });";
      $output .= '</script>';
    }
    return $output;
  } else {
    return "";
  }
}


function redirect($url, $permanent = false)
{
  if (headers_sent() === false) {
    header('Location: ' . $url, true, ($permanent === true) ? 301 : 302);
  }

  exit();
}

function read_date($str)
{
  if ($str)
    return date('F j, Y, g:i:s a', strtotime($str));
  else
    return null;
}

function make_date()
{
  return strftime("%Y-%m-%d %H:%M:%S", time());
}

function count_id()
{
  static $count = 1;
  return $count++;
}

function randString($length = 5)
{
  $str = '';
  $cha = "0123456789abcdefghijklmnopqrstuvwxyz";

  for ($x = 0; $x < $length; $x++)
    $str .= $cha[mt_rand(0, strlen($cha))];
  return $str;
}

function hashPass($pass)
{

  return password_hash($pass, PASSWORD_DEFAULT);
}

function getlongword($string)
{

  $words = explode(" ", $string);

  $longestwordlen = 0;
  $longestword = '';

  foreach ($words as $word) {
    if (strlen($word) > $longestwordlen) {
      $longestwordlen = strlen($word);
      $longestword = $word;
    }
  }

  $longestword2 =  "<i>" . $longestword . "</i>";

  return $longestword2;
}


function getsdate($date)
{
  $date2 = explode('-', $date);

  if (count($date2) > 1) {
    return $date2[0];
  } else {
    return $date;
  }
}

function getedate($date)
{
  $date2 = explode('-', $date);

  if (count($date2) > 1) {
    return $date2[1];
  } else {
    return $date;
  }
}

function encrypt($string, $key)
{
  $result = "";

  for ($i = 0; $i < strlen($string); $i++) {

    $char = substr($string, $i, 1);

    $keychar = substr($key, ($i % strlen($key)) - 1, 1);

    $char = chr(ord($char) + ord($keychar));

    $result .= $char;
  }

  $salt_string = "ABCDEFGHIJKLMNOPQRSTUVWXYSabcdefghijklmnopqrstuvwxys012456789";

  $length = rand(1, 15);

  $salt = "";

  for ($i = 0; $i <= $length; $i++) {

    $salt .= substr($salt_string, rand(0, strlen($salt_string)), 1);
  }

  $salt_length = strlen($salt);

  $end_length = strlen(strval($salt_length));

  return base64_encode($result . $salt . $salt_length . $end_length);
}

function decrypt($string, $key)
{

  $result = "";

  $string = base64_decode($string);

  $end_length = intval(substr($string, -1, 1));

  $string = substr($string, 0, -1);

  $salt_length = intval(substr($string, $end_length * -1, $end_length));

  $string = substr($string, 0, $end_length * -1 + $salt_length * -1);

  for ($i = 0; $i < strlen($string); $i++) {

    $char = substr($string, $i, 1);

    $keychar = substr($key, ($i % strlen($key)) - 1, 1);

    $char = chr(ord($char) - ord($keychar));

    $result .= $char;
  }

  return $result;
}

function readmorefunction($text, $targetFile, $id)
{

  $limit = 60;

  if (str_word_count($text, 0) > $limit) {

    $words = str_word_count($text, 2);

    $pos = array_keys($words);

    $text = substr($text, 0, $pos[$limit]) . '...' . " <a href='$targetFile?id=$id'>Read More</a>";
  }

  return $text;
}



function readmorelink($targetFile, $id)
{

  $text = "$targetFile?id=$id";

  return $text;
}

function getcolumnnametable($columns)
{

  $columns2 = explode(',', $columns);

  $arrcol = array();

  foreach ($columns2 as $item) {

    $arrcol[] = '{"field":"' . $item . '","searchable":true,"sortable":false,"title":"' . strtoupper($item) . '","visible":true}' . "\n";
  }

  $strcol = implode(",", $arrcol);

  return $strcol;
}

function getfieldname($columns2)
{

  $arrcol = array();

  foreach ($columns2 as $item) {

    $arrcol[] = '{label:"' . $item . '",lineTension: 0.1,backgroundColor:randomColor(),borderColor:randomColor(),pointRadius:3,pointHoverRadius:4,fill:false,data:' . $item . '}' . "\n";
  }

  $strcol = implode(",", $arrcol);

  return $strcol;
}


function getcolumnnametable2($column1, $column2)
{

  array_unshift($column1, "id");
  array_unshift($column2, "ID");

  $arrcol = array();

  foreach (array_combine($column1, $column2) as $column1field => $column2field) {

    $arrcol[] = '{"field":"' . $column1field . '","searchable":true,"sortable":false,"title":"' . $column2field . '","visible":true}' . "\n";
  }

  $strcol = implode(",", $arrcol);

  return $strcol;
}

function getcolumnnametable3($column1, $column2)
{

  array_unshift($column1, "id");
  array_unshift($column2, "ID");

  $arrcol = array();

  foreach (array_combine($column1, $column2) as $column1field => $column2field) {

    $arrcol[] = '<th data-field="' . $column1field . '">' . $column2field . '</th>' . "\n";
  }

  $strcol = implode(" ", $arrcol);

  return $strcol;
}



function renamecolumn($edcol, $tablename)
{

  $tablename = $tablename . '.';

  $columns = explode(',', $edcol);

  $new = array();

  foreach ($columns as $item) {

    $new[] = $tablename . $item;
  }


  $str = implode(",", $new);

  return $str;
}


//function to colour text if fieldtext is not valid;
function highlighter($error, $field)
{ //function to highlighter textfield ;
  //declare global variable
  global $HTTP_POST_VARS, $error, $print_again;
  if ($error[$field]) {
    print("style=\"color: red; \"");
  } else {
    print("");
  }
} //end function to highighter textfield;

//function to colour text if fieldtext is not valid;
function highlighter2($error, $field)
{ //function to highlighter textfield ;
  //declare global variable
  global $HTTP_POST_VARS, $error, $print_again;
  if ($error[$field]) {
    print("style=\"border-color: red; \"");
  } else {
    print("");
  }
} //end function to highighter textfield;

//check if textfield is valid from the form;
function check_form()
{ //start of check_form function;
  //declare global variable
  global $HTTP_POST_VARS, $error, $print_again;
  //check if any data is not valid;
  if ($print_again == 1) {
    //call function to show_form and display message;
    show_form(1, "Please fill the fields with red colour");
  }
} //end function to check_form;

//function to clear textfield
function clear_textfield($names)
{ //start function clear_textfield;
  //clear all field if value is valid;  
  $cleartextfield =  array();
  $cleartextfield = explode(";", $names);
  foreach ($cleartextfield as $line) {
    $_POST[$line] = "";
  }
} //end of function clear_textfield; 

//function to validate interger
function val_int($name)
{ //start function val_integer;
  global $HTTP_POST_VARS, $print_again, $error;
  if (!filter_var($_POST[$name], FILTER_VALIDATE_INT)) {
    //mark textfield if is not valid data 
    $error[$name] = true;
    //activate form to be note submited in database
    $print_again = true;
  }
} //end of function val_string;

//function to validate float
function val_float($name)
{ //start tofunction  val_string
  global $HTTP_POST_VARS, $print_again, $error;
  //check if variable enter is collect
  if (is_float($_POST[$name]) == false) {
    //mark the field which is not valid
    $error[$val_name] = true;
    //activate form to be note submited in database 
    $print_again = true;
  }
} //end of function val_string

//function to check empty field
function emptyfield($name)
{ //start function emptyfield;
  global $HTTP_POST_VARS, $print_again, $error;
  if ($_POST[$name] == "") {
    //mark textfield if is not valid data 
    $error[$name] = true;
    //activate form to be note submited in database
    $print_again = true;
  }
} //end of function emptyfield;


function isUserExisted($email)
{

  global $db;

  $result = mysqli_query($db, "SELECT email from staff WHERE email = '$email'");
  $no_of_rows = mysqli_num_rows($result);
  if ($no_of_rows > 0) {
    // user existed 
    return true;
  } else {
    // user not existed
    return false;
  }
}


function projectname($id)
{

  global $db;

  $querypn = $db->query("SELECT CONCAT(projectreg.pc,\"_\",projectreg.expno) AS Project_Code 
    FROM projectreg WHERE id=$id");

  $rowpn = $db->fetch_assoc($querypn);

  $p = $rowpn['Project_Code'];

  return $p;
}


function labelvalue($table, $field, $id)
{

  global $db;

  $query = $db->query("select $field from {$db->escape($table)} where number ='$id'");

  $row = $db->fetch_assoc($query);

  $p = $row[$field];

  if ($p != null) {
    return $p;
  } else {
    return $id;
  }
}


function inout($id)
{

  if ($id == 1) {
    return "IN";
  } elseif ($id == 2) {
    return "OUT";
  } else {
    return $id;
  }
}



function sendMail($email, $message, $subject)
{

  require_once('phpmailer/PHPMailerAutoload.php');


  //Create a new PHPMailer instance
  $mail = new PHPMailer;

  $mail->SMTPOptions = array(
    'ssl' => array(
      'verify_peer' => false,
      'verify_peer_name' => false,
      'allow_self_signed' => true
    )
  );

  //Tell PHPMailer to use SMTP
  $mail->isSMTP();

  //Enable SMTP debugging
  // 0 = off (for production use)
  // 1 = client messages
  // 2 = client and server messages
  $mail->SMTPDebug = 0;

  //Ask for HTML-friendly debug output
  $mail->Debugoutput = 'html';

  //Set the hostname of the mail server
  //$mail->Host = 'smtp.gmail.com';
  // $mail->Host = gethostbyname("smtp.gmail.com");
  // use
  $mail->Host = gethostbyname('smtp.gmail.com');
  // if your network does not support SMTP over IPv6

  //Set the SMTP port number - 587 for authenticated TLS, a.k.a. RFC4409 SMTP submission
  $mail->Port = 587;

  //Set the encryption system to use - ssl (deprecated) or tls
  $mail->SMTPSecure = 'tls';

  //Whether to use SMTP authentication
  $mail->SMTPAuth = true;

  //Username to use for SMTP authentication - use full email address for gmail
  $mail->Username = "mosquitodb.io@gmail.com";

  //Password to use for SMTP authentication
  $mail->Password = "ifakara15.io";

  //Set who the message is to be sent from
  $mail->setFrom('mosquitodb.io@gmail.com', 'MosquitoDB Notification');

  //Set an alternative reply-to address
  // $mail->addReplyTo('', '');

  //Set who the message is to be sent to
  $mail->addAddress($email);

  //Set the subject line
  $mail->Subject = $subject;

  //$mail->AddCC('dmsaky@ihi.or.tz');

  //Read an HTML message body from an external file, convert referenced images to embedded,
  //convert HTML into a basic plain-text alternative body
  $mail->msgHTML($message);

  //Replace the plain text body with one created manually
  //$mail->AltBody = 'This is a plain-text message body';

  //Attach an image file
  ///$mail->addAttachment('images/phpmailer_mini.png');

  //send the message, check for errors
  if (!$mail->send()) {
    //echo "Mailer Error: " . $mail->ErrorInfo;
  } else {
    //echo "Message sent!";
  }
}



function createtables($prefix)
{

  global $db;

  $prefix = $prefix . "_";
  //  ED1 table
  $sql = "CREATE TABLE IF NOT EXISTS " . $prefix . "ed1 (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment links to SS',
  `projectregsite_id` int(11) NOT NULL COMMENT 'Store value from table projectregsite id',
  `sen` int(6) NOT NULL COMMENT 'unique identifier for ED1 form',
  `fr` int(2) NOT NULL COMMENT 'unique identifier of each row on the data collected',
  `dt` date NOT NULL COMMENT 'date of collection (morning on which the mosquitoes were collected)',
  `re`  varchar(100) DEFAULT '0' COMMENT 'Region (Define specific Region in the Country)',
  `di`  varchar(100) DEFAULT '0' COMMENT 'District (Define specific District in a Region )',
  `sec`  varchar(100) DEFAULT '0' COMMENT 'Sector/Council (Define specific Sector in the District)',
  `cew`  varchar(100) DEFAULT '0' COMMENT 'Cell/Ward (Define specific Cell/ in the Sector)',
  `vis`  varchar(100) DEFAULT '0' COMMENT 'Village/Street (Define specific Village/Street in the Cell/Ward)',
  `ea` varchar(100) DEFAULT '0' COMMENT 'Enumaration area (Define geographic location within the study site)',
  `cr` varchar(30) DEFAULT 'NA' COMMENT 'Cluster (The smallest geographic statistical unit within enumaration area)',
  `cp` varchar(30) DEFAULT 'NA' COMMENT 'Compound or Plot (A specific physical area within an identifiable owner)',
  `tcu` varchar(30) DEFAULT 'NA' COMMENT 'Hold Ten Cell Unit',
  `hh` varchar(100) DEFAULT '0' COMMENT 'Household (A person or group of people who live together in the same dwelling unit)',
  `nah` varchar(100) DEFAULT '0' COMMENT 'Animals in Household (An animal or group of animals who live together with people in same dwelling unit)',
  `sid` varchar(30) DEFAULT 'NA' COMMENT 'Structure ID (A free standing building that can have one or more room for residential or commercial use)',
  `me` int(3) NOT NULL DEFAULT '-99' COMMENT 'Method (The method by which the mosquitoes were collected or trapped)',
  `ind` int(1) NOT NULL COMMENT 'hold collection was made indoors a house or hut',
  `ht` int(3) DEFAULT NULL COMMENT 'Habitat Type (Classification of the aquatic habitat in which the collection was made)',
  `st` varchar(6) COMMENT 'Start Time (The time that the collection started in 24 time )',
  `ft` varchar(6) COMMENT 'Finish Time (The time that the collection finish in 24 time)',
  `hp` varchar(30) DEFAULT 'NA' COMMENT 'Hold Period (The period of time for which the mosquitoes were held for survival analysis after they were collected)',
  `rnd` varchar(30) DEFAULT 'NA' COMMENT 'Round (One cycle or rotation of the treatment )',
  `blk` varchar(30) DEFAULT 'NA' COMMENT 'Block (A set of position through which treatments are rotated in a Latin)',
  `shh` varchar(200) DEFAULT '-99' COMMENT 'A project specific house or experiment hut',
  `stn` varchar(30) DEFAULT 'NA' COMMENT 'A project specific where station where a trap may be positioned',
  `vi` varchar(25) DEFAULT NULL COMMENT 'Initial of a person that caught the mosquitoes',
  `vig` varchar(25) DEFAULT NULL COMMENT 'Gender of a person that caught the mosquitoes',
  `tr` varchar(50) DEFAULT NULL COMMENT 'Treatment (Coding for the unique experimental treatment)',
  `dy` varchar(30) DEFAULT 'NA' COMMENT 'Experiment Day (The consecutive nth day since the experiment commenced)',
  `tmp` varchar(15) DEFAULT NULL COMMENT 'Temperature',
  `hmd` varchar(15) DEFAULT NULL COMMENT 'Humidity',
  `ws` varchar(15) DEFAULT NULL COMMENT 'wind speed',
  `hs` varchar(30) DEFAULT 'NA' COMMENT 'Number of household sampled',
  `vc` int(1) NULL DEFAULT '2' COMMENT 'Legitimacy of the collection',
  `notes` text COMMENT 'On site observation about the collection',
  `gps` text COMMENT 'Site geolocation',
  `dsen` int(6) NOT NULL COMMENT 'Destination form serial number',
  `livestock` varchar(30) DEFAULT 'NA',
  `hoccupant` varchar(30) DEFAULT 'NA',
  `heaves` varchar(30) DEFAULT 'NA',
  `nss` varchar(30) DEFAULT 'NA',
  `nbh` varchar(30) DEFAULT 'NA',
  `oth` varchar(30) DEFAULT 'NA',
  `sn` varchar(30) DEFAULT 'NA' COMMENT 'Season',
  `wtc` varchar(30) DEFAULT '-99' COMMENT 'Weather Conditions',
  `agrt` varchar(30) DEFAULT 'NA' COMMENT 'Agriculture',
  `invn` varchar(30) DEFAULT 'NA' COMMENT 'Intervention',
  `lvk` varchar(30) DEFAULT 'NA' COMMENT 'Livestock',
  `rfe` varchar(30) DEFAULT 'NA' COMMENT 'Roof type',
  `wle` varchar(30) DEFAULT 'NA' COMMENT 'Wall type',
  `evs` varchar(30) DEFAULT 'NA' COMMENT 'Eaves',
  `bv` varchar(30) DEFAULT 'NA' COMMENT 'Block ventilation',
  `bvs` varchar(30) DEFAULT 'NA' COMMENT 'Block ventilation screening',
  `wsn` varchar(30) DEFAULT 'NA' COMMENT 'Window screening',
  `wsnc` varchar(30) DEFAULT 'NA' COMMENT 'Window screening Condition',
  `ckl` varchar(30) DEFAULT 'NA' COMMENT 'Cooking location',
  `cke` varchar(30) DEFAULT 'NA' COMMENT 'Cooking Energy source',
  `sp` varchar(30) DEFAULT 'NA' COMMENT 'Sprayed',
  `lsd` varchar(30) DEFAULT 'NA' COMMENT 'Last spray date',
  `ise` varchar(30) DEFAULT 'NA' COMMENT 'Insectside',
  `userid` varchar(100) NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp default now(),  
  `updated_at` timestamp default now(),
      PRIMARY KEY (`projectregsite_id`,`userid`,`sen`,`fr`),
      UNIQUE KEY `id` (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ; ";


  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "edss (
      `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment links to EDSS',
      `ed1id` int(11) DEFAULT NULL COMMENT 'Hold data which is coming from Ed1',
      `ed2id` int(11) DEFAULT NULL COMMENT 'Hold data which is coming from  Ed2',
      PRIMARY KEY (`id`),
      KEY `fk_edss_ed1id` (`ed1id`),
      KEY `fk_edss_ed2id` (`ed2id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;";


  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "audit_trail (
      `auditid` int(11) NOT NULL AUTO_INCREMENT,
      `auditsen` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
      `auditfr` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
      `auditformtype` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
      `audituser` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
      `auditdate` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
      `auditaction` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
      `auditdetail` varchar(350) COLLATE utf8mb4_unicode_ci NOT NULL,
      PRIMARY KEY (`auditid`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";


  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "ssso (
      `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
      `ss1id` int(11) DEFAULT NULL COMMENT 'Hold data link to SS1',
      `ss2id` int(11) DEFAULT NULL COMMENT 'Hold data link to SS2',
      `ss3id` int(11) DEFAULT NULL COMMENT 'Hold data link to SS3',
      `ss4id` int(11) DEFAULT NULL COMMENT 'Hold data link to SS4',
       PRIMARY KEY (`id`),
       KEY `fk_ss1id` (`ss1id`),
       KEY `fk_ss2id` (`ss2id`),
       KEY `fk_ss3id` (`ss3id`),
       KEY `fk_ss4id` (`ss4id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;";


  $sql .= " CREATE TABLE IF NOT EXISTS " . $prefix . "ed2 (
      `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment links to SS',
      `projectregsite_id` int(11) NOT NULL COMMENT 'Store value from table projectregsite id (Foreign Key)',
      `sen` int(6) NOT NULL COMMENT 'unique identifier for ED2 form',
      `fr` int(2) NOT NULL COMMENT 'unique identifier of each row on the data collected',
      `ssen` int(10) DEFAULT '-99',
      `sfr` int(4) DEFAULT '-99',
      `slc` varchar(30) DEFAULT '-99',
      `sbp` int(8) DEFAULT '-99',
      `sst` int(8) DEFAULT '-99',
      `ssid` int(8) DEFAULT '-99',
      `scc` varchar(30) DEFAULT '-99',
      `stx` int(3) DEFAULT '-99' COMMENT 'Store taxon code foreign key from Taxon table',
      `ssas` int(3) DEFAULT '-99' COMMENT 'Store sex code foreign key from SexAbdominal table',
      `ag` int(2) DEFAULT '-99',
      `n` int(10) NOT NULL COMMENT 'Store number of mosqutoes caught',
      `sd` date NULL COMMENT 'started date of the experiment',
      `st` varchar(6) DEFAULT '-99' COMMENT 'started time of the experiment',
      `tr` varchar(50) DEFAULT '-99' COMMENT 'Treatment (Coding for the unique experimental treatment)',
      `vi` varchar(25) DEFAULT 'NA' COMMENT 'Initial of person that caught the mosquitoes',
      `rnd` int(3) DEFAULT '-99' COMMENT 'Round (One cycle or rotation of the treatment )',
      `dy` int(3) DEFAULT '-99' COMMENT 'Experiment Day (The consecutive nth day since the experiment commenced)',
      `oth1` varchar(50) DEFAULT '-99' COMMENT 'Other Any additional experimental details',
      `oth2` varchar(50) DEFAULT '-99' COMMENT 'Pther Any additional experimental details',
      `oth3` varchar(50) DEFAULT '-99' COMMENT 'Pther Any additional experimental details',
      `va` int(1) NULL COMMENT 'Valid Assay Legitimacy of the experimental assay',
      `notes` text COMMENT 'On site observation about the collection',
      `dsen` int(6) NOT NULL COMMENT 'Destination form serial number',
      `userid` varchar(100) NOT NULL COMMENT 'Submitted by userid',
      `submitted` varchar(100) DEFAULT NULL COMMENT 'Channel used to submit',
      `created_at` timestamp default now(), 
      `updated_at` timestamp default now(),
      PRIMARY KEY (`projectregsite_id`,`userid`,`sen`,`fr`),
      UNIQUE KEY `id` (`id`)

      ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci; ";




  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "so1 (
      `id_` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment',
      `sssoid` int(11) NOT NULL,
      `sen` int(11) NOT NULL,
      `ssen` int(11) NOT NULL,
      `sfr` int(11) NOT NULL,
      `fr` int(11) NOT NULL,
      `rc` char(2) DEFAULT NULL,
      `sbf` int(11) DEFAULT NULL,
      `sslc` varchar(30) DEFAULT NULL,
      `sst` int(11) DEFAULT NULL,
      `ssid` int(11) NOT NULL,
      `stx` int(11) DEFAULT NULL,
      `species` varchar(11) DEFAULT 'NRQ',
      `kdr` varchar(11) DEFAULT 'NRQ',
      `pf` varchar(11) DEFAULT 'NRQ',
      `pv` varchar(11) DEFAULT 'NRQ',
      `po` varchar(11) DEFAULT 'NRQ',
      `pm` varchar(11) DEFAULT 'NRQ',
      `human` varchar(11) DEFAULT 'NRQ',
      `chicken` varchar(11) DEFAULT 'NRQ',
      `goat` varchar(11) DEFAULT 'NRQ',
      `bovine` varchar(11) DEFAULT 'NRQ',
      `dog` varchar(11) DEFAULT 'NRQ',
      `cat` varchar(11) DEFAULT 'NRQ',
      `rat` varchar(11) DEFAULT 'NRQ',
      `bps` varchar(11) DEFAULT 'NRQ',
      `userid` varchar(100) NOT NULL COMMENT 'Submitted by userid',
      `submitted` varchar(100) DEFAULT NULL COMMENT 'Channel used to submit',
      `created_at` timestamp default now(), 
      `updated_at` timestamp default now(),
      PRIMARY KEY (`sssoid`,`ssen`,`sfr`,`ssid`,`userid`),
      UNIQUE KEY `id_` (`id_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";

  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "so2 (
      `id_` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment',
      `sssoid` int(11) NOT NULL,
      `sen` int(11) NOT NULL,
      `ssen` int(11) NOT NULL,
      `sfr` int(11) NOT NULL,
      `fr` int(11) NOT NULL,
      `sbf` int(11) DEFAULT NULL,
      `sslc` varchar(30) DEFAULT NULL,
      `sst` int(11) DEFAULT NULL,
      `ssid` int(11) NOT NULL,
      `stx` int(11) DEFAULT NULL,
      `ssas` int(11) DEFAULT NULL,
      `ms` varchar(11) DEFAULT 'NRQ',
      `pr` varchar(11) DEFAULT 'NRQ',
      `inf` varchar(11) DEFAULT 'NRQ',
      `os` varchar(11) DEFAULT 'NRQ',
      `wl` varchar(11) DEFAULT 'NRQ',
      `bps` varchar(11) DEFAULT 'NRQ',
      `userid` varchar(100) NOT NULL COMMENT 'Submitted by userid',
      `submitted` varchar(100) DEFAULT NULL COMMENT 'Channel used to submit',
      `created_at` timestamp default now(), 
      `updated_at` timestamp default now(),
      PRIMARY KEY (`sssoid`,`ssen`,`sfr`,`ssid`,`userid`),
      UNIQUE KEY `id_` (`id_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";

  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "st1 (
      `id_` int(11) NOT NULL AUTO_INCREMENT,
      `projectregsite_id` int(11) NOT NULL,
      `sen` int(11) NOT NULL,
      `ssen` int(11) NOT NULL,
      `sfr` int(11) NOT NULL,
      `fr` int(11) NOT NULL,
      `rc` int(11) NOT NULL,
      `sbf` int(11) DEFAULT NULL,
      `sslc` varchar(30) DEFAULT NULL,
      `sst` int(11) DEFAULT NULL,
      `ssid` int(11) NOT NULL,
      `stx` int(11) DEFAULT NULL,
      `userid` varchar(100) NOT NULL COMMENT 'Submitted by userid',
      `submitted` varchar(100) DEFAULT NULL COMMENT 'Channel used to submit',
      `created_at` timestamp default now(), 
      `updated_at` timestamp default now(),
      PRIMARY KEY (`sen`,`fr`,`rc`,`ssid`,`userid`),
      UNIQUE KEY `id_` (`id_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";


  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "st2 (
      `id_` int(11) NOT NULL AUTO_INCREMENT,
      `projectregsite_id` int(11) NOT NULL,
      `sen` int(11) NOT NULL,   
      `fr` int(11) NOT NULL,
      `ssen` int(11) NOT NULL,
      `ns` int(11) NOT NULL,
      `fst` int(11) DEFAULT NULL,
      `ff` int(11) NOT NULL,
      `rcn` int(11) NOT NULL,
      `userid` varchar(100) NOT NULL COMMENT 'Submitted by userid',
      `submitted` varchar(100) DEFAULT NULL COMMENT 'Channel used to submit',
      `created_at` timestamp default now(), 
      `updated_at` timestamp default now(),
      PRIMARY KEY (`userid`,`sen`,`fr`),
      UNIQUE KEY `id_` (`id_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";




  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "ss1 (
      `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
      `edssid` int(6) NOT NULL COMMENT 'unique identifier for SS1 form',
      `sen` int(6) NOT NULL COMMENT 'unique identifier for SS1 form',
      `ssen` int(6) NOT NULL COMMENT 'unique identifier for SS1 form',
      `sfr` int(6) NOT NULL COMMENT 'unique identifier for SS1 form',
      `bf` int(3) DEFAULT '1' COMMENT 'body part (The body type of the sample)',
      `fr` int(2) NOT NULL COMMENT 'unique identifier of each row on the data collected',
      `tx` int(3) NOT NULL COMMENT 'taxon identification number',
      `sas` int(3) NOT NULL COMMENT 'sex and abdominal status',
      `n` varchar(15) DEFAULT '-99' COMMENT 'number of observed (Records the total number of mosquitoes observed in each specific subgroup)',
      `notes` varchar(500) DEFAULT 'NA',
      `slc` varchar(30) DEFAULT 'NA',
      `st` varchar(30) DEFAULT 'NA' COMMENT 'sample type (Designates the category of sample as either individual or batch)',
      `ni` varchar(30) DEFAULT 'NA' COMMENT 'no of individual ',
      `nb` varchar(30) DEFAULT 'NA' COMMENT 'no of batched ',
      `sid01` varchar(30) DEFAULT 'NA' COMMENT 'sample type sample identification 1',
      `sid02` varchar(30) DEFAULT 'NA' COMMENT 'sample type sample identification 2',
      `sid03` varchar(30) DEFAULT 'NA' COMMENT 'sample type sample identification 3',
      `sid04` varchar(30) DEFAULT 'NA' COMMENT 'sample type sample identification 4',
      `sid05` varchar(30) DEFAULT 'NA' COMMENT 'sample type sample identification 5',
      `sid06` varchar(30) DEFAULT 'NA' COMMENT 'sample type sample identification 6',
      `sid07` varchar(30) DEFAULT 'NA' COMMENT 'sample type sample identification 7',
      `nd` int(3) DEFAULT NULL COMMENT 'number of discarded (This is the number of mosquitoes discarded)',
      `senfr` int(11) NOT NULL,
      `userid` varchar(100) NOT NULL COMMENT 'Submitted by userid',
      `submitted` varchar(100) DEFAULT NULL COMMENT 'Channel used to submit',
      `created_at` timestamp default now(), 
      `updated_at` timestamp default now(),
       PRIMARY KEY (`edssid`, `userid`,`sen`,`tx`,`sas`),
       UNIQUE KEY `id` (`id`),
       KEY `tx` (`tx`),
       KEY `bf` (`bf`),
       KEY `sas` (`sas`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;";


  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "ss2 (
      `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
      `edssid` int(11) NOT NULL COMMENT 'Store value from table EDSS id',
      `sen` int(6) NOT NULL COMMENT 'unique identifier for SS2 form',
      `ssen` int(6) NOT NULL COMMENT 'unique identifier for SS2 form',
      `sfr` int(6) NOT NULL COMMENT 'unique identifier for SS2form',
      `hf`varchar(30)  NOT NULL  COMMENT 'Hold status of Habitat types ( names)',
      `hbt`varchar(30)  NOT NULL  COMMENT 'Hold status of Habitat types ( names)',
      `htr` varchar(30) NOT NULL COMMENT 'Hold status of Habitat Type treated (1: Yes, 2: No)',
      `hw` varchar(30) NOT NULL  COMMENT 'Hold status of Habitat wet (1: Yes, 2: No)',
      `hs`varchar(30)  NOT NULL  COMMENT 'Hold status Habitat Parameter (1: <10m, 2: 10-100m, 3: >100m)',
      `dnh`varchar(30) NOT NULL  COMMENT 'Hold status of distance next house (measured in steps)',
      `fr` int(2) NOT NULL COMMENT 'unique identifier of each row on the data collected',
      `dip`varchar(30) NOT NULL COMMENT 'number of dipping effort (dio)',
      `tx` int(3) NOT NULL DEFAULT '-99' COMMENT 'taxon identification number',
      `bfEgg`varchar(30) NOT NULL  COMMENT 'larvae stage  (measured in steps)',
      `bfL1`varchar(30)  NOT NULL   COMMENT 'larvae stage 1 (L1)',
      `bfL2`varchar(30) NOT NULL  COMMENT 'larvae stage 2 (L2)',
      `bfL3`varchar(30) NOT NULL   COMMENT 'larvae stage 3 (L3)',
      `bfL4`varchar(30) NOT NULL  COMMENT 'larvae stage 4 (L4)',
      `L1L2`varchar(30) NOT NULL  COMMENT 'larvae stage L1L2 (L1L2)',
      `L3L4`varchar(30)  NOT NULL COMMENT 'larvae stage L3L4 (L3L4)',
      `tlv`varchar(30) NOT NULL  COMMENT 'larvae stage total larvae (tlv)',
      `pu` varchar(30)  NOT NULL   COMMENT 'Hold status of pupae (1: Total)',
      `vl` varchar(30)  NOT NULL  COMMENT 'Hold status of vegitation length(1: Absent, 2: Short grasses, 3: Tall grasses)',
      `rl` varchar(30)  NOT NULL  COMMENT 'Hold status of rice length (1: Absent, 2: Short grasses, 3: Tall grasses)',
      `vt` varchar(30)  NOT NULL  COMMENT 'Hold status of treated (1: Yes, 2: No)',
      `notes` varchar(500) DEFAULT 'No data (-99)' COMMENT 'On site observations about collection ',
      `slc` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Unique label code for each composition of taxon plus sex and abdominal status (Sample Lable Code SLC)',
      `ni` int(4) DEFAULT '0' COMMENT 'no of individual ',
      `nb` int(4) DEFAULT '0' COMMENT 'no of batched ',  
      `sid01` int(2) DEFAULT '0' COMMENT 'sample type sample identification 1',
      `sid02` int(2) DEFAULT '0' COMMENT 'sample type sample identification 2',
      `sid03` int(2) DEFAULT '0' COMMENT 'sample type sample identification 3',
      `sid04` int(2) DEFAULT '0' COMMENT 'sample type sample identification 4',
      `sid05` int(2) DEFAULT '0' COMMENT 'sample type sample identification 5',
      `sid06` int(2) DEFAULT '0' COMMENT 'sample type sample identification 6',
      `sid07` int(2) DEFAULT '0' COMMENT 'sample type sample identification 7',
      `nod` int(3) DEFAULT NULL COMMENT 'number of discarded (This is the number of mosquitoes discarded)',
      `senfr` int(11) NOT NULL,
      `userid` varchar(100) NOT NULL COMMENT 'Submitted by userid',
      `submitted` varchar(100) DEFAULT NULL COMMENT 'Channel used to submit',
      `created_at` timestamp default now(), 
      `updated_at` timestamp default now(),
      PRIMARY KEY (`edssid`,`userid`,`sen`,`fr`),
      UNIQUE KEY `id` (`id`),
      KEY `fk_ss2_tx` (`tx`)
   )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";


  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "ss3 (
       
      `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
      `edssid` int(11) NULL COMMENT 'Store value from table EDSS id',
      `sen` int(6) NOT NULL COMMENT 'unique identifier for ss3 form',
      `ssen` int(6) NOT NULL COMMENT 'unique identifier for ss3 form',
      `sfr` int(6) NOT NULL COMMENT 'unique identifier for ss3 form',
      `fr` int(2) NOT NULL COMMENT 'unique identifier of each row on the data collected',
      `dot` date NOT NULL COMMENT 'date of test',
      `ga` varchar(20) NULL COMMENT 'gps accuracy',
      `gds` varchar(20) NULL COMMENT 'gps data source',
      `sgds` varchar(100) NULL COMMENT 'specify gps data source',
      `ndis` int(20) NULL COMMENT 'nets distributed over the past 3years',
      `mo` varchar(30) NULL COMMENT 'mosquito origin',
      `mst` varchar(30) NULL COMMENT 'mosquito species tested',
      `ma` int(30) NULL COMMENT 'mosquito age',


      `tb` varchar(30) DEFAULT 'NA' COMMENT 'type of bottle bioassay',
      `bia` varchar(30) DEFAULT 'NA' COMMENT 'is it bioassay for intensity assay',
      `it` varchar(30) DEFAULT 'NA' COMMENT 'type of insecticide tested',
      `SynT` varchar(30) DEFAULT 'NA' COMMENT 'what synergist was tested',
      `ic` varchar(30) DEFAULT 'NA' COMMENT 'insecticide concentration',
      `sc` int(50) DEFAULT 0 COMMENT 'synergist concentration',
      `SRTemp` varchar(50) DEFAULT 'NA' COMMENT 'Storage room temperature',
      `ETMax` varchar(30) DEFAULT 'NA' COMMENT 'Maximum Exposure Temperature',
      `ETMin` varchar(30) DEFAULT 'NA' COMMENT 'Minimum Exposure Temperature',
      `HTMax` varchar(30) DEFAULT 'NA' COMMENT 'Maximum Holding Temperature',
      `HTMin` varchar(30) DEFAULT 'NA' COMMENT 'Minimum Holding Temperature',
      `EHMax` varchar(30) DEFAULT 'NA' COMMENT 'Maximum Humidity Exposure',
      `EHMin` varchar(30) DEFAULT 'NA' COMMENT 'Minimum Humidity Exposure',
      `HHMax` varchar(30) DEFAULT 'NA' COMMENT 'Maximum Holding Humidity ',
      `HHMin` varchar(30) DEFAULT 'NA' COMMENT 'Minimum Holding Humidity',

      `mti1` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Bottle1 Insecticide',
      `mti2` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Bottle2 Insecticide',
      `mti3` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Bottle3 Insecticide',
      `mti4` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Bottle4 Insecticide',
      `mti5` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Bottle5 Insecticide',
      `mti6` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Bottle6 Insecticide',


      `mts` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Solvent Control',
      `mtisy1` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Bottle1 Insecticide & Synergist', 
      `mtisy2` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Bottle2 Insecticide & Synergist', 
      `mtisy3` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Bottle3 Insecticide & Synergist', 
      `mtisy4` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Bottle1 Insecticide & Synergist', 
      `mtisy5` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Bottle1 Insecticide & Synergist', 
      `mtisy6` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Bottle1 Insecticide & Synergist', 
      `mtsy` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Synergist Control', 
      `BTCI1` varchar (30) NULL COMMENT 'Bottle Code Bottle1 Insecticide', 
      `BTCI2` varchar (30) NULL COMMENT 'Bottle Code Bottle1 Insecticide', 
      `BTCI3` varchar (30) NULL COMMENT 'Bottle Code Bottle1 Insecticide', 
      `BTCI4` varchar (30) NULL COMMENT 'Bottle Code Bottle1 Insecticide', 
      `BTCI5` varchar (30) NULL COMMENT 'Bottle Code Bottle1 Insecticide', 
      `BTCI6` varchar (30) NULL COMMENT 'Bottle Code Bottle1 Insecticide', 
      `BC_S` varchar (30) NULL COMMENT 'Bottle code Solvent Control', 




        
      `BTCSy_I1` varchar (30) NULL COMMENT 'Bottle Code Bottle1 Synergist & Insecticide', 
      `BTCSy_I2` varchar (30) NULL COMMENT 'Bottle Code Bottle1 Synergist & Insecticide', 
      `BTCSy_I3` varchar (30) NULL COMMENT 'Bottle Code Bottle1 Synergist & Insecticide', 
      `BTCSy_I4` varchar (30) NULL COMMENT 'Bottle Code Bottle1 Synergist & Insecticide', 
      `BC_Sy` varchar (30) NULL COMMENT 'Bottle Code Synergist Control', 
      `DBC_I1` varchar (30) NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide', 
      `DBC_I2` varchar (30) NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
      `DBC_I3` varchar (30) NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
      `DBC_I4` varchar (30) NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
      `DBC_I5` varchar (30) NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
      `DBC_I6` varchar (30) NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
      `DBC_S` varchar (30) NULL COMMENT 'Date Bottle was Coated Solvent Control',

    




      `DBC_SyI1` varchar (30) NULL COMMENT 'Date Bottle was Coated Bottle1 Synergist & Insecticide',
      `DBC_SyI2` varchar (30) NULL COMMENT 'Date Bottle was Coated Bottle1 Synergist & Insecticide',
      `DBC_SyI3` varchar (30) NULL COMMENT 'Date Bottle was Coated Bottle1 Synergist & Insecticide',
      `DBC_SyI4` varchar (30) NULL COMMENT 'Date Bottle was Coated Bottle1 Synergist & Insecticide',
      `DBC_Sy` varchar (30) NULL COMMENT 'Date Bottle was Coated Synergist Control',
      `TBC_I1` varchar (30) NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
      `TBC_I2` varchar (30) NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
      `TBC_I3` varchar (30) NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
      `TBC_I4` varchar (30) NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
      `TBC_I5` varchar (30) NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
      `TBC_I6` varchar (30) NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
      `TBC_S` varchar (30) NULL COMMENT 'Times Bottle coated used Solvent Control',
      `TBC_SyI1` varchar (30) NULL COMMENT 'Times Bottle coated used Bottle1 Synergist & Insecticide',
      `TBC_SyI2` varchar (30) NULL COMMENT 'Times Bottle coated used Bottle1 Synergist & Insecticide',
      `TBC_SyI3` varchar (30) NULL COMMENT 'Times Bottle coated used Bottle1 Synergist & Insecticide',
      `TBC_SyI4` varchar (30) NULL COMMENT 'Times Bottle coated used Bottle1 Synergist & Insecticide',
      `TBC_Sy` varchar (30) NULL COMMENT 'Times Bottle coated used Synergist Control',
  

      `KD_D0` varchar (30) NULL COMMENT 'Knock Down/ Dead Time 0min',
      `KD_D15` varchar (30) NULL COMMENT 'Knock Down/ Dead Time 15min',
      `KD_D30` varchar (30) NULL COMMENT 'Knock Down/ Dead Time 30min',
      `KD_D45` varchar (30) NULL COMMENT 'Knock Down/ Dead Time 45min',
      `KD_D60` varchar (30) NULL COMMENT 'Knock Down/ Dead Time 60min',
      `KD_D75` varchar (30) NULL COMMENT 'Knock Down/ Dead Time 75min',
      `KD_D90` varchar (30) NULL COMMENT 'Knock Down/ Dead Time 90min',
      `KD_D105` varchar (30) NULL COMMENT 'Knock Down/ Dead Time 105min',
      `KD_D120` varchar (30) NULL COMMENT 'Knock Down/ Dead Time 120min',
      `KD_D24` varchar (30) NULL COMMENT 'Knock Down/ Dead Time 24hr',
      `KD_D72` varchar (30) NULL COMMENT 'Knock Down/ Dead Time 72hr',

      `KD_D1D` varchar (30) NULL COMMENT 'Knock Down/ Dead Time Day1',
      `KD_D2D` varchar (30) NULL COMMENT 'Knock Down/ Dead Time Day2',
      `KD_D3D` varchar (30) NULL COMMENT 'Knock Down/ Dead Time Day3',
      `KD_D4D` varchar (30) NULL COMMENT 'Knock Down/ Dead Time Day4',
      `KD_D5D` varchar (30) NULL COMMENT 'Knock Down/ Dead Time Day5',
      `KD_D6D` varchar (30) NULL COMMENT 'Knock Down/ Dead Time Day6',
      `KD_D7D` varchar (30) NULL COMMENT 'Knock Down/ Dead Time Day7',


      `rt` varchar (30) NULL COMMENT 'Room Type',
      `spd` varchar (30) NULL COMMENT 'Date of Spray',
      `liu` varchar (30) NULL COMMENT 'Last Insecticide Used',
      `elcm` varchar (30) NULL COMMENT 'Exposed Location of Control Mosquitoes',
      `mt1` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Cone Height 0.5m',
      `mt2` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Cone Height 1.0m', 
      `mt3` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Cone Height 2.0m', 

      `mt4` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Cone Height Other',

      `mkd1` varchar (30) NULL COMMENT 'Mosquitoes K/D 30min Cone Height 0.5m', 
      `mkd2` varchar (30) NULL COMMENT 'Mosquitoes K/D 60min Cone Height 0.5m',
      `mkd3` varchar (30) NULL COMMENT 'Mosquitoes K/D Day1 Cone Height 0.5m',
      `mkd4` varchar (30) NULL COMMENT 'Mosquitoes K/D Day2 Cone Height 0.5m',
      `mkd5` varchar (30) NULL COMMENT 'Mosquitoes K/D Day3 Cone Height 0.5m',

      `mkd6` varchar (30) NULL COMMENT 'Mosquitoes K/D 30min Cone Height 1.0m',
      `mkd7` varchar (30) NULL COMMENT 'Mosquitoes K/D 60min Cone Height 1.0m',
      `mkd8` varchar (30) NULL COMMENT 'Mosquitoes K/D Day1 Cone Height 1.0m',
      `mkd9` varchar (30) NULL COMMENT 'Mosquitoes K/D Day2 Cone Height 1.0m',

      `mkd10` varchar (30) NULL COMMENT 'Mosquitoes K/D Day3 Cone Height 1.0m',

      `mkd11` varchar (30) NULL COMMENT 'Mosquitoes K/D 30min Cone Height 1.5m',

      `mkd12` varchar (30) NULL COMMENT 'Mosquitoes K/D 30min Cone Height 1.5m',

      `mkd13` varchar (30) NULL COMMENT 'Mosquitoes K/D 30min Cone Height 1.5m',


      `mkd14` varchar (30) NULL COMMENT 'Mosquitoes K/D Day2 Cone Height 1.5m',
      `mkd15` varchar (30) NULL COMMENT 'Mosquitoes K/D Day3 Cone Height 1.5m',

      `mkd16` varchar (30) NULL COMMENT 'Mosquitoes K/D 30min Cone Height 2.0m',
      `mkd17` varchar (30) NULL COMMENT 'Mosquitoes K/D 60min Cone Height 2.0m',
      `mkd18` varchar (30) NULL COMMENT 'Mosquitoes K/D Day1 Cone Height 2.0m',
      `mkd19` varchar (30) NULL COMMENT 'Mosquitoes K/D Day2 Cone Height 2.0m',
      `mkd20` varchar (30) NULL COMMENT 'Mosquitoes K/D Day3 Cone Height 2.0m',



      `O1` varchar (30) NULL COMMENT 'Mosquitoes K/D in net other1 mins',
      `O2` varchar (30) NULL COMMENT 'Mosquitoes K/D in net other2 mins',
      `O3` varchar (30) NULL COMMENT 'Mosquitoes K/D in net other3 mins',



      `mtir1` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Rep1 Insecticide',
      `mtir2` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Rep2 Insecticide',
      `mtir3` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Rep3 Insecticide',
      `mtir4` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Rep4 Insecticide',
      `mtir5` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Rep5 Insecticide',
      `mtir6` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Rep6 Insecticide',

      `mtsr1` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Rep1 Solvent Control',
      `mtsr2` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Rep2 Solvent Control',
      `mtsr3` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Rep3 Solvent Control',
      `mtsr4` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Rep4 Solvent Control',

      `mtisyr1` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Rep1 Insecticide & Synergist',
      `mtisyr2` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Rep2 Insecticide & Synergist',
      `mtisyr3` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Rep3 Insecticide & Synergist',
      `mtisyr4` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Rep4 Insecticide & Synergist',

      `mtsyr1` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Rep1 Synergist Control',
      `mtsyr2` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Rep2 Synergist Control',

      `mtsyr3` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Rep3 Synergist Control',
      `mtsyr4` varchar (30) NULL COMMENT 'No of Mosquitoes Tested Rep4 Synergist Control',

      `tcir1` varchar (30) NULL COMMENT 'Tube Code Rep1 Insecticide',
      `tcir2` varchar (30) NULL COMMENT 'Tube Code Rep2 Insecticide',
      `tcir3` varchar (30) NULL COMMENT 'Tube Code Rep3 Insecticide',
      `tcir4` varchar (30) NULL COMMENT 'Tube Code Rep4 Insecticide',
      `tcir5` varchar (30) NULL COMMENT 'Tube Code Rep5 Insecticide',
      `tcir6` varchar (30) NULL COMMENT 'Tube Code Rep6 Insecticide',

      `tc_sr1` varchar (30) NULL COMMENT 'Tube Code Rep1 Solvent Control',
      `tc_sr2` varchar (30) NULL COMMENT 'Tube Code Rep2 Solvent Control',
      `tc_sr3` varchar (30) NULL COMMENT 'Tube Code Rep3 Solvent Control',
      `tc_sr4` varchar (30) NULL COMMENT 'Tube Code Rep4 Solvent Control',

      `tc_syir1` varchar (30) NULL COMMENT 'Tube Code Rep1 Insecticide & Synergist',
      `tc_syir2` varchar (30) NULL COMMENT 'Tube Code Rep2 Insecticide & Synergist',
      `tc_syir3` varchar (30) NULL COMMENT 'Tube Code Rep3 Insecticide & Synergist',
      `tc_syir4` varchar (30) NULL COMMENT 'Tube Code Rep4 Insecticide & Synergist',

      `tc_sy1r` varchar (30) NULL COMMENT 'Tube Code Rep1 Synergist Control',
      `tc_sy2r` varchar (30) NULL COMMENT 'Tube Code Rep2 Synergist Control',
      `tc_sy3r` varchar (30) NULL COMMENT 'Tube Code Rep3 Synergist Control',
      `tc_sy4r` varchar (30) NULL COMMENT 'Tube Code Rep4 Synergist Control',




      `id_ir1` varchar (30) NULL COMMENT 'Impregnation Date Tube1 Insecticide',
      `id_ir2` varchar (30) NULL COMMENT 'Impregnation Date Tube2 Insecticide',
      `id_ir3` varchar (30) NULL COMMENT 'Impregnation Date Tube3 Insecticide',
      `id_ir4` varchar (30) NULL COMMENT 'Impregnation Date Tube4 Insecticide',
      `id_ir5` varchar (30) NULL COMMENT 'Impregnation Date Tube5 Insecticide',
      `id_ir6` varchar (30) NULL COMMENT 'Impregnation Date Tube6 Insecticide',


      `id_sr1` varchar (30) NULL COMMENT 'Impregnation Date Tube1 Solvent Control',
      `id_sr2` varchar (30) NULL COMMENT 'Impregnation Date Tube2 Solvent Control',
      `id_sr3` varchar (30) NULL COMMENT 'Impregnation Date Tube3 Solvent Control',
      `id_sr4` varchar (30) NULL COMMENT 'Impregnation Date Tube4 Solvent Control',




      `id_syr1` varchar (30) NULL COMMENT 'Impregnation Date Tube1 Synergist Control',
      `id_syr2` varchar (30) NULL COMMENT 'Impregnation Date Tube2 Synergist Control',
      `id_syr3` varchar (30) NULL COMMENT 'Impregnation Date Tube3 Synergist Control',
      `id_syr4` varchar (30) NULL COMMENT 'Impregnation Date Tube4 Synergist Control',

      `edi1` varchar (30) NULL COMMENT 'Expiry Date - Rep1 Insecticide(EDI1)',
      `edi2` varchar (30) NULL COMMENT 'Expiry Date - Rep2 Insecticide(EDI2)',
      `edi3` varchar (30) NULL COMMENT 'Expiry Date - Rep3 Insecticide(EDI3)',
      `edi4` varchar (30) NULL COMMENT 'Expiry Date - Rep4 Insecticide(EDI4)',
      `edi5` varchar (30) NULL COMMENT 'Expiry Date - Rep5 Insecticide(EDI5)',
      `edi6` varchar (30) NULL COMMENT 'Expiry Date - Rep6 Insecticide(EDI6)',

      `eds1` varchar (30) NULL COMMENT 'Expiry Date - Rep1 Solvent Control',
      `eds2` varchar (30) NULL COMMENT 'Expiry Date - Rep2 Solvent Control',
      `eds3` varchar (30) NULL COMMENT 'Expiry Date - Rep3 Solvent Control',
      `eds4` varchar (30) NULL COMMENT 'Expiry Date - Rep4 Solvent Control',

      `edisy1` varchar (30) NULL COMMENT 'Expiry Date - Rep1 Insecticide & Synergist',
      `edisy2` varchar (30) NULL COMMENT 'Expiry Date - Rep2 Insecticide & Synergist',
      `edisy3` varchar (30) NULL COMMENT 'Expiry Date - Rep3 Insecticide & Synergist',
      `edisy4` varchar (30) NULL COMMENT 'Expiry Date - Rep4 Insecticide & Synergist',

      `edsy1` varchar (30) NULL COMMENT 'Expiry Date - Rep1 Synergist Control',
      `edsy2` varchar (30) NULL COMMENT 'Expiry Date - Rep2 Synergist Control',
      `edsy3` varchar (30) NULL COMMENT 'Expiry Date - Rep3 Synergist Control',
      `edsy4` varchar (30) NULL COMMENT 'Expiry Date - Rep4 Synergist Control',

      `senfr` int(11) NOT NULL,
      `userid` varchar(100) NOT NULL COMMENT 'Submitted by userid',
      `submitted` varchar(100) DEFAULT NULL COMMENT 'Channel used to submit',
      `created_at` timestamp default now(), 
      `updated_at` timestamp default now(),
      PRIMARY KEY (`userid`,`sen`,`fr`),
      UNIQUE KEY `id` (`id`)
    
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";


  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "ss4 (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
    `edssid` int(6) NOT NULL COMMENT 'unique identifier for SS4 form',
    `sen` int(6) NOT NULL COMMENT 'unique identifier for SS4 form',
    `ssen` int(6) NOT NULL COMMENT 'unique identifier for SS4 form',
    `sfr` int(6) NOT NULL COMMENT 'unique identifier for SS4 form',
    `fr` int(2) NOT NULL COMMENT 'unique identifier of each row on the data collected',
    `su` varchar(100) DEFAULT '0' COMMENT 'substracte (type of soil for snail to lay eggs)',
    `sa` varchar(15) DEFAULT NULL COMMENT 'salinity',
    `dso` varchar(15) DEFAULT NULL COMMENT 'Dissolved oxygen ',
    `dr` varchar(15) DEFAULT '-99' COMMENT 'Number of dredges',
    `ph` varchar(15) DEFAULT NULL COMMENT 'potential of hydrogen',
    `co` varchar(15) DEFAULT NULL COMMENT ' Conductivity ms',
    `wda` varchar(100) DEFAULT '0' COMMENT 'wild domestic animal  (define jind of animals)',
    `act` varchar(100) DEFAULT '0' COMMENT 'activity (define either human activities )',
    `hc` varchar(100) DEFAULT '0' COMMENT 'activity (Health centres )',
    `wn` varchar(15) DEFAULT '-99' COMMENT 'Hold status of water body name (1: Yes, 2: No)',
    `wl` varchar(15) DEFAULT '-99' COMMENT 'Hold status of water level (1: Yes, 2: No)',
    `de` varchar(15) DEFAULT '-99' COMMENT 'Hold status of depth (1: Yes, 2: No)',
    `ret` varchar(15) DEFAULT '-99' COMMENT 'Hold status of flow rate (1: Yes, 2: No)',
    `wt` varchar(15) DEFAULT '-99' COMMENT 'Hold status of water body type (1: Yes, 2: No)',
    `lwt` varchar(15) DEFAULT '-99' COMMENT 'Hold status of longevity of water body type (1: Yes, 2: No)',
    `sp` varchar(15) DEFAULT '-99' COMMENT 'Hold status of snail present(1: Yes, 2: No)',
    `spc` varchar(15) DEFAULT '-99' COMMENT 'Hold status of snail species collected (1: Yes, 2: No)',
    `n` varchar(15) DEFAULT '-99' COMMENT 'number of observed (Records the total number of mosquitoes observed in each specific subgroup)',
    `sps` varchar(15) DEFAULT '-99' COMMENT 'Hold status of snail species shedded (1: Yes, 2: No)',
    `tc` varchar(15) DEFAULT '-99' COMMENT 'Hold status of type of cercaria (1: Yes, 2: No)',
    `nc` varchar(15) DEFAULT '-99' COMMENT 'Bumber of cercaria shadded (1: Yes, 2: No)',
    `nd` int(3) DEFAULT NULL COMMENT 'number of discarded (This is the number of mosquitoes discarded)',
    `senfr` int(11) NOT NULL,
    `userid` varchar(100) NOT NULL COMMENT 'Submitted by userid',
    `submitted` varchar(100) DEFAULT NULL COMMENT 'Channel used to submit',
    `created_at` timestamp default now(), 
    `updated_at` timestamp default now(),
    PRIMARY KEY (`edssid`,`userid`,`sen`,`fr`),
    UNIQUE KEY `id` (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;";


  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "sost (
        `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
        `so1id` int(11) DEFAULT NULL COMMENT 'Hold data link to SS1',
        `so2id` int(11) DEFAULT NULL COMMENT 'Hold data link to SS2',
        `so3id` int(11) DEFAULT NULL COMMENT 'Hold data link to SS3',
        PRIMARY KEY (`id`),
        KEY `fk_ss1id` (`so1id`),
        KEY `fk_ss2id` (`so2id`),
        KEY `fk_ss3id` (`so3id`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";


  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "method (
         `id` int(11) NOT NULL AUTO_INCREMENT,
         `number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
         `me` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
         PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";


  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "location (
         `id` int(11) NOT NULL AUTO_INCREMENT,
         `number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
         `ind` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
         PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";

  $sql .= "INSERT INTO " . $prefix . "location (`id`, `number`, `ind`) VALUES ('1', '1', 'In'), ('2', '2', 'Out');";

  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "habitattype (
         `id` int(11) NOT NULL AUTO_INCREMENT,
         `number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
         `ht` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
         PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";


  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "enumerationarea (
         `id` int(11) NOT NULL AUTO_INCREMENT,
         `number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
         `ea` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
         PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";


  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "cluster (
         `id` int(11) NOT NULL AUTO_INCREMENT,
         `number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
         `cr` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
         PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";

  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "compound (
         `id` int(11) NOT NULL AUTO_INCREMENT,
         `number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
         `cp` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
         PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";

  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "treatment (
         `id` int(11) NOT NULL AUTO_INCREMENT,
         `number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
         `tr` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
         PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";

  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "treatment_two (
          `id` int(11) NOT NULL AUTO_INCREMENT,
          `number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
          `tr` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
          PRIMARY KEY (`id`)
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";

  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "colonycode (
         `id` int(11) NOT NULL AUTO_INCREMENT,
         `number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
         `cc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
         PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";

  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "bodypart (
         `id` int(11) NOT NULL AUTO_INCREMENT,
         `number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
         `bp` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
         PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";

  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "replicate (
         `id` int(11) NOT NULL AUTO_INCREMENT,
         `number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
         `rep` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
         PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";

  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "taxon (
         `id` int(11) NOT NULL AUTO_INCREMENT,
         `number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
         `tx` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
         PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";

  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "sas (
       `id` int(11) NOT NULL AUTO_INCREMENT,
       `number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
       `sas` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
       PRIMARY KEY (`id`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";

  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "custgraph (
       `id` int(11) NOT NULL AUTO_INCREMENT,
       `pc` int(11) NOT NULL ,
       `location` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
       `num_split` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
       `p_attri` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
       `p_attri2` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
       PRIMARY KEY (`id`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";

  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "custlabel (
       `id` int(11) NOT NULL AUTO_INCREMENT,
       `pc` int(11) NOT NULL ,
       `location` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
       `num_split` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
       `p_attri` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
       `p_attri2` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
       PRIMARY KEY (`id`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";


  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "ss1template(
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `sen` varchar(10),
      `ssen` varchar(10) NULL,
      `sfr` varchar(10) NULL,
      `bf` varchar(10) NULL,
      `fr` varchar(10) NULL,
      `tx` varchar(10) NULL,
      `sas` varchar(20) NULL,
      `n` varchar(10) NULL,
      `notes` varchar(10) NULL,
      `slc` varchar(30) NULL,
      `st` varchar(10) NULL,
      `ni` varchar(10) NULL ,
      `nb` varchar(10) NULL,
      `sid01` varchar(10) NULL,
      `sid02` varchar(10) NULL,
      `sid03` varchar(10) NULL,
      `sid04` varchar(10) NULL,
      `sid05` varchar(10) NULL,
      `sid06` varchar(10) NULL,
      `sid07` varchar(10) NULL,
      `nd` varchar(10) NULL,
       PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";

  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "ss2template(
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `sen` varchar(10),
      `ssen` varchar(10) NULL,
      `sfr` varchar(10) NULL,
      `hf` varchar(10) NULL,
      `htc` varchar(10) NULL,
      `htr` varchar(10) NULL,
      `hw` varchar(10) NULL,
      `hs` varchar(10) NULL,
      `fr` varchar(10) NULL,
      `tx` varchar(20) NULL,
      `bf` varchar(10) NULL,
      `pu` varchar(10) NULL,
      `vl` varchar(10) NULL,
      `vt` varchar(10) NULL,
      `ndi01` varchar(10) NULL,
      `ndi02` varchar(10) NULL,
      `ndi03` varchar(10) NULL,
      `ndi04` varchar(10) NULL ,
      `ndi05` varchar(10) NULL,
      `ndi06` varchar(10) NULL,
      `ndi07` varchar(10) NULL,
      `ndi08` varchar(10) NULL,
      `ndi09` varchar(10) NULL,
      `ndi10` varchar(10) NULL,
      `n` varchar(10) NULL,
      `notes` varchar(10) NULL,
      `slc` varchar(30) NULL,
      `ni` varchar(10) NULL ,
      `nb` varchar(10) NULL,
      `sid01` varchar(10) NULL,
      `sid02` varchar(10) NULL,
      `sid03` varchar(10) NULL,
      `sid04` varchar(10) NULL,
      `sid05` varchar(10) NULL,
      `sid06` varchar(10) NULL,
      `sid07` varchar(10) NULL,
      `nd` varchar(10) NULL,
       PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";



  // ED1Template table
  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "ed1template (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment links to SS',
    `sen` varchar(10) NULL COMMENT 'unique identifier for ED1 form',
    `fr` int(11) NOT NULL COMMENT 'unique identifier of each row on the data collected',
    `dt` varchar(100) NULL COMMENT 'date of collection (morning on which the mosquitoes were collected)',
    `re`  varchar(100) NULL COMMENT 'Region (Define specific Region in the Country)',
    `di`  varchar(100) NULL COMMENT 'District (Define specific District in a Region )',
    `sec`  varchar(100) NULL COMMENT 'Sector/Council (Define specific Sector in the District)',
    `cew`  varchar(100) NULL COMMENT 'Cell/Ward (Define specific Cell/ in the Sector)',
    `vis`  varchar(100) NULL COMMENT 'Village/Street (Define specific Village/Street in the Cell/Ward)',
    `ea` varchar(100) NULL COMMENT 'Enumaration area (Define geographic location within the study site)',
    `cr` varchar(100) NULL COMMENT 'Cluster (The smallest geographic statistical unit within enumaration area)',
    `cp` varchar(100) NULL COMMENT 'Compound or Plot (A specific physical area within an identifiable owner)',
    `tcu` varchar(100) NULL COMMENT 'Hold Ten Cell Unit',
    `hh` varchar(100) NULL COMMENT 'Household (A person or group of people who live together in the same dwelling unit)',
    `nah` varchar(100) NULL COMMENT 'Animals in Household (An animal or group of animals who live together with people in same dwelling unit)',
    `sid` varchar(100) NULL COMMENT 'Structure ID (A free standing building that can have one or more room for residential or commercial use)',
    `me` varchar(100) NULL COMMENT 'Method (The method by which the mosquitoes were collected or trapped)',
    `ind` varchar(100) NULL COMMENT 'hold collection was made indoors a house or hut',
    `ht` varchar(100) NULL COMMENT 'Habitat Type (Classification of the aquatic habitat in which the collection was made)',
    `st` varchar(100) NULL COMMENT 'Start Time (The time that the collection started in 24 time )',
    `ft` varchar(100) NULL COMMENT 'Finish Time (The time that the collection finish in 24 time)',
    `hp` varchar(100) NULL COMMENT 'Hold Period (The period of time for which the mosquitoes were held for survival analysis after they were collected)',
    `rnd` varchar(100) NULL COMMENT 'Round (One cycle or rotation of the treatment )',
    `blk` varchar(100) NULL COMMENT 'Block (A set of position through which treatments are rotated in a Latin)',
    `shh` varchar(100) NULL COMMENT 'A project specific house or experiment hut',
    `stn` varchar(100) NULL COMMENT 'A project specific where station where a trap may be positioned',
    `vi` varchar(100) NULL COMMENT 'Initial of person that caught the mosquitoes',
    `vig` varchar(100)  NULL COMMENT 'Gender of person that caught the mosquitoes',
    `tr` varchar(100) NULL COMMENT 'Treatment (Coding for the unique experimental treatment)',
    `dy` varchar(100) NULL COMMENT 'Experiment Day (The consecutive nth day since the experiment commenced)',
    `tmp` varchar(100) NULL COMMENT 'Temperature',
    `hmd` varchar(100) NULL COMMENT 'Humidity',
    `ws` varchar(100) NULL NULL COMMENT 'wind speed',
    `hs` varchar(100) NULL COMMENT 'Number of household sampled',
    `vc` varchar(100) NULL COMMENT 'Legitimacy of the collection',
    `notes` varchar(100) NULL COMMENT 'On site observation about the collection',
    `gps` varchar(100) NULL COMMENT 'Site geolocation',
    `dsen` varchar(100) NULL ,
    `livestock` varchar(100) NULL,
    `hoccupant` varchar(100) NULL,
    `heaves` varchar(100) NULL,
    `nss` varchar(100) NULL,
    `nbh` varchar(100) NULL,
    `oth` varchar(100) NULL,
    `sn` varchar(100) NULL COMMENT 'Season',
    `wtc` varchar(30) DEFAULT '-99' COMMENT 'Weather Conditions',
    `agrt` varchar(100) NULL COMMENT 'Agriculture',
    `invn` varchar(100) NULL COMMENT 'Intervention',
    `lvk` varchar(100) NULL COMMENT 'Livestock',
    `rfe` varchar(100) NULL COMMENT 'Roof type',
    `wle` varchar(100) NULL COMMENT 'Wall type',
    `evs` varchar(100) NULL COMMENT 'Eaves',
    `bv` varchar(100) NULL COMMENT 'Block ventilation',
    `bvs` varchar(100) NULL COMMENT 'Block ventilation screening',
    `wsn` varchar(100) NULL COMMENT 'Window screening',
    `wsnc` varchar(100) NULL COMMENT 'Window screening Condition',
    `ckl` varchar(100) NULL COMMENT 'Cooking location',
    `cke` varchar(100) NULL COMMENT 'Cooking Energy source',
    `sp` varchar(100) NULL COMMENT 'Sprayed',
    `lsd` varchar(100) NULL COMMENT 'Last spray date',
    `ise` varchar(100) NULL COMMENT 'Insectside',
    `userid` varchar(100) NULL COMMENT 'Submitted by userid',
    `submitted` varchar(100) NULL COMMENT 'Channel used to submit',
    `created_at` timestamp default now(),  
    `updated_at` timestamp default now(),
        PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";

  $sql .= "CREATE TABLE IF NOT EXISTS " . $prefix . "ed2template(
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `sen` varchar(10),
      `fr` varchar(10),
      `ssen` varchar(10) NULL,
      `sfr` varchar(10) NULL,
      `slc` varchar(30) NULL,
      `sbp` varchar(10) NULL,
      `sst` varchar(10) NULL,
      `ssid` varchar(20) NULL,
      `scc` varchar(10) NULL,
      `stx` varchar(10) NULL,
      `ssas` varchar(10) NULL,
      `ag` varchar(10) NULL,
      `n` varchar(10) NULL ,
      `sd` varchar(10) NULL,
      `st` varchar(10) NULL,
      `tr` varchar(10) NULL,
      `vi` varchar(10) NULL,
      `rep` varchar(10) NULL,
      `rnd` varchar(10) NULL,
      `dy` varchar(10) NULL,
      `oth1` varchar(10) NULL,
      `oth2` varchar(10) NULL,
      `oth3` varchar(10) NULL,
      `va` varchar(10) NULL,
      `dsen` varchar(10) NULL,
       PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";


  $sql .= "";
  $sql .= "";

  $db->multi_query($sql);
}
