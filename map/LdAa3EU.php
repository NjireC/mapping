 <?php

 /**
* Created by Dickson Msaky @ Ifakara Health Insitute (2018)
**/

require_once('includes/load.php');

$email = $_GET['email'];
$token = $_GET['jhVry'];
$time = $_GET['qFVnn'];
$expire = 86400; 
$valid = $_GET['MjvWW'];

$sql = "SELECT * FROM staff WHERE email='{$email}'";
$result = $db->query($sql);
$rowc = $db->num_rows($result);

if($rowc !=0 ){

    $sqlt = "SELECT * FROM token_key WHERE email='{$email}'";
    $tokenresult = $db->query($sqlt);
    $tokenrow = $db->fetch_assoc($tokenresult); 

   if ($tokenrow['valid'] !== $valid){
      redirect('reset_pwd.php?error=2',false);
   }elseif ($tokenrow['token'] !== $token){
      redirect('reset_pwd.php?error=3',false);
   }elseif ($_SERVER["REQUEST_TIME"] - $time > $expire) {
      redirect('reset_pwd.php?error=1',false);
   }


}else{

    $session->msg_('d','Failed! Wrong Email address');
    redirect('login.php',false);

}


?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Register</title>  
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css" >
<link rel="stylesheet" type="text/css" href="assets/css/mdb-theme.css">
<link rel="stylesheet" type="text/css" href="assets/css/styles.css">
<link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css"> 
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/moment.js"></script>
<script src="assets/js/plugins/interface/jgrowl.min.js"></script>
<script type="text/javascript" src="assets/js/application.js"></script>
<script type="text/javascript" src="assets/js/pwstrength.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script> 

</head>

<body class="full-width" id="full-screen-background-image">

  <!-- LOADER  -->
  <div id="loading">
    <div id="loading-center">
      <div id="loading-center-absolute">
        <div class="object" id="object_one"></div>
        <div class="object" id="object_two"></div>
        <div class="object" id="object_three"></div>
      </div>
    </div>
  </div>

  <!-- Page container -->
  <div class="page-container container">
    <div class="page-content">

     <?php echo display_msg_popup($msg);  ?>

     <div class="row">
      <div class="col-sm-6 register-wrapper" style="float: none; margin: 0 auto;">
        <img src="assets/images/mos22.png" alt=""> 
        <!-- Form vertical (default) -->
        <form action="LdAa3EU2.php" method="post">
          <div class="panel panel-default">
           <div class="panel-heading login-top" align="center"> 
            <img src="assets/images/logo.png" alt=""> 
          </div>
          <div class="panel-body">
           <div class="form-group" align="center">
             <h4>RESET PASSWORD</h4> 
           </div>


           <div  id="fpwd1" class="form-group">
            <label>New Password</label>
            <input type="password" class="form-control" name="password" id="password"  onkeyup="CheckPasswordStrength(this.value)" data-toggle="tooltip" data-trigger="focus" title="Password must be greater 6,lowercase,Uppercase and special characters" required/>
            <span id="password_strength"></span>
          </div>

          <div id="fpwd2" class="form-group">
            <label>Confirm Password</label>
            <input type="password" class="form-control" name="password2" id="password2" onkeyup="checkPass(); return false;" required>
            <span id="confirmMessage" class="confirmMessage"></span>
          </div>

          <input type="hidden" name="email" value="<?php echo $email ?>">
          <input type="hidden" name="token" value="<?php echo $token ?>">
          <input type="hidden" name="time" value="<?php echo $time ?>">
          <input type="hidden" name="valid" value="<?php echo $valid ?>">

         <input type="submit" name="Reset" id="Reset" value="Submit"  class="btn btn-lg btn-primary btn-block" >

       </div>
     </div>
   </form>

 </div>
</div>

</div>
</div>

</body>
</html>





  
  