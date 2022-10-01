<?php

 include_once('includes/load.php');

function projectSite($projectcode/*, $site_code*/)
{//start of function projectSite()
	/*
	this function have activities of detect site and project and return where condition
	*/
	//clear variable to empty
	$wherecondition = "";
	//clear variable $site_code
	$site_code = "";
	//clear variable $project_code
	$project_code = "";
	// detect project code
	if($projectcode > 0)
	{		
		//variable to poject code $project_code
		$project_code = " WHERE projectreg.id=".$projectcode." ";
	}
	
	//combine value after detect 
	$wherecondition = $project_code;
	//return from called function
	return $wherecondition;	
}//end of function projectSite()

function transposeTaxonSAS($transpose_type, $project_code,/* $site_code,*/ $from_table)
{//start of function
	/*
	this file have function of convertion/transpose
	fuction to transpose taxon column
	It receive transpose_type, project_code, site_code, table_name(from_table), connection(conn)
	It return success/fail and guery generated from the fetch column
	success = 1
	fail = 0
	*/
	//detect type of transpose Taxon

	$prefixtable = $project_code."_";

	
	$from_table = $prefixtable.$from_table;


	global $db;
	if($transpose_type == "taxon")
	{
		//call projectSite function  
		$wherecondition = projectSite($project_code/*, $site_code*/);
		//cretae query to fetch data for pre arrangement from the table request
		$query="SELECT
				    `taxon`.`taxon_code`
				    , `taxon`.`taxon_name`
				    , `sexabdominal`.`sex_code`
				    , `sexabdominal`.`sex_desc`
				FROM
				    `projectregsite`
				    INNER JOIN `projectreg` 
				        ON (`projectregsite`.`projectreg_id` = `projectreg`.`id`)
				    INNER JOIN `site` 
				        ON (`projectregsite`.`site_id` = `site`.`site_id`)
				    INNER JOIN ".$prefixtable."ed1 as ed1 
				        ON (`ed1`.`projectregsite_id` = `projectregsite`.`id`)
				    INNER JOIN ".$prefixtable."edss as edss 
				        ON (`edss`.`ed1id` = `ed1`.`id`)
				    INNER JOIN `".$from_table."` 
				        ON (`".$from_table."`.`edssid` = `edss`.`id`)
				    INNER JOIN `sexabdominal` 
				        ON (`".$from_table."`.`sas` = `sexabdominal`.`sex_code`)
				    INNER JOIN `taxon` 
				        ON (`".$from_table."`.`tx` = `taxon`.`taxon_code`)  ".$wherecondition."  GROUP BY taxon.taxon_code,sexabdominal.sex_code ORDER BY taxon.taxon_code ASC, sexabdominal.sex_code ASC
				";
		//execute query 
		$result = $db->query(strtolower($query));
		//check of execute of query above is success
		if($result == true)
		{
			//start to count number of row`s found from query execute above
			$numrow = mysqli_num_rows($result);
			//if number of row is equal to 0 do this
			if($numrow == 0)
			{
				//return message to called function
			}
			//if number of row is greater than 0 do this
			if($numrow > 0)
			{
				//clear value  in  variable  $transpose
				$transposecolumn = "";				
				//fetch data from result above
				while($row = mysqli_fetch_array($result)) 
				{
					//start to create query
					$transposecolumn =$transposecolumn.",SUM(IF((ss1.tx=".$row["taxon_code"]." AND ss1.sas=".$row["sex_code"]."), ss1.n, 0)) AS '".strtoupper($row["taxon_name"])."_".strtoupper($row["sex_desc"])."' ";
				}
				//return transpose column to called function which need to transposed column
				return array(1, $transposecolumn);
			}
		}
		//check of execute query above is fail
		if($result == false)
		{
			//return error message to called function
		}
	}
	//detect type of transpose SAS
	if($transpose_type == "sas")
	{
	
	}
	
	
}//end of function transposeTaxonSAS


