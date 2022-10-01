<?php

/**
* Created by Dickson Msaky @ Ifakara Health Insitute (2018)
**/ 

require_once('load.php');

global $db;


Class Query
{
		
	/*This  function is used to execute query for select data */
	function selectExecute($db,$query)
	{//start of function
		//execute query 
		global $db;

		$result = mysqli_query($db,$query);
		if($result == true)
		{
			return $result;
		}
		if($result != true)
		{
			return "false";
		}
	}//end of function
	
	/*This function is used to execute query for insert data*/
	function insertExecute($db,$query)
	{//start of function
		global $db;
		//execute query 
		$result = mysqli_query($db,$query);
		if($result == true)
		{
			return "true";
		}
		elseif($result != true)
		{
			return "false";
		}
	}//end of function
	
	/*This function is used to count number of row from executed query*/
	function countRowReturn($result)
	{//start of function
		global $db;
		$num_row = mysqli_num_rows($result);
		return $num_row;
	}//end of function
}
function rowIdentifier($row, $formtype, $headattribute)
{
	global $db;
	/*
	 This function have duty to identify row from the file readed
	 It return more variable
	 
	 1=>header sen
	 This it show that the row return is header which contain serial number of a form
	 
	 2=>header column
	 This it show that the row return is header which contain heading of column
	 
	 3=>rowdata
	 This it show that the row return is contain dataset
	 
	 4=>rowempty
	 This it show that the row return is contain empty dataset
	 
	 5=>end of ED/SS
	 This it show that the row return is end of ED/SS form
	 
	 6=>column mismatch 
	 This show that column return is mismatch with the system columns according to column stored in the system.
	*/
	
	//convert variable $row to lower case by function strtolower()
	$row=strtolower($row);	
	$formtype=strtolower($formtype);
	//remove space in $row varibale
	$row = str_replace(" ","",$row);
	//convert variable $headattribute to lower case
	$headattribute = strtolower($headattribute);
	//split $heading to array
	$headattribute_array = explode(",",$headattribute);
	//split $row into array
	$row_array=explode(",",$row);
   
	//condition to determine ED form
	if($formtype=="ed1" || $formtype == "ed2")
	{
		//determine row contain serial number 
		if($row_array[0] == "sen:")
		{
			//return serial number of ED`s and type of row
			return array(1,$row_array[1]);		
		}
		//determine row show end of ED 
		if($row_array[0] == "end:")
		{
			//return row show end of ED
			return array(5,$row_array[0]);		
		}
		//determine row contain dataset 
        // SK -- changed this to say if not empty and not equal to sen or end and not equal to attri(0)
        //otherwise if the value is 0 as for BS it wont read
		if($row_array[0] >= 1)
        {
			//return row type 
			return array(3,$row);
		}
		//determine two first in array $row_array empty columns
		if($row_array[0]=="")
		{
			//return two first column are empty from 
			return array(4, "This row contain two first empty columns ");
		
		}
		//determine first in array $row_array empty column
		if($row_array[0]=="")
		{
			//return two first column are empty from 
			return array(4, "This row contain  first empty column");
		
		}
		//compare first element in each array ($headattribute_array and $row_array)
		if($row_array[0] == $headattribute_array[0])
		{
			//count number of element in array $headattribute_array
			$num_element =count($headattribute_array);
			//set start point obervation in array
			$start = 0;
			//while function to compare			
			while ($start < $num_element)
			{
				//compare arrays ($row_array and $headattribute_array)
				if($row_array[$start] == $headattribute_array[$start])
				{
					//increament varibale $start by one
					$start++;
				}
				else
				{
					//return error with error message
					return array(4, " Check the headings of your file");				
				}			
			}
			//return row which contain heading of columns
			return array(2, $row);		
		}
	
	}//end of condition to determine ED rows
	//condition to determine SS
	if($formtype =="ss1" || $formtype =="ss2" || $formtype =="ss3")
	{
		//determine row contain serial number, source form row, source form type, source serial number 
		if($row_array[0] == "SEN:" || $row_array[2] == "sfr:" || $row_array[4] == "sft:" || $row_array[6]== "ssen:")
		{
			//return  row contain sen, ssen, sft, sfr
 			return array(1,$row);					
		}
		//determine row show end of SS
		if($row_array[0] == "end:" || $row_array[0] == "end")
		{
			//return row show end of SS
			return array(5,$row_array[0]);		
		}
		//determine row contain dataset 
		if($row_array[0] >= 1)
		{
			//return row type 
			return array(3,$row);
		}
		//determine two first in array $row_array empty columns
		if($row_array[0]=="" && $row_array[1]=="")
		{
			//return two first column are empty from 
			return array(4, "This row contain two first empty columns ");		
		}
		//determine first in array $row_array empty column
		if($row_array[0]=="")
		{
			//return two first column are empty from 
			return array(4, "This row contain  first empty column");		
		}
		//woking with SS1 form heading attribute and compare those heading 
		if($formtype == "SS1" || ($row_array[0] == $headattribute_array[0]))
		{
			//count number of element in array $headattribute_array
			$num_element =count($headattribute_array);
			//set start point obervation in array
			$start = 0;
			//while function to compare			
			while ($start < $num_element)
			{
				//compare arrays ($row_array and $headattribute_array)
				if($row_array[$start] == $headattribute_array[$start])
				{
					//increament varibale $start by one
					$start++;
				}
				else
				{
					//return error with error message
					return array(6, "One of the column name don't match what is in the system--check your file");				
				}			
			}
			//return row which contain heading of columns
			return array(2, $row);			
		}
		
	}
}

