 <?php

/**
* Created by Dickson Msaky @ Ifakara Health Insitute (2018)
**/
require_once('includes/load.php');

$error ='';
$email = $_POST['email'];
$reset = $_POST['Reset'];



if(isset($_GET['error'])){  

  if($_GET['error'] == 1){
     $session->msg_('d',' The Reset Password Link has expired.');
     redirect('login.php', false);
  }elseif($_GET['error'] == 2){
     $session->msg_('d',' The Reset Password Link has already been used.');
     redirect('login.php', false);
  }elseif($_GET['error'] == 3){
     $session->msg_('d',' The Reset Password Token is Invalid.');
     redirect('login.php', false);
  }

}


  if(isset($_POST['Reset'])){

   $req_fields = array('email');
   validate_fields($req_fields);
   validate_captcha($_POST['g-recaptcha-response']);


if(empty($errors)){

    
        $sql = "SELECT * FROM staff WHERE email='{$email}'";
        $result = $db->query($sql);
        $rowc = $db->num_rows($result);

        $sqlt = "SELECT * FROM token_key WHERE email='{$email}'";
        $tokenresult = $db->query($sqlt);
        $tokenrowc = $db->num_rows($tokenresult);

        if($tokenrowc > 0){
           delete_by_("token_key","email","'{$email}'");
        }

    if($rowc !=0 ){
         
        $row = $db->fetch_assoc($result); 
        $fname = $row['fname'];

        $rand = rand(1272891, 5592729);
        $new = $random;
        $pwd = $new;
        $token = hashPass($pwd);

        $email   = remove_junk($db->escape($_POST['email']));
        $time = $_SERVER["REQUEST_TIME"];


        $query = "INSERT INTO token_key (";
        $query .="token,email,time";
        $query .=") VALUES (";
        $query .="'{$token}', '{$email}', '{$time}'";
        $query .=")";

        $link = $url.'/LdAa3EU.php?email='.$email.'&jhVry='.$token.'&qFVnn='.$time.'&MjvWW=1';
        $subject='MosquitoDB password reset email';

                  $emailbody = <<<EOT
  <div style="width:100%!important;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;font-family:'Lucida Grande',Tahoma,sans-serif;color:#68757e;margin-bottom:5px">
  <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tbody>
      <tr style="border-collapse:collapse">
        <td style="font-family:Arial, Helvetica, sans-serif; border-collapse:collapse" align="center"><table style="margin-top:0;margin-bottom:0;margin-right:0px;margin-left:0px" border="0" cellpadding="0" cellspacing="0" width="800">
            <tbody>
            <tr>
                <td style="font-family:Arial, Helvetica, sans-serif; border-collapse:collapse; background:#000;" align="center" width="800">
                <table border="0" cellpadding="0" cellspacing="0"><tr><td>&nbsp;</td></tr></table>
                <table border="0" cellpadding="0" cellspacing="0"><tr><td>&nbsp;</td></tr></table>
                  <table border="0" cellpadding="0" cellspacing="0" width="700">
                    <tbody>
                      <tr>
                        <td style="background:#fff; border-left: 1px solid #fff;border-right: 1px solid #fff;"><div mc:edit="std_content10">
                            <table border="0" cellpadding="0" cellspacing="0" width="698">
                              <tbody>
                              <tr><td>&nbsp;</td></tr>
                                <tr>
                                  <td style="padding-top:1px; text-align:center" align="center" valign="top"></td>
                                </tr>
                              <tr><td>&nbsp;</td></tr>
                              
                              </tbody>
                            </table>
                          </div></td>
                      </tr>
                    </tbody>
                  </table>
                  </td>
                  </tr>
              <tr>
                <td style="font-family:Arial, Helvetica, sans-serif; border-collapse:collapse; background:#f5f5f5;" align="center" width="800">
                  <table border="0" cellpadding="0" cellspacing="0" width="700" style="border-top:1px solid #e1e1e1;">
                    <tbody>
                      <tr>
                        <td style="background:#fff; border-left:1px solid #e1e1e1;border-right:1px solid #e1e1e1;"><div mc:edit="std_content13">
                            <table align="center" border="0" cellpadding="0" cellspacing="0" width="671">
                              <tbody>
                                <tr><td>&nbsp;</td></tr>
                              </tbody>
                            </table>
                          </div></td>
                      </tr>
                    </tbody>
                  </table>
                  <table border="0" cellpadding="0" cellspacing="0" width="700">
                    <tbody>
                      <tr>
                        <td style="background:#fff; border-left: 1px solid #e1e1e1;border-right: 1px solid #e1e1e1;"><div mc:edit="std_content00">
                            <table align="center" border="0" cellpadding="2" cellspacing="0" width="671">
                              <tbody>
                                <tr>
                                  <td style="font-family:Arial, Helvetica, sans-serif; font-size:13px; color:#4d4d4d; text-align:justify;" valign="top"><table border="0" cellpadding="0" cellspacing="0">
                                      <tbody>
                                        <tr>
                                          <td style="line-height:25px; font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#4d4d4d; text-align:justify;" valign="top">

                                              Dear&nbsp; {$fname},<br>

                                              We received a request to reset your password. <br />
                                              Click on the link below to reset it now
                                              <br /><br /> 


                                              <a style="margin:3px 0;border-style:solid;display:inline-block;border-width:15px 45px;border-color:#009551;background-color:#009551;font-size:12px;font-weight:normal;text-decoration:none;white-space:nowrap;font-family:Arial, Helvetica, sans-serif;color:#ffffff" href="$link" target="_blank">Reset Password</a> <br>

                                               
                                              <span style="line-height:20px; font-family:Arial, Helvetica, sans-serif; font-size:10px; color:#4d4d4d; text-align:justify;" valign="top"> 

                                               <br />*If you did not make this request, You can ignore this message.
                                              <br />*Please reset your password within 24 hours or you will need to start the process over again.<br>
                                              *Please do not reply this email </span>

                                      

                                           <br><br></td>
                                        </tr>
                                      </tbody>
                                    </table>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </div></td>
                      </tr>
                    </tbody>
                  </table>
                  <table border="0" cellpadding="0" cellspacing="0" width="700">
                    <tbody>
                      <tr>
                        <td style="background:#fff; border-left:1px solid #e1e1e1; border-bottom:1px solid #e1e1e1; border-right:1px solid #e1e1e1;">
                          <div mc:edit="std_content17">
                          </div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <table border="0" cellpadding="0" cellspacing="0" width="700">
                  <tbody>
                   <tr><td>&nbsp;</td></tr>
                    <tr>
                     <td align="center" style="color:#626262; font-size:13px; font-family:Arial, Helvetica, sans-serif;">MosquitoDB<br />
                      </td>
                      </tr>
                      <tr><td>&nbsp;</td></tr>
                      </tbody></table></td>
              </tr>
            </tbody>
          </table></td>
      </tr>
      <tr><td>&nbsp;</td></tr>
    </tbody>
  </table>
</div>
EOT;

      
        if($db->query($query)){
          //sucess
          sendMail($email,$emailbody,$subject);
          redirect('resetpwd_msg.php', false);
        } else {
          //failed
          $session->msg_('d',' Sorry failed to reset password!');
          redirect('reset_pwd.php', false);
        }


    } else{

        $session->msg_('d','Failed! Wrong Email address');
        redirect('reset_pwd.php',false);

    }


 } else {

    $session->msg_("d", $errors);
    redirect('reset_pwd.php',false);

 }



 }
