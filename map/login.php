<?php

/**
 * Created by Dickson Msaky @ Ifakara Health Insitute (2018)
 **/

require_once('includes/load.php');

if (isset($_GET['KwXqF'])) {

	if ($_GET[KwXqF] == no and $_GET[MjvWW] == 'error') {

		$session->msg_('d', 'Incorrect link.');
		redirect('login.php', false);
	} elseif ($_GET[KwXqF] == no and $_GET[MjvWW] == 'yes') {

		$session->msg_('d', 'Already activated.');
		redirect('login.php', false);
	} elseif ($_GET[KwXqF] == no and $_GET[rNvIl] == 'error') {

		$session->msg_('d', 'Expired Link.');
		redirect('login.php', false);
	}
}


if ($session->isUserLoggedIn(true)) {

	redirect('home.php', false);
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Login | MosquitoDB</title>
	<link type="text/css" rel="stylesheet" href="assets/css/<?php echo $theme; ?>bootstrap.min.css">
	<link type="text/css" rel="stylesheet" href="assets/css/<?php echo $theme; ?>mdb-theme.css">
	<link type="text/css" rel="stylesheet" href="assets/css/<?php echo $theme; ?>styles.css">
	<link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/animate.min.css" />

	<script type="text/javascript" src="assets/js/jquery.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/moment.js"></script>
	<script type="text/javascript" src="assets/js/plugins/interface/jgrowl.min.js"></script>
	<script type="text/javascript" src="assets/js/application.js"></script>

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
						<option data-content='<span class="flag-icon flag-icon-af"></span> English' value="English">English</option>
						<option data-content='<span class="flag-icon flag-icon-al"></span> French' value="French">French</option>
					</select>
				</li>

				<li> <a href="https://mosquitodb.readthedocs.io/" target= "_blank">Getting Started</a> </li>

			</ul>
		</div>
	</div>
	<!-- /navbar -->


	<!-- Page container -->
	<div class="page-container container">
		<div class="page-content">
			<?php echo display_msg_popup($msg); ?>
			<div class="row">
				<div class="col-sm-8 animate__animated animate__fadeIn">
					<!-- Info wrapper -->
					<div class="animate__animated animate__fadeInLeft">
						<img src="assets/images/mos22.png" alt="">
					</div>
					<div class="inf-wrapper">
						<div class="panel panel-default">
							<div class="panel-heading login-top" align="center">
								<img src="assets/images/tit.png" alt="" width=86%>
							</div>
							<div class="panel-body fontsyle">
								<p style="font-size: 14px">
									<br />
									MosquitoDB is an on-going project to support proper data management for diverse entomological studies from
									various experiments, projects, and study sites. The system and associated tools were first developed at
									<a href="https://ihi.or.tz/">Ifakara Health Institute </a> and it was known as Ifakara Entomology Bioinformatics System (IEBS).
									The published <a href="http://scfbm.biomedcentral.com/articles/10.1186/s13029-016-0050-1">article </a> provides details on the generic schema with detailed explanation on how to use the
									schema and paper-based data collection forms – the forms are freely available <a href="https://static-content.springer.com/esm/art%3A10.1186%2Fs13029-016-0050-1/MediaObjects/13029_2016_50_MOESM1_ESM.xlsx">here</a>.
									MosquitoDB’s web-based application is a secure application that can store, link, facilitate data sharing,
									and generate summarized reports from field and laboratory mosquito-based data collected/recorded from
									either paper-or-electronic based data collection forms in standardized formats.

									The MosquitoDB is now maintained by <a href="https://www.pamca.org/">PAMCA </a> – interested collaborators and funding partners are invited
									to support the system.


								</p>

								<p style="font-size: 14px">

									MosquitoDB and associated informatics tools are freely available – our team members are also available to
									provide the required training to interested users such as individual researchers/organizations and/or
									National Malaria Control/Elimination Programs.
								</p>
								<div class="row form-actions">
									<div class="col-xs-12">
										<hr />
										<div class="pull-right hidden-xs">
											MosquitoDB 3.5v
										</div>

										&copy; Copyright <?php echo date("Y"); ?>. All rights reserved.
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="col-sm-4">

					<!-- add this -->
					<!-- 			
               <style> .goog-te-banner-frame.skiptranslate {
    display: none !important;
    } 
body {
    top: 0px !important; 
    }
    </style>
               <select class="selectpicker" data-width="fit" onchange="translateLanguage(this.value);">
               <option data-content='<span class="flag-icon flag-icon-af"></span> English' value="English">English</option>
               <option  data-content='<span class="flag-icon flag-icon-al"></span> French' value="French">French</option>
</select>

-->

					<!-- to here -->
					<!-- Login wrapper -->

					<div class="login-wrapper animate__animated animate__headShake">
						<form action="scripts/auth.php" method="post">
							<div class="panel panel-default">
								<div class="panel-heading login-top" align="center">
									<img src="assets/images/logo.png" alt="" width=82%>
								</div>
								<div class="panel-body">
									<div class="form-group fontsyle" align="center">
										<h4>LOGIN</h4>
									</div>
									<div class="form-group has-feedback animate__animated animate__pulse">
										<label>Email</label>
										<input name="username" type="email" id="username" class="form-control" placeholder="Email" required>
										<i class="fa fa-envelope form-control-feedback"></i>
									</div>

									<div class="form-group has-feedback animate__animated animate__pulse">
										<label>Password</label>
										<input name="password" type="password" id="password" class="form-control" placeholder="Password" required>
										<i class="fa fa-lock form-control-feedback"></i>
									</div>
									<div class="row form-actions">
										<div class="col-xs-12">
											<button type="submit" name="Submit" value="Submit" class="btn btn-primary pull-right"><i class="fa fa-sign-in"></i>Login</button>
										</div>
									</div>

									<div class="row form-actions">
										<div class="col-xs-12">
											<hr />
											First time user? <a href="register.php">Register</a> | Forgot Password<a href="reset_pwd.php"> Reset </a>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- add this -->
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

		$(function() {
			$('.selectpicker').selectpicker();
		});
	</script>
	<!-- to here -->

</body>

</html>