<?php 

/**
* Created by Dickson Msaky @ Ifakara Health Insitute (2018)
**/
require_once('includes/load.php');

$email = $_POST['email'];
$token = $_POST['token'];
$password = $_POST['password'];
$password2 = $_POST['password2'];
$new_password = hashPass($password);
$time = $_POST['time'];
$valid = $_POST['valid'];
$new_valid =0;
$date = make_date();


$sql = "SELECT * FROM staff WHERE email='{$email}'";
$result = $db->query($sql);
$row = $db->fetch_assoc($result); 
$rowc = $db->num_rows($result);
$fname = $row['fname'];

if($rowc == 0 ){

    $session->msg_('d','Failed! Wrong Email address');
    redirect('login.php',false);
}

$sql = "UPDATE staff SET password = '{$new_password}' WHERE email = '{$email}'";
$sqlt = "UPDATE token_key SET valid = '{$new_valid}' WHERE email = '{$email}'";

$sql_valid = "UPDATE staff SET valid = 1 WHERE email='{$email}'";



$subject='Password was succesfully changed ';

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

                                              Your password was changed at $date<br>

                                              Thanks <br><br>

                                              <span style="line-height:20px; font-family:Arial, Helvetica, sans-serif; font-size:10px; color:#4d4d4d; text-align:justify;" valign="top"> 
                                             
                                              Please do not reply this email </span>

                                      

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

if($db->query($sql)){
  //sucess
  $db->query($sqlt);
  sendMail($email,$emailbody,$subject);
  //updating to valid incase activation email failed
   $db->query($sql_valid);
  $session->msg_('s',' Password changed!');
  redirect('login.php', false);
} else {
  //failed
  $session->msg_('d',' Password not changed!');
  redirect('login.php', false);
}



?>