/*
This function have duty to find link between SS and ED through edss entity
It receive variable which contain query to be executed and return condition of success with ID found of failed with message
*/
function linkFetch($query)
{
	global $db;
	//execute query
	$result = $db->mysqliquery($query);
	//detect if query execute correct
	if($result == true)
	{
		//check number of row return from the system
		$numrow = $db->num_rows($result);
		//if number of row is 0 do this
		if($numrow == 0)
		{
			//return multi values
			return array(1, "Information provide to the system is false check your data and submit again");
		}
		//if number of row is 1 do this
		if($numrow == 1)
		{
			//fetch link value from result
			$linkvalue =  $db->fetch_assoc($result);;
			//return multi values
			return array(2, $linkvalue["id"]);
		}
		//if number of row is greater than 1 do this
		if($numrow >1)
		{
			//return multi values
			return array(3, "Information submitted bring multiple linkage see  system administrator");
		}
	}
	elseif($result != true)
	{
		//return multi values
		return array(10,"Error ".$db->mysqlierror());
	}
}//end of function linkFetch()

/*
This function have action of execute query 
*/
function queryExecute($query, $numberline)
{
	//execute query
	global $db;
	$result = mysqli_query($db,$query);
	if($result == true)
	{
		//increament number of recorded row
		$recorded =1;
		//return multi values
		return array($recorded, "1", "noError");
	}
	elseif($result != true)
	{
		//increament of recorded skipped row
		$skip =1;
		//keep error message
		//$error = "Row ".$numberline." reason ".mysqli_error();
		 $error = "<span class=\"has-padding\">-->Row number: ".$numberline." <font color=\"red\"> Unsuccessful. </font> : Reason ".mysqli_error($db) ."</span>";
		//dont increment number of recorded
		$recorded =0;
		//return multi values
		return array($recorded, $skip, $error);
	}
}//end of function queryExecute()

/*
This function have action to hold value which user posted 
*/
function radioButton($radioname, $validity)
{
	if($_POST[$radioname] == $validity)
	{
		echo "checked=\"checked\"";
	}
}
/*
This function have action to hold value which user posted 
*/
function selectOption($option, $validity)
{
	if($_POST[$option] == $validity)
	{
		echo "selected=\"selected\"";
	}
}

 

 function securelogin($username,$password){

               global $db;
               $qry ="SELECT * FROM staff WHERE username = '$username' and register = 1 limit 1";
               $res =mysqli_query($db,$qry);
               $row =mysqli_fetch_array($res);

               $hashedpwd = $row['password'];
             
              
                if(password_verify($password,$hashedpwd)){

                $numrows = mysqli_num_rows($res);
              
                //assign return value to session
                $_SESSION["fname"]=$row["fname"]; //first name
                $_SESSION["mname"]=$row["mname"]; //middle name 
                $_SESSION["lname"]=$row["lname"]; //last name
                $_SESSION["username"]=$row["username"]; //last name
                $_SESSION["securitylevel"]=$row["seculevel"]; //security level
                $_SESSION["staff_id"]=$row["staff_id"]; //staff identification number

                return true;
                
            }else{
               
                return false;
            } 
        }



?>