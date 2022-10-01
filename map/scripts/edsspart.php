<?php

 include_once('../includes/load.php');

include("transpose.php");

//retrive project code value from get function
$projectcode = $_POST["cp"];
//retrive type of report
$typereport = $_POST["rp"];







//function to generate report
function report($type, $projectcode, $db)
{//start of report function
	global $db;
	//partialy report of EDSS

	$base_dir  = __DIR__; // Absolute path to the installation
	$doc_root  = preg_replace("!${_SERVER['SCRIPT_NAME']}$!", '', $_SERVER['SCRIPT_FILENAME']); 
	$base_url  = preg_replace("!^${doc_root}!", '', $base_dir); 




	$prefixtable = $projectcode."_";

	$ed1 = $prefixtable."ed1";
	$ss1 = $prefixtable."ss1";
	$ss3 = $prefixtable."ss3";
	$edss = $prefixtable."edss";
	$ssso = $prefixtable."ssso";

    $so1 = $prefixtable."so1_sk";


	 $pname = "SELECT CONCAT(projectreg.pc,\"_\",projectreg.expno) AS Project_Code 
     FROM projectreg WHERE id=$projectcode";

      //execute query 
        $pnameresult = $db->query($pname);
        //detect number of row from query execute above
        $pnamenum_row = mysqli_num_rows($pnameresult);
        if($pnamenum_row == 1)
        {
            //fetch data from query executed above
            $pnamerow = mysqli_fetch_array($pnameresult);
           
            $_SESSION["projectname"] = $pnamerow["Project_Code"]; 
            $prname =   $_SESSION["projectname"];          
        }



	 $edquery = "SELECT custed.num_split, custed.p_attri  FROM custed  WHERE custed.pc=$projectcode AND  custed.ft='ed1'";
        //execute query 
        $edresult = $db->query($edquery);
        //detect number of row from query execute above
        $ednum_row = mysqli_num_rows($edresult);
        if($ednum_row == 1)
        {
            //fetch data from query executed above
            $edrow = mysqli_fetch_array($edresult);

         
           
            $_SESSION["SESS_P_ATTRI"] = $edrow["p_attri"]; 
            $edcol2 =   $_SESSION["SESS_P_ATTRI"]; 

              $edcol = renamecol($edcol2,"ed1","ED");         
        }


        $ss3query = "SELECT *  FROM custss  WHERE pc=$projectcode AND ft='SS3'";
        //execute query 
        $ss3result = $db->query($ss3query);
        //detect number of row from query execute above
        $ss3num_row = mysqli_num_rows($ss3result);
        if($ss3num_row == 1)
        {
            //fetch data from query executed above
            $ss3row = mysqli_fetch_array($ss3result);

               //remove attribute method
		    $ssen_remove = str_replace("ssen,","",$ss3row["p_attri"]);

		    $ssen_remove = str_replace("sfr,","",$ssen_remove);

          //  $_SESSION["SESS_P_ATTRIss3"] = $ssen_remove; 
            $ss3col2 =  $ssen_remove;  

            $ss3col =  renamecolss3($ss3col2,"ss1","SS");

                     
        }

        $ss1query = "SELECT * FROM custss  WHERE pc=$projectcode AND ft='SS1'";
        //execute query 
        $ss1result = $db->query($ss1query);
        //detect number of row from query execute above
        $ss1num_row = mysqli_num_rows($ss1result);
        if($ss1num_row == 1)
        {
            //fetch data from query executed above
            $ss1row = mysqli_fetch_array($ss1result);

               //remove attribute method
		    $ss1ssen_remove = $ss1row["p_attri"];



           
          //  $_SESSION["SESS_P_ATTRIss3"] = $ssen_remove; 
            $ss1col2 =  $ss1ssen_remove;  

            $ss1col =  renamecolss1($ss1col2,"ss1","SS");

                     
        }

        $so1query = "SELECT * FROM custso  WHERE pc=$projectcode AND ft='SO1'";
        //execute query 
        $so1result = $db->query($so1query);
        //detect number of row from query execute above
        $so1num_row = mysqli_num_rows($so1result);
        if($so1num_row == 1)
        {
            //fetch data from query executed above
            $so1row = mysqli_fetch_array($so1result);

               //remove attribute method
		    $so1ssen = $so1row["p_attri"];


            $so1col =  renamecolso1($so1ssen,"so1","SO");

                     
        }

       


	if($type == 1)
	{
		
		//query to fetch data from custed table for EDs
		$query = "SELECT ft, p_attri FROM custed WHERE pc='$projectcode' AND ft='ED1'";
		//execute query
		$result = $db->query($query) or die( mysqli_error($db));
		//mysql fetch data from result above
		$row = mysqli_fetch_array($result);
		//remove attribute method
		$meth_remove2 = str_replace("me,","",$row["p_attri"]);

		$meth_remove = renamecol($meth_remove2); 
		//insert string
		$insert_str= ",".strtolower($row["ft"]).".";
		//And table name in first part andinsert table name after commer
		$insert_tb = strtolower($row["ft"]).".".str_replace(",", $insert_str, $meth_remove);

		$query="SELECT
		site.site_name AS SITE_NAME
		  ,CONCAT(projectreg.pc,\"  \") AS PROJECT_CODE
		,projectreg.expno AS EXPERIMENT
		,ed1.sen AS SEN
		, ed1.st AS ST
		, ed1.ft AS FT
		,$insert_tb
		,$ss1col, 
		 	
	    SUM(CASE WHEN ss1.sas = '1' THEN ss1.n ELSE 0 END) AS TOTAL_MALE,
	    SUM(CASE WHEN ss1.sas = '2' THEN ss1.n ELSE 0 END) AS UNFED,
	    SUM(CASE WHEN ss1.sas = '3' THEN ss1.n ELSE 0 END) AS PARTLY_FED,
	    SUM(CASE WHEN ss1.sas = '4' THEN ss1.n ELSE 0 END) AS FED,
	    SUM(CASE WHEN ss1.sas = '5' THEN ss1.n ELSE 0 END) AS GRAVID_SEMIGRAVID,
	    SUM(CASE WHEN ss1.sas = '6' THEN ss1.n ELSE 0 END) AS TOTAL_FEMALE

		FROM
		projectregsite
		INNER JOIN projectreg 
		ON (projectregsite.projectreg_id = projectreg.id)
		INNER JOIN site 
		ON (projectregsite.site_id = site.site_id)
		INNER JOIN $ed1 as ed1
		ON (ed1.projectregsite_id = projectregsite.id)
		INNER JOIN $edss as edss
		ON (ed1.id = edss.ed1id)
		INNER JOIN $ss1 as ss1 
		ON (ss1.edssid = edss.id)
		LEFT JOIN method 
		ON (ed1.me = method.meth_code)
		LEFT JOIN taxon 
		ON (ss1.tx = taxon.taxon_code)
		LEFT JOIN sexabdominal 
		ON (ss1.sas = sexabdominal.sex_code)
	    GROUP BY ss1.senfr ORDER BY ss1.sen ASC,ss1.fr ASC";
		$result = $db->query($query) or die( mysqli_error( $db ) );
		//
		// send response headers to the browser
		// following headers instruct the browser to treat the data as a csv file called EDSS_partialy.csv
		//
		/*header('Content-Description: File Transfer');
		header( 'Content-Type: text/csv' );
		header( 'Content-Disposition: attachment;filename='.$prname.'_ED1_SS1_SASTransposed.csv' );
		header('Content-Transfer-Encoding: binary');
		header('Expires: 0');
		header('Cache-Control:must-revalidate, post-check=0, pre-check=0');
		header('Pragma: public'); */
		

		if (!file_exists("dataset/".$projectcode)) {
		    mkdir("dataset/".$projectcode, 0777, true);
		}

		$filename = "dataset/".$projectcode."/".$prname."_ED1_SS1_SASTransposed.csv";


		$file = fopen($filename,"w") or die("Can't open file $name for writing.");


		$row = mysqli_fetch_assoc( $result );
		if ( $row )
		{
		//echocsv( array_keys( $row ) );
		fputcsv($file, array_keys( $row ));
		}
		//
		// output data rows (if atleast one row exists)
		//
		while ( $row )
		{
		//echocsv( $row );
		fputcsv($file, $row);
		$row = mysqli_fetch_assoc( $result );
		}

		$gt =  $base_url."/".$filename;

		//echo $gt;

		//echo '<p><input type="button" name="Back" value="Back" onclick="window.location ='.$filename.'" /></p>';

		echo '<button type="button" class="btn btn-primary btn-lg"><a class="btn-custom" href = "'.$filename.'" download>  <i class="fa fa-download"> </i>Click to Download!</a></button>';

		
                      

		
	}
    //report of adult mosquitoes transpose taxon
	if($type == 46)
	{
		//query to fetch data from custed table for EDs
		$query = "SELECT ft, p_attri FROM custed WHERE pc='$projectcode' AND ft='ED1'";
		//execute query
		$result = $db->query($query) or die( mysqli_error( $db ));
		//mysql fetch data from result above
		$row = mysqli_fetch_array($result);
		//remove attribute method
		$meth_remove2 = str_replace("me,","",$row["p_attri"]);

		$meth_remove = renamecol($meth_remove2); 
		//insert string
		$insert_str= ",".strtolower($row["ft"]).".";
		//And table name in first part andinsert table name after commer
		$insert_tb = strtolower($row["ft"]).".".str_replace(",", $insert_str, $meth_remove);
		//call function to transpose
		// Removed body part not on SS1 - SK 
		//, bodypart.body_name AS BodyPart, no need to display ss1.fr since it is grouped by ss1.sen
		list($errornum, $columnTranspose) =transposeTaxonSAS("taxon", $projectcode, "ss1");
		if($errornum == 1)
		{
			$columnTranspose=$columnTranspose;
		}
		$query="SELECT
	     @rownum := @rownum + 1 AS ID
		,site.site_name AS SITE_NAME
		,projectreg.pc AS PROJECT_CODE
		,projectreg.expno AS EXPERIMENT
		,ed1.sen AS ED_SEN
            
		,$edcol
		,ss1.sen AS SERIAL_SS1
		,ss1.fr AS FORMROW_SS1
                ,ss1.tx AS TAXON_SS1	
		$columnTranspose
		FROM
		projectregsite
		INNER JOIN projectreg 
		ON (projectregsite.projectreg_id = projectreg.id)
		INNER JOIN site 
		ON (projectregsite.site_id = site.site_id)
		INNER JOIN $ed1 as ed1
		ON (ed1.projectregsite_id = projectregsite.id)
		INNER JOIN $edss as edss
		ON (ed1.id = edss.ed1id)
		INNER JOIN $ss1 as ss1 
		ON (ss1.edssid = edss.id)
		LEFT JOIN method 
		ON (ed1.me = method.meth_code)
		LEFT JOIN taxon 
		ON (ss1.tx = taxon.taxon_code)
		LEFT JOIN sexabdominal 
		ON (ss1.sas = sexabdominal.sex_code) GROUP BY ID
	    ORDER BY ed1.sen ASC ,ed1.fr ASC";
		//echo $query;
		//exit();
        $db->query("SET @rownum := 0;");
		$result = $db->query( $query) or die( mysqli_error( $db ) );


		
	//
		// send response headers to the browser
		// following headers instruct the browser to treat the data as a csv file called EDSS_partialy.csv
		//
		/*header('Content-Description: File Transfer');
		header( 'Content-Type: text/csv' );
		header( 'Content-Disposition: attachment;filename='.$prname.'_ED1_SS1_TaxonTransposed.csv' );
		header('Content-Transfer-Encoding: binary');
		header('Expires: 0');
		header('Cache-Control:must-revalidate, post-check=0, pre-check=0');
		header('Pragma: public'); */
		

		if (!file_exists("dataset/".$projectcode)) {
		    mkdir("dataset/".$projectcode, 0777, true);
		}

		$filename = "dataset/".$projectcode."/".$prname."_ED1_SS1_TaxonTransposed.csv";


		$file = fopen($filename,"w") or die("Can't open file $name for writing.");


		$row = mysqli_fetch_assoc( $result );
		if ( $row )
		{
		//echocsv( array_keys( $row ) );
		fputcsv($file, array_keys( $row ));
		}
		//
		// output data rows (if atleast one row exists)
		//
		while ( $row )
		{
		//echocsv( $row );
		fputcsv($file, $row);
		$row = mysqli_fetch_assoc( $result );
		}

		$gt =  $base_url."/".$filename;

		//echo $gt;

		//echo '<p><input type="button" name="Back" value="Back" onclick="window.location ='.$filename.'" /></p>';

		echo '<button type="button" class="btn btn-primary btn-lg"><a class="btn-custom" href = "'.$filename.'" download>  <i class="fa fa-download"> </i>Click to Download!</a></button>';

		
                      

		
	
	}//end of report transpose function
//}//end of function report()	
	//report of adult mosquitoes
	if($type == 24)
	{
		//query to fetch data from custed table for EDs
		$query = "SELECT ft, p_attri FROM custed WHERE pc='$projectcode' AND ft='ED1'";
		//execute query
		$result = $db->query($query ) or die( mysqli_error( $db ));
		//mysql fetch data from result above
		$row = mysqli_fetch_array($result);
		//remove attribute method
		$meth_remove2 = str_replace("me,","",$row["p_attri"]);

		$meth_remove = renamecol($meth_remove2); 
		//insert string
		$insert_str= ",".strtolower($row["ft"]).".";
		//And table name in first part andinsert table name after commer
		$insert_tb = strtolower($row["ft"]).".".str_replace(",", $insert_str, $meth_remove);

		$query="SELECT
	    site.site_name AS SITE_NAME
		,projectreg.pc AS PROJECT_CODE
		,projectreg.expno AS EXPERIMENT
		,ed1.sen AS ED_SEN
		,$edcol
		,$ss1col
		FROM
		projectregsite
		INNER JOIN projectreg 
		ON (projectregsite.projectreg_id = projectreg.id)
		INNER JOIN site 
		ON (projectregsite.site_id = site.site_id)
		INNER JOIN $ed1 as ed1
		ON (ed1.projectregsite_id = projectregsite.id)
		INNER JOIN $edss as edss
		ON (ed1.id = edss.ed1id)
		INNER JOIN $ss1 as ss1 
		ON (ss1.edssid = edss.id)
		LEFT JOIN method 
		ON (ed1.me = method.meth_code)
		LEFT JOIN taxon 
		ON (ss1.tx = taxon.taxon_code)
		LEFT JOIN sexabdominal 
		ON (ss1.sas = sexabdominal.sex_code)
		ORDER BY ed1.sen ASC, ed1.fr ASC";
		$result = $db->query($query ) or die( mysqli_error( $db ) );
		// 
		// send response headers to the browser
		// following headers instruct the browser to treat the data as a csv file called EDSS_partialy.csv
		//
		/*header('Content-Description: File Transfer');
		header( 'Content-Type: text/csv' );
		header( 'Content-Disposition: attachment;filename='.$prname.'_ED1_SS1.csv' );
		header('Content-Transfer-Encoding: binary');
		header('Expires: 0');
		header('Cache-Control:must-revalidate, post-check=0, pre-check=0');
		header('Pragma: public'); */


		if (!file_exists("dataset/".$projectcode)) {
		    mkdir("dataset/".$projectcode, 0777, true);
		}

		$filename = "dataset/".$projectcode."/".$prname."_ED1_SS1.csv";


		$file = fopen($filename,"w") or die("Can't open file $name for writing.");


		$row = mysqli_fetch_assoc( $result );
		if ( $row )
		{
		//echocsv( array_keys( $row ) );
		fputcsv($file, array_keys( $row ));
		}
		//
		// output data rows (if atleast one row exists)
		//
		while ( $row )
		{
		//echocsv( $row );
		fputcsv($file, $row);
		$row = mysqli_fetch_assoc( $result );
		}

		$gt =  $base_url."/".$filename;

		//echo $gt;

		//echo '<p><input type="button" name="Back" value="Back" onclick="window.location ='.$filename.'" /></p>';

		echo '<button type="button" class="btn btn-primary btn-lg"><a class="btn-custom" href = "'.$filename.'" download>  <i class="fa fa-download"> </i>Click to Download!</a></button>';

		
                      

	
	}

	if($type == 26)
	{
		//query to fetch data from custed table for EDs
		$query = "SELECT ft, p_attri FROM custed WHERE pc='$projectcode' AND ft='ED1'";
		//execute query
		$result = $db->query($query ) or die( mysqli_error( $db ));
		//mysql fetch data from result above
		$row = mysqli_fetch_array($result);
		
		$query="SELECT
		site.site_name AS SITE_NAME
		,projectreg.pc AS PROJECT_CODE
		,projectreg.expno AS EXPERIMENT
		,ed1.sen AS ED_SEN
		,$edcol
		, method.meth_abbre AS ME
		,$ss3col
		FROM
		projectregsite
		INNER JOIN projectreg 
		ON (projectregsite.projectreg_id = projectreg.id)
		INNER JOIN site 
		ON (projectregsite.site_id = site.site_id)
		INNER JOIN $ed1 as ed1
		ON (ed1.projectregsite_id = projectregsite.id)
		INNER JOIN $edss as edss
		ON (ed1.id = edss.ed1id)
		INNER JOIN $ss3 as ss1 
		ON (ss1.edssid = edss.id)
		LEFT JOIN method 
		ON (ed1.me = method.meth_code)
		LEFT JOIN taxon 
		ON (ss1.tx = taxon.taxon_code)
		LEFT JOIN sexabdominal 
		ON (ss1.sas = sexabdominal.sex_code)
	    ORDER BY ed1.sen ASC,ed1.fr ASC";
		$result = $db->query($query ) or die( mysqli_error( $db ) );
		//
		// send response headers to the browser
		// following headers instruct the browser to treat the data as a csv file called EDSS_partialy.csv
		//
		/*header('Content-Description: File Transfer');
		header( 'Content-Type: text/csv' );
		header( 'Content-Disposition: attachment;filename='.$prname.'_ED1_SS3.csv' );
		header('Content-Transfer-Encoding: binary');
		header('Expires: 0');
		header('Cache-Control:must-revalidate, post-check=0, pre-check=0');
		header('Pragma: public'); */
		

		if (!file_exists("dataset/".$projectcode)) {
		    mkdir("dataset/".$projectcode, 0777, true);
		}

		$filename = "dataset/".$projectcode."/".$prname."_ED1_SS3.csv";


		$file = fopen($filename,"w") or die("Can't open file $name for writing.");


		$row = mysqli_fetch_assoc( $result );
		if ( $row )
		{
		//echocsv( array_keys( $row ) );
		fputcsv($file, array_keys( $row ));
		}
		//
		// output data rows (if atleast one row exists)
		//
		while ( $row )
		{
		//echocsv( $row );
		fputcsv($file, $row);
		$row = mysqli_fetch_assoc( $result );
		}

		$gt =  $base_url."/".$filename;

		//echo $gt;

		//echo '<p><input type="button" name="Back" value="Back" onclick="window.location ='.$filename.'" /></p>';

		echo '<button type="button" class="btn btn-primary btn-lg"><a class="btn-custom" href = "'.$filename.'" download>  <i class="fa fa-download"> </i>Click to Download!</a></button>';

		
                      

	}
	
//report of adult mosquitoes transpose taxon - adding sso1
	if($type == 15)
	{
		echo "Contact Sam or Alpha - You need to have SO customized first";
	}
	if($type == 40)
	{
		
		//query to fetch data from custed table for EDs
		$query = "SELECT ft, p_attri FROM custed WHERE pc='$projectcode' AND ft='ED1'";
		//execute query
		$result = $db->query($query ) or die( mysqli_error( $db ));
		//mysql fetch data from result above
		$row = mysqli_fetch_array($result);
		//remove attribute method
		$meth_remove2 = str_replace("me,","",$row["p_attri"]);

		$meth_remove = renamecol($meth_remove2); 
		//insert string
		$insert_str= ",".strtolower($row["ft"]).".";
		//And table name in first part andinsert table name after commer
		$insert_tb = strtolower($row["ft"]).".".str_replace(",", $insert_str, $meth_remove);
		$query="SELECT
		 site.site_name AS SITE_NAME
		,projectreg.pc AS PROJECT_CODE
		,projectreg.expno AS EXPERIMENT
		,ed1.sen AS ED_SEN
		,$edcol
		,$ss1col 
		,so1.sen AS SO_SEN  
		,$so1col
		FROM
		projectregsite
		INNER JOIN projectreg 
		ON (projectregsite.projectreg_id = projectreg.id)
		INNER JOIN site 
		ON (projectregsite.site_id = site.site_id)
		INNER JOIN $ed1 as ed1
		ON (ed1.projectregsite_id = projectregsite.id)
		INNER JOIN $edss as edss
		ON (ed1.id = edss.ed1id)
		INNER JOIN $ss1 as ss1 
		ON (ss1.edssid = edss.id)
		left JOIN $so1 as so1 
        ON (ss1.sen = so1.ssen AND ss1.fr = so1.sfr)
	    ORDER BY ed1.sen ASC,ed1.fr ASC";


		$result = $db->query($query ) or die( mysqli_error( $db ) );
		//
		// send response headers to the browser
		// following headers instruct the browser to treat the data as a csv file called EDSS_partialy.csv
		//
		/*header('Content-Description: File Transfer');
		header( 'Content-Type: text/csv' );
		header( 'Content-Disposition: attachment;filename='.$prname.'_ED1_SS1_SO1.csv' );
		header('Content-Transfer-Encoding: binary');
		header('Expires: 0');
		header('Cache-Control:must-revalidate, post-check=0, pre-check=0');
		header('Pragma: public'); */
		

		if (!file_exists("dataset/".$projectcode)) {
		    mkdir("dataset/".$projectcode, 0777, true);
		}

		$filename = "dataset/".$projectcode."/".$prname."_ED1_SS1_SO1.csv";


		$file = fopen($filename,"w") or die("Can't open file $name for writing.");


		$row = mysqli_fetch_assoc( $result );
		if ( $row )
		{
		//echocsv( array_keys( $row ) );
		fputcsv($file, array_keys( $row ));
		}
		//
		// output data rows (if atleast one row exists)
		//
		while ( $row )
		{
		//echocsv( $row );
		fputcsv($file, $row);
		$row = mysqli_fetch_assoc( $result );
		}

		$gt =  $base_url."/".$filename;

		//echo $gt;

		//echo '<p><input type="button" name="Back" value="Back" onclick="window.location ='.$filename.'" /></p>';

		echo '<button type="button" class="btn btn-primary btn-lg"><a class="btn-custom" href = "'.$filename.'" download>  <i class="fa fa-download"> </i>Click to Download!</a></button>';

		
                      


	
	}//end of report transpose function

	if($type == 61)
	{
		
		//query to fetch data from custed table for EDs
		$query = "SELECT ft, p_attri FROM custed WHERE pc='$projectcode' AND ft='ED1'";
		//execute query
		$result = $db->query($query ) or die( mysqli_error( $db ));
		//mysql fetch data from result above
		$row = mysqli_fetch_array($result);
		//remove attribute method
		$meth_remove2 = str_replace("me,","",$row["p_attri"]);

		$meth_remove = renamecol($meth_remove2); 
		//insert string
		$insert_str= ",".strtolower($row["ft"]).".";
		//And table name in first part andinsert table name after commer
		$insert_tb = strtolower($row["ft"]).".".str_replace(",", $insert_str, $meth_remove);
		$query="SELECT
		 site.site_name AS SITE_NAME
		,projectreg.pc AS PROJECT_CODE
		,projectreg.expno AS EXPERIMENT
		,ed1.sen AS ED_SEN
		,$edcol
		,$ss1col 
		,so1.sen AS SO_SEN  
		,$so1col
		FROM
		projectregsite
		INNER JOIN projectreg 
		ON (projectregsite.projectreg_id = projectreg.id)
		INNER JOIN site 
		ON (projectregsite.site_id = site.site_id)
		INNER JOIN $ed1 as ed1
		ON (ed1.projectregsite_id = projectregsite.id)
		INNER JOIN $edss as edss
		ON (ed1.id = edss.ed1id)
		INNER JOIN $ss1 as ss1 
		ON (ss1.edssid = edss.id)
		INNER JOIN $so1 as so1 
        ON (ss1.sen = so1.ssen AND ss1.fr = so1.sfr)
		ORDER BY ed1.sen ASC,ed1.fr ASC";


		$result = $db->query($query ) or die( mysqli_error( $db ) );
		//
		// send response headers to the browser
		// following headers instruct the browser to treat the data as a csv file called EDSS_partialy.csv
		//
		/*header('Content-Description: File Transfer');
		header( 'Content-Type: text/csv' );
		header( 'Content-Disposition: attachment;filename='.$prname.'_ED1_SS1_SO1.csv' );
		header('Content-Transfer-Encoding: binary');
		header('Expires: 0');
		header('Cache-Control:must-revalidate, post-check=0, pre-check=0');
		header('Pragma: public'); */
		


		if (!file_exists("dataset/".$projectcode)) {
		    mkdir("dataset/".$projectcode, 0777, true);
		}

		$filename = "dataset/".$projectcode."/".$prname."_ED1_SS1_SO1.csv";


		$file = fopen($filename,"w") or die("Can't open file $name for writing.");


		$row = mysqli_fetch_assoc( $result );
		if ( $row )
		{
		//echocsv( array_keys( $row ) );
		fputcsv($file, array_keys( $row ));
		}
		//
		// output data rows (if atleast one row exists)
		//
		while ( $row )
		{
		//echocsv( $row );
		fputcsv($file, $row);
		$row = mysqli_fetch_assoc( $result );
		}

		$gt =  $base_url."/".$filename;

		//echo $gt;

		//echo '<p><input type="button" name="Back" value="Back" onclick="window.location ='.$filename.'" /></p>';

		echo '<button type="button" class="btn btn-primary btn-lg"><a class="btn-custom" href = "'.$filename.'" download>  <i class="fa fa-download"> </i>Click to Download!</a></button>';

		
                      

		
	
	}//end of report transpose function
	
         //report of adult mosquitoes transpose taxon
	if($type == 62)
	{
		//query to fetch data from custed table for EDs
		$query = "SELECT ft, p_attri FROM custed WHERE pc='$projectcode' AND ft='ED1'";
		//execute query
		$result = $db->query($query) or die( mysqli_error( $db ));
		//mysql fetch data from result above
		$row = mysqli_fetch_array($result);
		//remove attribute method
		$meth_remove2 = str_replace("me,","",$row["p_attri"]);

		$meth_remove = renamecol($meth_remove2); 
		//insert string
		$insert_str= ",".strtolower($row["ft"]).".";
		//And table name in first part andinsert table name after commer
		$insert_tb = strtolower($row["ft"]).".".str_replace(",", $insert_str, $meth_remove);
		//call function to transpose
		// Removed body part not on SS1 - SK 
		//, bodypart.body_name AS BodyPart, no need to display ss1.fr since it is grouped by ss1.sen
		list($errornum, $columnTranspose) =transposeTaxonSAS("taxon", $projectcode, "ss1");
		if($errornum == 1)
		{
			$columnTranspose=$columnTranspose;
		}
		$query="SELECT
	     @rownum := @rownum + 1 AS ID
		,site.site_name AS SITE_NAME
		,projectreg.pc AS PROJECT_CODE
		,projectreg.expno AS EXPERIMENT
		,ed1.sen AS ED_SEN
            
		,$edcol
		,ss1.sen AS SERIAL_SS1
		,ss1.fr AS FORMROW_SS1	
		 $columnTranspose
		,so1.sen AS SO_SEN  
		,$so1col
		FROM
		projectregsite
		INNER JOIN projectreg 
		ON (projectregsite.projectreg_id = projectreg.id)
		INNER JOIN site 
		ON (projectregsite.site_id = site.site_id)
		INNER JOIN $ed1 as ed1
		ON (ed1.projectregsite_id = projectregsite.id)
		INNER JOIN $edss as edss
		ON (ed1.id = edss.ed1id)
		INNER JOIN $ss1 as ss1 
		ON (ss1.edssid = edss.id)
		LEFT JOIN $ssso as ssso
		ON (ss1.id = ssso.ss1id)
		LEFT JOIN $so1 as so1 
		 ON (ss1.sen = so1.ssen AND ss1.fr = so1.sfr)

		LEFT JOIN method 
		ON (ed1.me = method.meth_code)
		LEFT JOIN taxon 
		ON (ss1.tx = taxon.taxon_code)
		LEFT JOIN sexabdominal 
		ON (ss1.sas = sexabdominal.sex_code) GROUP BY ID
	    ORDER BY ed1.sen ASC ,ed1.fr ASC,so1.ssid ASC";
		//echo $query;
		//exit();
        $db->query("SET @rownum := 0;");
		$result = $db->query( $query) or die( mysqli_error( $db ) );


		
	//
		// send response headers to the browser
		// following headers instruct the browser to treat the data as a csv file called EDSS_partialy.csv
		//
		/*header('Content-Description: File Transfer');
		header( 'Content-Type: text/csv' );
		header( 'Content-Disposition: attachment;filename='.$prname.'_ED1_SS1_SO1_TaxonTransposed.csv' );
		header('Content-Transfer-Encoding: binary');
		header('Expires: 0');
		header('Cache-Control:must-revalidate, post-check=0, pre-check=0');
		header('Pragma: public'); */
		

		if (!file_exists("dataset/".$projectcode)) {
		    mkdir("dataset/".$projectcode, 0777, true);
		}

		$filename = "dataset/".$projectcode."/".$prname."_ED1_SS1_SO1_TaxonTransposed.csv";


		$file = fopen($filename,"w") or die("Can't open file $name for writing.");


		$row = mysqli_fetch_assoc( $result );
		if ( $row )
		{
		//echocsv( array_keys( $row ) );
		fputcsv($file, array_keys( $row ));
		}
		//
		// output data rows (if atleast one row exists)
		//
		while ( $row )
		{
		//echocsv( $row );
		fputcsv($file, $row);
		$row = mysqli_fetch_assoc( $result );
		}

		$gt =  $base_url."/".$filename;

		//echo $gt;

		//echo '<p><input type="button" name="Back" value="Back" onclick="window.location ='.$filename.'" /></p>';

		echo '<button type="button" class="btn btn-primary btn-lg"><a class="btn-custom" href = "'.$filename.'" download>  <i class="fa fa-download"> </i>Click to Download!</a></button>';

		
                      

		
	
	}//end of report transpose function
    if($type == 5)
	{
		
		//query to fetch data from custed table for EDs
		$query = "SELECT ft, p_attri FROM custed WHERE pc='$projectcode' AND ft='ED1'";
		//execute query
		$result = $db->query($query ) or die( mysqli_error( $db ));
		//mysql fetch data from result above
		$row = mysqli_fetch_array($result);
		//remove attribute method
		$meth_remove = str_replace("me,","",$row["p_attri"]);
		//insert string
		$insert_str= ",".$row["ft"].".";
		//And table name in first part andinsert table name after commer
		$insert_tb = $row["ft"].".".str_replace(",", $insert_str, $meth_remove);
		$query="SELECT
		site.site_name AS SITE_NAME
		  ,CONCAT(projectreg.pc,\"  \") AS PROJECT_CODE
		,projectreg.expno AS EXPERIMENT
		,ed1.sen AS SERIAL_ED1
		, ed1.st AS START_TIME
		, ed1.ft AS FINISH_TIME
		,$insert_tb
		,$ss1col,   
		,SUM(IF(ss1.sas=1,ss1.n,0)) AS TOTAL_MALE
		,SUM(IF(ss1.sas=2,ss1.n,0)) AS UNFED
		,SUM(IF(ss1.sas=3,ss1.n,0)) AS PARTLY_FED
		,SUM(IF(ss1.sas=4,ss1.n,0)) AS FED
		,SUM(IF(ss1.sas=5,ss1.n,0)) AS GRAVID_SEMIGRAVID
		,SUM(IF(ss1.sas=6,ss1.n,0)) AS TOTAL_FEMALE 
		,so1_sk.*
		,fs2.sen AS fs2_SerialNumber
		,fs2.fr AS fs2_FormRow
		,fs2.ssen AS BoxFormSerialNumber
		,fs2.ns AS NoSamples
		,fs2.fst AS StorageTemp
		,fs2.ff AS CraterFreezerFridgeNumber
		,fs2.rcn AS RackCartonNumber
		FROM
		projectregsite
		INNER JOIN projectreg 
		ON (projectregsite.projectreg_id = projectreg.id)
		INNER JOIN site 
		ON (projectregsite.site_id = site.site_id)
		INNER JOIN $ed1 as ed1 
		ON (ed1.projectregsite_id = projectregsite.id)
		INNER JOIN $edss as ed1 
		ON (edss.ed1id = ed1.id)
		INNER JOIN $ss1 as ss1 
		ON (ss1.edssid = edss.id)
		LEFT JOIN method 
		ON (ed1.me = method.meth_code)
		LEFT JOIN taxon 
		ON (ss1.tx = taxon.taxon_code)
		LEFT JOIN sexabdominal 
		ON (ss1.sas = sexabdominal.sex_code)
		LEFT JOIN so1_sk 
        ON (so1_sk.ssen = ss1.sen AND so1_sk.sfr = ss1.fr)
		LEFT JOIN fs2
		ON (so1_sk.sen = fs2.ssen)
		LEFT JOIN bodypart 
		ON (ss1.bf = bodypart.body_code)  WHERE projectreg.id='$projectcode' GROUP BY  ss1.sen,  ss1.tx  ORDER BY fs2.sen, fs2.fr,fs2.ssen ASC";
		$result = $db->query($query) or die( mysqli_error( $db ) );
		//
		// send response headers to the browser
		// following headers instruct the browser to treat the data as a csv file called EDSS_partialy.csv
		//
		/*header('Content-Description: File Transfer');
		header( 'Content-Type: text/csv' );
		header( 'Content-Disposition: attachment;filename='.$prname.'_ED1_SS1_SO1_FS2_TaxonTransposed.csv' );
		header('Content-Transfer-Encoding: binary');
		header('Expires: 0');
		header('Cache-Control:must-revalidate, post-check=0, pre-check=0');
		header('Pragma: public'); */


		if (!file_exists("dataset/".$projectcode)) {
		    mkdir("dataset/".$projectcode, 0777, true);
		}

		$filename = "dataset/".$projectcode."/".$prname."_ED1_SS1_SO1_FS2.csv";


		$file = fopen($filename,"w") or die("Can't open file $name for writing.");


		$row = mysqli_fetch_assoc( $result );
		if ( $row )
		{
		//echocsv( array_keys( $row ) );
		fputcsv($file, array_keys( $row ));
		}
		//
		// output data rows (if atleast one row exists)
		//
		while ( $row )
		{
		//echocsv( $row );
		fputcsv($file, $row);
		$row = mysqli_fetch_assoc( $result );
		}

		$gt =  $base_url."/".$filename;

		//echo $gt;

		//echo '<p><input type="button" name="Back" value="Back" onclick="window.location ='.$filename.'" /></p>';

		echo '<button type="button" class="btn btn-primary btn-lg"><a class="btn-custom" href = "'.$filename.'" download>  <i class="fa fa-download"> </i>Click to Download!</a></button>';

		
                      

		
		
	}
    //Just ED1
    if($type == 11)
	{
        
		$query="SELECT
       	site.site_name AS SITE_NAME
		,projectreg.pc AS PROJECT_CODE
		,projectreg.expno AS EXPERIMENT
		,ed1.sen AS ED_SEN
		,$edcol
		FROM
        projectregsite
		INNER JOIN projectreg 
		ON (projectregsite.projectreg_id = projectreg.id)
		INNER JOIN site 
		ON (projectregsite.site_id = site.site_id)
		INNER JOIN $ed1 as ed1 
		ON (ed1.projectregsite_id = projectregsite.id)
        ORDER BY ed1.sen ASC,ed1.fr ASC";
		$result = $db->query($query ) or die( mysqli_error( $db ) );
		//
		// send response headers to the browser
		// following headers instruct the browser to treat the data as a csv file called EDSS_partialy.csv
		///
		/*header('Content-Description: File Transfer');
		header('Content-Type: text/csv' );
		header('Content-Disposition: attachment;filename='.$prname.'_ED1.csv' );
		header('Content-Transfer-Encoding: binary');
		header('Expires: 0');
		header('Cache-Control:must-revalidate, post-check=0, pre-check=0');
		header('Pragma: public'); */
		//
		// output header row (if atleast one row exists)
		//

		//ini_set('display_errors',1);
        //error_reporting(E_ALL);



		if (!file_exists("dataset/".$projectcode)) {
		    mkdir("dataset/".$projectcode, 0777, true);
		}

		$filename = "dataset/".$projectcode."/".$prname."_ED1.csv";


		$file = fopen($filename,"w") or die("Can't open file $name for writing.");


		$row = mysqli_fetch_assoc( $result );
		if ( $row )
		{
		//echocsv( array_keys( $row ) );
		fputcsv($file, array_keys( $row ));
		}
		//
		// output data rows (if atleast one row exists)
		//
		while ( $row )
		{
		//echocsv( $row );
		fputcsv($file, $row);
		$row = mysqli_fetch_assoc( $result );
		}

		$gt =  $base_url."/".$filename;

		//echo $gt;

		//echo '<p><input type="button" name="Back" value="Back" onclick="window.location ='.$filename.'" /></p>';

		echo '<a class="" href = "'.$filename.'" download>  <i class="fa fa-download"> </i>Click to Download!</a>';

		
                     


	}
    //Just ss1
    if($type == 13)
	{

		$query="SELECT
site.site_name AS SITE_NAME
,projectreg.pc AS PROJECT_CODE
,projectreg.expno AS EXPERIMENT
,$ss1col
FROM
projectregsite
INNER JOIN projectreg 
ON (projectregsite.projectreg_id = projectreg.id)
INNER JOIN site 
ON (projectregsite.site_id = site.site_id)
INNER JOIN $ed1 as ed1
ON (ed1.projectregsite_id = projectregsite.id)
INNER JOIN $edss as edss
ON (ed1.id = edss.ed1id)
INNER JOIN $ss1 as ss1 
ON (ss1.edssid = edss.id)
ORDER BY ss1.sen ASC,ss1.fr ASC";

		$result = $db->query($query ) or die( mysqli_error( $db ) );
		//
		// send response headers to the browser
		// following headers instruct the browser to treat the data as a csv file called EDSS_partialy.csv
		//
	/*	header('Content-Description: File Transfer');
		header( 'Content-Type: text/csv' );
		header( 'Content-Disposition: attachment;filename='.$prname.'_SS1.csv' );
		header('Content-Transfer-Encoding: binary');
		header('Expires: 0');
		header('Cache-Control:must-revalidate, post-check=0, pre-check=0');
		header('Pragma: public'); */


		if (!file_exists("dataset/".$projectcode)) {
		    mkdir("dataset/".$projectcode, 0777, true);
		}

		$filename = "dataset/".$projectcode."/".$prname."_SS1.csv";


		$file = fopen($filename,"w") or die("Can't open file $name for writing.");


		$row = mysqli_fetch_assoc( $result );
		if ( $row )
		{
		//echocsv( array_keys( $row ) );
		fputcsv($file, array_keys( $row ));
		}
		//
		// output data rows (if atleast one row exists)
		//
		while ( $row )
		{
		//echocsv( $row );
		fputcsv($file, $row);
		$row = mysqli_fetch_assoc( $result );
		}

		$gt =  $base_url."/".$filename;

		//echo $gt;

		//echo '<p><input type="button" name="Back" value="Back" onclick="window.location ='.$filename.'" /></p>';

		echo '<button type="button" class="btn btn-primary btn-lg"><a class="btn-custom" href = "'.$filename.'" download>  <i class="fa fa-download"> </i>Click to Download!</a></button>';

		
                      

	
	}
	//Just so1
	if($type == 16)
	{

		 $query="SELECT
         site.site_name AS SITE_NAME
		,projectreg.pc AS PROJECT_CODE
		,projectreg.expno AS EXPERIMENT
		,so1.sen AS SO_SEN
		,$so1col
		FROM
        projectregsite
		INNER JOIN projectreg 
		ON (projectregsite.projectreg_id = projectreg.id)
		INNER JOIN site 
		ON (projectregsite.site_id = site.site_id)
		INNER JOIN $so1 as so1
		ON (so1.projectregsite_id = projectregsite.id)
        WHERE projectreg.id='$projectcode'
        ORDER BY so1.ssen ASC";
		$result = $db->query($query ) or die( mysqli_error( $db ) );
		//
		// send response headers to the browser
		// following headers instruct the browser to treat the data as a csv file called EDSS_partialy.csv
		//
		/*header('Content-Description: File Transfer');
		header( 'Content-Type: text/csv' );
		header( 'Content-Disposition: attachment;filename='.$prname.'_SO1.csv' );
		header('Content-Transfer-Encoding: binary');
		header('Expires: 0');
		header('Cache-Control:must-revalidate, post-check=0, pre-check=0');
		header('Pragma: public'); */


		if (!file_exists("dataset/".$projectcode)) {
		    mkdir("dataset/".$projectcode, 0777, true);
		}

		$filename = "dataset/".$projectcode."/".$prname."_SO1.csv";


		$file = fopen($filename,"w") or die("Can't open file $name for writing.");


		$row = mysqli_fetch_assoc( $result );
		if ( $row )
		{
		//echocsv( array_keys( $row ) );
		fputcsv($file, array_keys( $row ));
		}
		//
		// output data rows (if atleast one row exists)
		//
		while ( $row )
		{
		//echocsv( $row );
		fputcsv($file, $row);
		$row = mysqli_fetch_assoc( $result );
		}

		$gt =  $base_url."/".$filename;

		//echo $gt;

		//echo '<p><input type="button" name="Back" value="Back" onclick="window.location ='.$filename.'" /></p>';

		echo '<button type="button" class="btn btn-primary btn-lg"><a class="btn-custom" href = "'.$filename.'" download>  <i class="fa fa-download"> </i>Click to Download!</a></button>';

		
                      




		
	}
    if($type == 18)
	{
        
		$query="SELECT
        site.site_name AS SITE_NAME
		,projectreg.pc AS PROJECT_CODE
		,projectreg.expno AS EXPERIMENT
		,fs2.*
		FROM
        projectregsite
		INNER JOIN projectreg 
		ON (projectregsite.projectreg_id = projectreg.id)
		INNER JOIN site 
		ON (projectregsite.site_id = site.site_id)
		INNER JOIN fs2
		ON (fs2.projectregsite_id = projectregsite.id)
        WHERE projectreg.id='$projectcode'";
		$result = $db->query($query) or die( mysqli_error( $db ) );
		//
		// send response headers to the browser
		// following headers instruct the browser to treat the data as a csv file called EDSS_partialy.csv
		//
		/*header('Content-Description: File Transfer');
		header( 'Content-Type: text/csv' );
		header( 'Content-Disposition: attachment;filename='.$prname.'_FS2.csv' );
		header('Content-Transfer-Encoding: binary');
		header('Expires: 0');
		header('Cache-Control:must-revalidate, post-check=0, pre-check=0');
		header('Pragma: public'); */


		if (!file_exists("dataset/".$projectcode)) {
		    mkdir("dataset/".$projectcode, 0777, true);
		}

		$filename = "dataset/".$projectcode."/".$prname."_FS2.csv";


		$file = fopen($filename,"w") or die("Can't open file $name for writing.");


		$row = mysqli_fetch_assoc( $result );
		if ( $row )
		{
		//echocsv( array_keys( $row ) );
		fputcsv($file, array_keys( $row ));
		}
		//
		// output data rows (if atleast one row exists)
		//
		while ( $row )
		{
		//echocsv( $row );
		fputcsv($file, $row);
		$row = mysqli_fetch_assoc( $result );
		}

		$gt =  $base_url."/".$filename;

		//echo $gt;

		//echo '<p><input type="button" name="Back" value="Back" onclick="window.location ='.$filename.'" /></p>';

		echo '<button type="button" class="btn btn-primary btn-lg"><a class="btn-custom" href = "'.$filename.'" download>  <i class="fa fa-download"> </i>Click to Download!</a></button>';

		
                      

		

	}
    //Testing fs2 and s01 to be deleted
    if($type == 17)
	{

		$query="SELECT
		so1_sk.*,fs2.*
		FROM
		so1_sk,fs2
        WHERE so1_sk.sen = fs2.ssen";
		$result = $db->query(strtolower($query) ) or die( mysqli_error( $db ) );
		//
		// send response headers to the browser
		// following headers instruct the browser to treat the data as a csv file called EDSS_partialy.csv
		//
		header('Content-Description: File Transfer');
		header( 'Content-Type: text/csv' );
		header( 'Content-Disposition: attachment;filename=SO1FS2Testing.csv' );
		header('Content-Transfer-Encoding: binary');
		header('Expires: 0');
		header('Cache-Control:must-revalidate, post-check=0, pre-check=0');
		header('Pragma: public');
		//
		// output header row (if atleast one row exists)
		//
		$row = mysqli_fetch_assoc( $result );
		if ( $row )
		{
		echocsv( array_keys( $row ) );
		}
		//
		// output data rows (if atleast one row exists)
		//
		while ( $row )
		{
		echocsv( $row );
		$row = mysqli_fetch_assoc( $result );
		}
	}
    //partialy report of SO1 include ED1 and SS1
    //old linking so1
	if($type == 20)
	{
		//query to fetch data from custed table for EDs
		$query = "SELECT ft, p_attri FROM custed WHERE pc='$projectcode' AND ft='ED1'";
		//execute query
		$result = $db->query($query ) or die( mysqli_error( $db ));
		//mysql fetch data from result above
		$row = mysqli_fetch_array($result);
		//remove attribute method
		$meth_remove = str_replace("me,","",$row["p_attri"]);
		//insert string
		$insert_str= ",".$row["ft"].".";
		//And table name in first part andinsert table name after commer
		$insert_tb = $row["ft"].".".str_replace(",", $insert_str, $meth_remove);
		//create query
		$query ="SELECT
    site.site_name AS SITE_NAME,
	CONCAT(projectreg.pc,\"  \",projectreg.expno) AS PROJECT_CODE,
	ed1.sen AS SERIAL_ED1,
	ed1.st AS START_TIME,
	ed1.ft AS FINISH_TIME,
	$insert_tb,
	method.meth_abbre AS METHOD,
	ss1.sen AS SERIAL_SS1,
	ss1.fr AS FORMROW_SS1,

	taxon.taxon_name AS TAXON_NAME,
	ss1.sas,
	sexabdominal.sex_desc,
	ss1.n,
	so1.*
FROM
    projectregsite
    INNER JOIN site 
        ON (projectregsite.site_id = site.site_id)
    INNER JOIN projectreg 
        ON (projectregsite.projectreg_id = projectreg.id)
    INNER JOIN $ed1 as ed1 
        ON (ed1.projectregsite_id = projectregsite.id)
    INNER JOIN method 
        ON (ed1.me = method.meth_code)
    INNER JOIN $edss as edss 
        ON (edss.ed1id = ed1.id)
    INNER JOIN $ss1 as ss1 
        ON (ss1.edssid = edss.id)
    INNER JOIN sexabdominal 
        ON (ss1.sas = sexabdominal.sex_code)
    LEFT JOIN taxon 
        ON (ss1.tx = taxon.taxon_code)
    LEFT JOIN $ssso as ssso 
        ON (ssso.ss1id = ss1.id)
    LEFT JOIN so1 
        ON (so1.sssoid = ssso.id)
    LEFT JOIN bodypart 
        ON (ss1.bp = bodypart.body_code) ORDER BY so1.sssoid ASC, so1.sen ASC, so1.fr ASC, so1.sid ASC";
		//execute query
		$result = $db->query($query) or die( mysqli_error( $db ) );
		//
		// send response headers to the browser
		// following headers instruct the browser to treat the data as a csv file called EDSSSO_partialy.csv
		//
		/*header('Content-Description: File Transfer');
		header( 'Content-Type: text/csv' );
		header( 'Content-Disposition: attachment;filename=EDSSSO_partialy.csv' );
		header('Content-Transfer-Encoding: binary');
		header('Expires: 0');
		header('Cache-Control:must-revalidate, post-check=0, pre-check=0');
		header('Pragma: public'); */
		

		if (!file_exists("dataset/".$projectcode)) {
		    mkdir("dataset/".$projectcode, 0777, true);
		}

		$filename = "dataset/".$projectcode."/".$prname."_EDSSSO_partially.csv";


		$file = fopen($filename,"w") or die("Can't open file $name for writing.");


		$row = mysqli_fetch_assoc( $result );
		if ( $row )
		{
		//echocsv( array_keys( $row ) );
		fputcsv($file, array_keys( $row ));
		}
		//
		// output data rows (if atleast one row exists)
		//
		while ( $row )
		{
		//echocsv( $row );
		fputcsv($file, $row);
		$row = mysqli_fetch_assoc( $result );
		}

		$gt =  $base_url."/".$filename;

		//echo $gt;

		//echo '<p><input type="button" name="Back" value="Back" onclick="window.location ='.$filename.'" /></p>';

		echo '<button type="button" class="btn btn-primary btn-lg"><a class="btn-custom" href = "'.$filename.'" download>  <i class="fa fa-download"> </i>Click to Download!</a></button>';

		
                      

	}//report edssso if function to check 
	
}//end of function report()


function echocsv( $fields )
{
	$separator = '';
	foreach ( $fields as $field )
	{
		if ( preg_match( '/\\r|\\n|,|"/', $field ) )
		{
			$field = '"' . str_replace( '"', '""', $field ) . '"';
		}
		echo $separator . $field;
		$separator = ',';
	}
	echo "\r\n";
}
  
//call function report to generate report
report($typereport, $projectcode, $db);
//direct to report page
//echo "<meta http-equiv=\"refresh\" content=\"0; url=report.php\">";
?>
