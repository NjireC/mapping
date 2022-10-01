<!DOCTYPE html>
<html lang="en">

<head>
    <?php

    /**
     * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
     **/

    require_once('includes/load.php');


    if (isset($_GET['KwXqF'])) {
        if ($_GET['KwXqF'] == 'no' and $_GET['rNvIl'] == 'err') {
            $session->msg_('d', ' Link expired. Please complete the registration form again');
            delete_by_("staff", "email", $_GET['email']);
            redirect('register.php', FALSE);
        }
    }

    if (isset($_GET['KwXqF'])) {
        if ($_GET['KwXqF'] == 'no-email') {
            $session->msg_('d', ' Something went wrong. Please register again.');
            redirect('register.php', FALSE);
        }
    }

    $staffid = gen_id();

    if (isset($_POST['Register'])) {

        $req_fields = array(
            'firstname',
            'secondname',
            'lastname',
            'mobnumber',
            'email',
            'username',
            'password',
            'password2'
        );
        validate_fields($req_fields);
        validate_email($_POST['email']);
        validate_captcha($_POST['g-recaptcha-response']);

        if (empty($errors)) {

            $fname   = ucfirst(remove_junk($db->escape($_POST['firstname'])));
            $sname   = ucfirst(remove_junk($db->escape($_POST['secondname'])));
            $lname   = ucfirst(remove_junk($db->escape($_POST['lastname'])));
            $username = remove_junk($db->escape($_POST['username']));
            $email   = remove_junk($db->escape($_POST['email']));
            $phone   = remove_junk($db->escape($_POST['mobnumber']));
            $password = remove_junk($db->escape($_POST['password']));
            $password = hashPass($password);
            $time    = $_SERVER["REQUEST_TIME"];
            $query   = "INSERT INTO staff (";
            $query   .= "staff_id,fname,mname,lname,username,password,status,seculevel,mobinum,email,register,staff_group,valid,staff_log";
            $query   .= ") VALUES (";
            $query   .= "'{$staffid}', '{$fname}', '{$sname}', '{$lname}','{$username}','{$password}', '1','2','{$phone}','{$email}','1','1','0','{$time}'";
            $query   .= ")";

            $link   = $url . '/AAKwXqFVnn.php?email=' . $email . '&qFVnn=' . $time . '&MjvWW=0';
            $subject = 'Activate your account on MosquitoDB ';

            $emailbody = <<<EOT
  <div style="width:100%!important;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;font-family:Arial, Helvetica, sans-serif;">
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

                                              You have created your account successfully. <br>
                                              To activate your account please click the link below. <br><br>
                                              
                                              <a style="margin:3px 0;border-style:solid;display:inline-block;border-width:15px 45px;border-color:#009551;background-color:#009551;font-size:12px;font-weight:normal;text-decoration:none;white-space:nowrap;font-family:Arial, Helvetica, sans-serif;color:#ffffff" href="$link" target="_blank">Activate account</a> <br><br>

                                              <span style="line-height:20px; font-family:Arial, Helvetica, sans-serif; font-size:10px; color:#4d4d4d; text-align:justify;" valign="top">
                                              *Please activate the link within 24 hours or you will need to start the registration process over again<br>
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

            if ($db->query($query)) {
                //sucess
                sendMail($email, $emailbody, $subject);
                //redirect('register_msg.php', false);

                $_SESSION['msg'] = '<script type="text/javascript">' . ' $(document).ready(function(){' . "$('#dialog_verify').modal();" . ' });' . '</script>';
            } else {
                //failed
                $session->msg_('d', ' Sorry failed to register!');
                redirect('register.php', FALSE);
            }
        } else {
            $session->msg_("d", $errors);
            redirect('register.php', FALSE);
        }
    }
    ?>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php if (!empty($page_title)) {
                echo remove_junk($page_title);
            } elseif (!empty($user)) {
                echo ucfirst($user['name']);
            } else {
                echo "MosquitoDB v3.0";
            } ?>
    </title>
    <link type="text/css" rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="assets/css/mdb-theme.css">
    <link type="text/css" rel="stylesheet" href='assets/css/select2.css'>
    <link type="text/css" rel="stylesheet" href="assets/css/styles.css">
    <link type="text/css" rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="assets/css/jquery-ui.css">
    <link type="text/css" rel="stylesheet" href="assets/css/ui.theme.css">
    <link type="text/css" rel="stylesheet" href="assets/css/bootstrap-table.css">
    <link type="text/css" rel="stylesheet" href="assets/css/bootstrap-tour.min.css">
    <link type="text/css" rel="stylesheet" href="assets/css/jquery-ui.css">
    <link type="text/css" rel="stylesheet" href="assets/css/ui.daterangepicker.css" />
    <link type="text/css" rel="stylesheet" href="assets/css/daterangepicker-bs3.css">
    <link type="text/css" rel="stylesheet" href="assets/css/animate.min.css" />

    <script type="text/javascript" src="assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/moment.min.js"></script>
    <script type="text/javascript" src="assets/js/ajaxupload.3.5.js"></script>
    <script type="text/javascript" src="assets/js/Chart.min.js"></script>
    <script type="text/javascript" src="assets/js/application.js"></script>
    <script type="text/javascript" src="assets/js/pwstrength.js"></script>
    <script type="text/javascript" src="assets/js/tour.js"></script>

    <script type="text/javascript" src="app2.js"></script>
    <script type="text/javascript" src="chome.js"></script>
    <script src='https://www.google.com/recaptcha/api.js'></script>

    <script type="text/javascript" src="assets/js/daterange/date.js"></script>
    <script type="text/javascript" src="assets/js/chartjs-plugin-labels.js"></script>
    <script type="text/javascript" src="assets/js/daterange/daterangepicker.jQuery.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/uniform.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/select2.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/inputmask.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/autosize.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/inputlimit.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/listbox.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/multiselect.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/validate.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/tags.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/uploader/plupload.full.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/uploader/plupload.queue.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/wysihtml5/wysihtml5.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/wysihtml5/toolbar.js"></script>

    <script type="text/javascript" src="assets/js/plugins/interface/jgrowl.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/interface/prettify.js"></script>
    <script type="text/javascript" src="assets/js/plugins/interface/fancybox.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/interface/timepicker.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/interface/fullcalendar.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/interface/colorpicker.js"></script>
    <script type="text/javascript" src="assets/js/plugins/interface/collapsible.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/interface/bootstrap-tour.min.js"></script>

    <script type="text/javascript" src="assets/js/table/bootstrap-table.min.js"></script>
    <script type="text/javascript" src='assets/js/table/bootstrap-table-editable.min.js'></script>
    <script type="text/javascript" src="assets/js/table/bootstrap-table-export.js?"></script>
    <script type="text/javascript" src="assets/js/table/tableExport.js"></script>
    <script type="text/javascript" src="assets/js/table/FileSaver.min.js"></script>
    <script type="text/javascript" src="assets/js/table/jspdf.min.js"></script>
    <script type="text/javascript" src="assets/js/table/jspdf.plugin.autotable.js"></script>
    <script type="text/javascript" src="assets/js/table/jquery.base64.js"></script>
    <script type="text/javascript" src="assets/js/table/bootstrap-table-toolbar.js"></script>
    <script type="text/javascript" src="assets/js/table/bootstrap-table-sticky-header.js"></script>
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
                        <option data-content='<span class="flag-icon flag-icon-al"></span> French' value="French">French
                        </option>
                    </select>
                </li>

                <li> <a href="https://mosquitodb.readthedocs.io/" target= "_blank"> <span> Getting Started</span> </a> </li>

            </ul>
        </div>
    </div>
    <!-- /navbar -->

    <!-- Page container -->
    <div class="page-container container">
        <div class="page-content">

            <?php echo display_msg_popup($msg); ?>

            <div class="row">
                <div class="col-sm-6 register-wrapper animate__animated animate__fadeIn" style="float: none; margin: 0 auto;">

                    <div class="animate__animated animate__fadeInLeft">
                        <img src="assets/images/mos22.png" alt="">
                    </div>

                    <!-- Form vertical (default) -->
                    <form action="register.php" method="post">
                        <div class="panel panel-default">
                            <div class="panel-heading login-top" align="center">
                                <img src="assets/images/logo.png" alt="" width=56%>
                            </div>
                            <div class="panel-body">
                                <div class="form-group" align="center">
                                    <h4>REGISTER</h4>
                                </div>

                                <div class="form-group">
                                    <label>First Name</label>
                                    <input type="text" class="form-control" name="firstname" id="firstname" required>
                                </div>

                                <div class="form-group">
                                    <label>Second Name</label>
                                    <input type="text" class="form-control" name="secondname" id="secondname" required>
                                </div>

                                <div class="form-group">
                                    <label>Last Name</label>
                                    <input type="text" class="form-control" name="lastname" id="lastname" required>
                                </div>

                                <div class="form-group">
                                    <label>Mobile Number</label>
                                    <input type="text" class="form-control" name="mobnumber" id="mobnumber" required>
                                </div>

                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" class="form-control" name="email" id="email" required>
                                </div>

                                <div class="form-group">
                                    <label>Username</label>
                                    <input type="text" class="form-control" name="username" id="username" required>
                                </div>

                                <div id="fpwd1" class="form-group">
                                    <label>Password</label>
                                    <input type="password" class="form-control" name="password" id="password" onkeyup="CheckPasswordStrength(this.value)" data-toggle="tooltip" data-trigger="focus" title="Password must be greater 6,lowercase,Uppercase and special characters" required />
                                    <span id="password_strength"></span>
                                </div>

                                <div id="fpwd2" class="form-group">
                                    <label>Confirm Password</label>
                                    <input type="password" class="form-control" name="password2" id="password2" onkeyup="checkPass(); return false;" required>
                                    <span id="confirmMessage" class="confirmMessage"></span>
                                </div>


                                <div class="form-group">
                                    <div class="g-recaptcha" data-sitekey="<?php echo SITE_KEY; ?>"></div>
                                </div>


                                <input type="submit" name="Register" id="Register" value="Submit" class="btn btn-lg btn-primary btn-block">


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


    <!-- modal -->
    <div id="dialog_verify" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h2 class="modal-title">Verify your email to activate your account &hellip;</h2>
                </div>

                <div class="modal-body has-padding">

                    <?php

                    $msg_modal = <<<EOT
                   <h4> Dear&nbsp;{$fname}, </h4>
                    <p> </p>
                   <h4> An activation email has been sent to your email address: <span class="text-info">$email</span>,
                        please check your inbox or spam to activate and proceed.
                   </h4>

EOT;

                    echo $msg_modal;

                    ?>
                </div>

                <div class="modal-footer">
                    <a class="btn btn-primary" href="login.php">Okay</a>
                </div>
            </div>
        </div>
    </div>
    <!-- /modal -->

    <?php
    echo $_SESSION['msg'];
    unset($_SESSION['msg']); ?>


    <!-- from here -->

    <style>
        .goog-te-banner-frame.skiptranslate {
            display: none !important;
        }

        body {
            top: 0px !important;
        }
    </style>

    <script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit" type="text/javascript"></script>
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