?>
 <!DOCTYPE html>
 <html lang="en">

 <head>
     <meta charset="utf-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>Reset Password | MosquitoDB</title>
     <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
     <link rel="stylesheet" type="text/css" href="assets/css/mdb-theme.css">
     <link rel="stylesheet" type="text/css" href="assets/css/styles.css">
     <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
     <link type="text/css" rel="stylesheet" href="assets/css/animate.min.css" />
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


     <!-- Navbar -->
     <div class="navbar navbar-inverse" role="navigation">

         <div class="container-fluid">
             <div class="navbar-header">
                 <div class="hidden-lg pull-right">
                     <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-right">
                         <span class="sr-only">Toggle navigation</span>
                         <i class="fa fa-chevron-down"></i>
                     </button>
                     <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar">
                         <span class="sr-only">Toggle sidebar</span>
                         <i class="fa fa-bars"></i>
                     </button>
                 </div>

                 <ul class="nav navbar-nav navbar-left-custom">
                     <li class="user dropdown">
                         <a href="home.php">
                             <span>Mosquito Database</span>
                         </a>

                     </li>
                 </ul>

             </div>

             <ul class="nav navbar-nav navbar-right collapse" id="navbar-right">

                 <li>
                     <select class="selectpicker" data-width="fit" onchange="translateLanguage(this.value);">
                         <option data-content='<span class="flag-icon flag-icon-af"></span> English' value="English">
                             English</option>
                         <option data-content='<span class="flag-icon flag-icon-al"></span> French' value="French">
                             French</option>
                     </select>
                 </li>

                 <li> <a id="tguide"> <span> Getting Started</span> </a> </li>

             </ul>
         </div>
     </div>
     <!-- /navbar -->

     <!-- Page container -->
     <div class="page-container container">
         <div class="page-content">

             <?php echo display_msg_popup($msg);  ?>

             <div class="row">
                 <div class="col-sm-4 register-wrapper animate__animated animate__fadeIn"
                     style="float: none; margin: 0 auto;">

                     <div class="animate__animated animate__fadeInLeft">
                         <img src="assets/images/mos22.png" alt="">
                     </div>

                     <!-- Form vertical (default) -->
                     <form action="reset_pwd.php" method="post">
                         <div class="panel panel-default">
                             <div class="panel-heading login-top" align="center">
                                 <img src="assets/images/logo.png" alt="" width=56%>
                             </div>
                             <div class="panel-body">
                                 <div class="form-group" align="center">
                                     <h4>RESET YOUR PASSWORD</h4>
                                 </div>

                                 <div class="form-group">
                                     <label>Email</label>
                                     <input type="email" class="form-control" name="email" id="email" required>
                                 </div>

                                 <div class="form-group">
                                     <div class="g-recaptcha" data-sitekey="<?php echo SITE_KEY; ?>"></div>
                                 </div>


                                 <input type="submit" name="Reset" id="Reset" value="Reset password"
                                     class="btn btn-lg btn-primary btn-block">

                                 <div class="row form-actions">
                                     <div class="col-xs-12">
                                         <hr />
                                         <a href="login.php"> Back to Login </a>
                                     </div>
                                 </div>



                             </div>
                         </div>
                     </form>

                 </div>
             </div>

         </div>
     </div>

     <!-- from here -->
     <style>
     .goog-te-banner-frame.skiptranslate {
         display: none !important;
     }

     body {
         top: 0px !important;
     }
     </style>

     <script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"
         type="text/javascript"></script>
     <div id="google_translate_element" style="display:none"></div>
     <script>
     function googleTranslateElementInit() {
         new google.translate.TranslateElement({
             pageLanguage: 'en',
             layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
             autoDisplay: false
         }, 'google_translate_element');
     }

     function translateLanguage(lang) {
         googleTranslateElementInit();
         var $frame = $('.goog-te-menu-frame:first');
         if (!$frame.size()) {
             alert("Error: Could not find Google translate frame.");
             return false;
         }
         $frame.contents().find('.goog-te-menu2-item span.text:contains(' + lang + ')').get(0).click();
         return false;
     }
     </script>
     <!-- to here -->

 </body>

 </html>