function renamecol($edcol,$tablename,$formname){

     $tablename = $tablename.'.';

	   $columns = explode(',', $edcol); 
        
      $new = array();

      foreach($columns as $item){

        if( $item == 'fr')
        {
          $new[] = $tablename.'fr AS '.$formname.'_FR';
        }
         if( $item == 'dt')
        {
          $new[] = $tablename.'dt AS '.$formname.'_DT';
        }
         if( $item == 'ea')
        {
          $new[] = $tablename.'ea AS '.$formname.'_EA';
        }
          if( $item == 'cr')
        {
          $new[] = $tablename.'cr AS '.$formname.'_CR';
        }
          if( $item == 'cp')
        {
          $new[] = $tablename.'cp AS '.$formname.'_CP';
        }
          if( $item == 'tcu')
        {
          $new[] = $tablename.'tcu AS '.$formname.'_TCU';
        }
         if( $item == 'hh')
        {
          $new[] = $tablename.'hh AS '.$formname.'_HH';
        }
         if( $item == 'me')
        {
          $new[] = $tablename.'me AS '.$formname.'_ME';
        }
         if( $item == 'ind')
        {
          $new[] = $tablename.'ind AS '.$formname.'_IND';
        }if( $item == 'ht')
        {
          $new[] = $tablename.'ht AS '.$formname.'_HT';
        }
         if( $item == 'st')
        {
          $new[] = $tablename.'st AS '.$formname.'_ST';
        }
         if( $item == 'ft')
        {
          $new[] = $tablename.'ft AS '.$formname.'_FT';
        }
         if( $item == 'vi')
        {
          $new[] = $tablename.'vi AS '.$formname.'_VI';
        }
         if( $item == 'tr')
        {
          $new[] = $tablename.'tr AS '.$formname.'_TR';
        }
         if( $item == 'dy')
        {
          $new[] = $tablename.'dy AS '.$formname.'_DY';
        }
         if( $item == 'oth')
        {
          $new[] = $tablename.'oth AS '.$formname.'_OTH';
        }
         if( $item == 'vc')
        {
          $new[] = $tablename.'vc AS '.$formname.'_VC';
        }
         if( $item == 'dsen')
        {
          $new[] = $tablename.'dsen AS '.$formname.'_DSEN';
        }
		 if( $item == 'notes')
        {
          $new[] = $tablename.'notes AS '.$formname.'_NOTES';
        }
		 if( $item == 'gps')
        {
          $new[] = $tablename.'gps AS '.$formname.'_GPS';
        }
         if( $item == 'livestock')
        {
          $new[] = $tablename.'livestock AS '.$formname.'_LIVESTOCK';
        }
         if( $item == 'hoccupant')
        {
          $new[] = $tablename.'hoccupant AS '.$formname.'_HOCCUPANT';
        }
         if( $item == 'heaves')
        {
          $new[] = $tablename.'heaves AS '.$formname.'_HEAVES';
        }
         if( $item == 'nss')
        {
          $new[] = $tablename.'nss AS '.$formname.'_NSS';
        }
         if( $item == 'nbh')
        {
          $new[] = $tablename.'nbh AS '.$formname.'_NBH';
        }
         if( $item == 'oth')
        {
          $new[] = $tablename.'oth AS '.$formname.'_OTH';
        }
         if( $item == 'rnd')
        {
          $new[] = $tablename.'rnd AS '.$formname.'_RND';
        }
         if( $item == 'blk')
        {
          $new[] = $tablename.'blk AS '.$formname.'_BLK';
        }
         if( $item == 'shh')
        {
          $new[] = $tablename.'shh AS '.$formname.'_SHH';
        }
         if( $item == 'longitude')
        {
          $new[] = $tablename.'longitude AS '.$formname.'_Longitude';
        } if( $item == 'latitude')
        {
          $new[] = $tablename.'latitude AS '.$formname.'_Latitude';
        }if( $item == 'other1')
        {
          $new[] = $tablename.'other1 AS '.$formname.'_Other1';
        }

    }


      $str = implode (",", $new);


      return $str ;


   }

   function renamecolss3($edcol,$tablename,$formname){

       $tablename = $tablename.'.';

	     $columns = explode(',', $edcol); 
        
       $new = array();

      foreach($columns as $item){

        if( $item == 'sen')
        {
          $new[] = $tablename.'sen AS '.$formname.'_SEN';
        }
         if( $item == 'ssen')
        {
          $new[] = $tablename.'ssen AS '.$formname.'_SSEN';
        }
         if( $item == 'sfr')
        {
          $new[] = $tablename.'sfr AS '.$formname.'_SFR';
        }
         if( $item == 'sd')
        {
          $new[] = $tablename.'sd AS '.$formname.'_SD';
        }
         if( $item == 'fd')
        {
          $new[] = $tablename.'fd AS '.$formname.'_FD';
        }
         if( $item == 'fr')
        {
          $new[] = $tablename.'fr AS '.$formname.'_FR';
        }
         if( $item == 'dd')
        {
          $new[] = $tablename.'dd AS '.$formname.'_DD';
        }
         if( $item == 'tx')
        {
          $new[] = $tablename.'tx AS '.$formname.'_TX';
        }
         if( $item == 'sas')
        {
          $new[] = $tablename.'sas AS '.$formname.'_SAS';
        }
         if( $item == 'mt')
        {
          $new[] = $tablename.'mt AS '.$formname.'_MT';
        }
         if( $item == 'ch')
        {
          $new[] = $tablename.'ch AS '.$formname.'_CH';
        }
         if( $item == 'la')
        {
          $new[] = $tablename.'la AS '.$formname.'_LA';
        }
         if( $item == 'ft')
        {
          $new[] = $tablename.'ft AS '.$formname.'_FT';
        }
         if( $item == 'bf')
        {
          $new[] = $tablename.'bf AS '.$formname.'_BF';
        }
         if( $item == 'hp')
        {
          $new[] = $tablename.'hp AS '.$formname.'_HP';
        }
         if( $item == 'oth5')
        {
          $new[] = $tablename.'oth5 AS '.$formname.'_OTH5';
        }
         if( $item == 'oth6')
        {
          $new[] = $tablename.'oth6 AS '.$formname.'_OTH6';
        }
         if( $item == 'oth7')
        {
          $new[] = $tablename.'oth7 AS '.$formname.'_OTH7';
        }
         if( $item == 'oth8')
        {
          $new[] = $tablename.'oth8 AS '.$formname.'_OTH8';
        }
         if( $item == 'n')
        {
          $new[] = $tablename.'n AS '.$formname.'_N';
        }

         if( $item == 'slc')
        {
          $new[] = $tablename.'slc AS '.$formname.'_SLC';
        }
         if( $item == 'st')
        {
          $new[] = $tablename.'st AS '.$formname.'_ST';
        }

         if( $item == 'ni')
        {
          $new[] = $tablename.'ni AS '.$formname.'_NI';
        }

         if( $item == 'nb')
        {
          $new[] = $tablename.'nb AS '.$formname.'_NB';
        }
         if( $item == 'sid01')
        {
          $new[] = $tablename.'sid01 AS '.$formname.'_SID01';
        }
          if( $item == 'sid02')
        {
          $new[] = $tablename.'sid02 AS '.$formname.'_SID02';
        }
          if( $item == 'sid03')
        {
          $new[] = $tablename.'sid03 AS '.$formname.'_SID03';
        }
          if( $item == 'sid04')
        {
          $new[] = $tablename.'sid04 AS '.$formname.'_SID04';
        }
          if( $item == 'sid05')
        {
          $new[] = $tablename.'sid05 AS '.$formname.'_SID05';
        }
          if( $item == 'sid06')
        {
          $new[] = $tablename.'sid06 AS '.$formname.'_SID06';
        }
          if( $item == 'sid07')
        {
          $new[] = $tablename.'sid07 AS '.$formname.'_SID07';
        }
          if( $item == 'nd')
        {
          $new[] = $tablename.'nd AS '.$formname.'_ND';
        }
       

    }


      $str = implode (",", $new);


      return $str ;



}

 function renamecolss1($edcol,$tablename,$formname){

      $tablename = $tablename.'.';

	  $columns = explode(',', $edcol); 
        
      $new = array();

      foreach($columns as $item){

        if( $item == 'sen')
        {
          $new[] = $tablename.'sen AS '.$formname.'_SEN';
        }
         if( $item == 'ssen')
        {
          $new[] = $tablename.'ssen AS '.$formname.'_SSEN';
        }
         if( $item == 'sfr')
        {
          $new[] = $tablename.'sfr AS '.$formname.'_SFR';
        }
        
         if( $item == 'fr')
        {
          $new[] = $tablename.'fr AS '.$formname.'_FR';
        }
         if( $item == 'tx')
        {
          $new[] = $tablename.'tx AS '.$formname.'_TX';
        }
         if( $item == 'sas')
        {
          $new[] = $tablename.'sas AS '.$formname.'_SAS';
        }
       
         if( $item == 'n')
        {
          $new[] = $tablename.'n AS '.$formname.'_N';
        }
          if( $item == 'notes')
        {
          $new[] = $tablename.'notes AS '.$formname.'_NOTES';
        }

         if( $item == 'slc')
        {
          $new[] = $tablename.'slc AS '.$formname.'_SLC';
        }
         if( $item == 'st')
        {
          $new[] = $tablename.'st AS '.$formname.'_ST';
        }

         if( $item == 'ni')
        {
          $new[] = $tablename.'ni AS '.$formname.'_NI';
        }

         if( $item == 'nb')
        {
          $new[] = $tablename.'nb AS '.$formname.'_NB';
        }
         if( $item == 'sid01')
        {
          $new[] = $tablename.'sid01 AS '.$formname.'_SID01';
        }
          if( $item == 'sid02')
        {
          $new[] = $tablename.'sid02 AS '.$formname.'_SID02';
        }
          if( $item == 'sid03')
        {
          $new[] = $tablename.'sid03 AS '.$formname.'_SID03';
        }
          if( $item == 'sid04')
        {
          $new[] = $tablename.'sid04 AS '.$formname.'_SID04';
        }
          if( $item == 'sid05')
        {
          $new[] = $tablename.'sid05 AS '.$formname.'_SID05';
        }
          if( $item == 'sid06')
        {
          $new[] = $tablename.'sid06 AS '.$formname.'_SID06';
        }
          if( $item == 'sid07')
        {
          $new[] = $tablename.'sid07 AS '.$formname.'_SID07';
        }
          if( $item == 'nd')
        {
          $new[] = $tablename.'nd AS '.$formname.'_ND';
        }
       
    }

      $str = implode (",", $new);


      return $str ;

}

 function renamecolso1($edcol,$tablename,$formname){

      $tablename = $tablename.'.';

      $columns = explode(',', $edcol); 
        
      $new = array();

      foreach($columns as $item){

        if( $item == 'sen')
        {
          $new[] = $tablename.'sen AS '.$formname.'_SEN';
        }
         if( $item == 'fr')
        {
          $new[] = $tablename.'fr AS '.$formname.'_FR';
        }
         if( $item == 'rc')
        {
          $new[] = $tablename.'rc AS '.$formname.'_RC';
        }
        if( $item == 'ssen')
        {
          $new[] = $tablename.'ssen AS '.$formname.'_SSEN';
        }
         if( $item == 'sfr')
        {
          $new[] = $tablename.'sfr AS '.$formname.'_SFR';
        }
         if( $item == 'sbf')
        {
          $new[] = $tablename.'sbf AS '.$formname.'_SBF';
        }

         if( $item == 'sslc')
        {
          $new[] = $tablename.'sslc AS '.$formname.'_SSLC';
        }
        
         if( $item == 'sst')
        {
          $new[] = $tablename.'sst AS '.$formname.'_SST';
        }

         if( $item == 'ssid')
        {
          $new[] = $tablename.'ssid AS '.$formname.'_SSID';
        }
         if( $item == 'tx')
        {
          $new[] = $tablename.'tx AS '.$formname.'_TX';
        }
          if( $item == 'species')
        {
          $new[] = $tablename.'species AS '.$formname.'_PCR';
        }
          if( $item == 'kdr')
        {
          $new[] = $tablename.'kdr AS '.$formname.'_KDR';
        }
          if( $item == 'pf')
        {
          $new[] = $tablename.'pf AS '.$formname.'_ELISA';
        } if( $item == 'po')
        {
          $new[] = $tablename.'po AS '.$formname.'_BLOODMEAL';
        }
          
       
    }

      $str = implode (",", $new);


      return $str ;

}


function changenametolong($tablename,$column1,$column2){

    $formname = strtoupper($tablename);
  
    $tablename = $tablename.'.';
  
    $column2 = str_replace(" ","_",$column2); 
    $column2 = str_replace(".","",$column2);
    $column2 = str_replace("(","",$column2);  
    $column2 = str_replace(")","",$column2);
    $column2 = str_replace("&","",$column2); 
     $column2 = str_replace("/","_",$column2);   
 
    $new = array();
  
    $column1 = explode(',', $column1); 
    $column2 = explode(',', $column2); 

    foreach(array_combine($column1, $column2) as $column1field => $column2field){

        $new[] = $tablename.$column1field.' AS '.$formname.'_'.$column2field;

    }

      $str = implode (",", $new);

      return $str ;
   }




?>
