 

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta HTTP-EQUIV=Refresh CONTENT="10; URL=login.php">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Reset Password | MosquitoDB</title>  
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

      <div class="row">
        <div class="col-sm-6" style="float: none; margin: 0 auto;">
          <img src="assets/images/mos22.png" alt=""> 
          <!-- Form vertical (default) -->
          <form action="register.php" method="post">
            <div class="panel panel-default">
             <div class="panel-heading login-top" align="center"> 
              <img src="assets/images/logo.png" alt=""> 
            </div>
            <div class="panel-body">
             <div class="form-group" align="center">
              <h2><u>RESET PASSWORD</u></h2> 
             </div>

              <div class="" align="center">
              <h3>Please Check your email address for instructions on password reset. <br />
                   You will be redirected to login after 10 seconds</h3> 
             </div>

           </div>
         </div>
       </form>

     </div>
   </div>

 </div>
</div>

<!-- from here -->
<style> .goog-te-banner-frame.skiptranslate {
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
  new google.translate.TranslateElement({ pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE, autoDisplay: false }, 'google_translate_element');
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





	
	