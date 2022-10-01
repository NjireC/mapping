<?php

/**
* Created by Dickson Msaky @ Ifakara Health Insitute (2018)
**/ 

require_once('load.php');

/*

Function to generate drop down menu of user names

(Dynamic Drop Down Menu From Entity)

*/

function user_DD_Menu($selectorname, $query, $onclick)

{//start of function user_DD_Menu

	//execute query

	global $db;



	$result = mysqli_query($db,$query);

	//count number of row from Entity query

	$num_row = mysqli_num_rows($result);

	//display SELECT HTML tag

	echo "<select  "; 

	//clear all value in varaible onclick

	$onclick_event = "";	

	//check if onclick	

	if($onclick==1)

	{

		echo "onChange=\"upDate()\"";

	}

	echo " id=\"".$selectorname."\" name=\"".$selectorname."\"><br />";

	//Check number of row is equal to 0

	if($num_row==0)

	{

		//display this message if their is no data in table 

		echo "<option value=\"\">No data</option> <br />"; 

	}

	elseif($num_row>0)

	{

		$i = 1;

		//echo "<option value='NOP'>None</option> <br />";

		while ($i <= $num_row)

		{					

			//fetch data from array

			$detail=mysqli_fetch_array($result); 

			//extract user_id from array

			$col_id =$detail[staff_id]; 

			//extract name from array and concatinate

			$Name = $detail[fname]." ".$detail[mname]." ".$detail[lname]; 

			//display option tag to webpage

			if($onclick == 2)

			{//display names and it value to be names  

				echo "<option value='$Name'>$Name</option> <br />";

			}

			else

			{//display name and staff_id for value

				echo "<option value='$col_id'>$Name</option> <br />";

			}

			//increment line 

			$i++;

		}	

	}

	echo "</select>";	

}//End of function



/*

Function to generate drop down menu

(Dynamic Drop Down Menu From Entity)

*/

function ddmenu($selectorname, $query, $unique_id, $name, $condition)

{

	global $db;

	//execute query

	$result = mysqli_query($db,$query);

	//count number of row from Entity query

	$num_row = mysqli_num_rows($result);

	//display SELECT HTML tag

	echo "<select name=\"".$selectorname."\""; 

	if($condition==1)

	{

		echo " onChange=\"update_ward(this.selectedIndex)\"";

	

	}

	echo " ><br />";

	//Check number of row is equal to 0

	if($num_row==0)

	{

		//display this message if their is no data in table 

		echo "<option value=\"\">No data</option> <br>"; 

	}

	elseif($num_row>0)

	{

		echo "<option value=''>Select Required</option> <br>";

		$i = 1;

		while ($i <= $num_row)

		{					

			//fetch data from array

			$detail=mysqli_fetch_array($result); 

			$col_id =$detail[$unique_id];

			$Name =$detail[$name];

			echo "<option value='$col_id'>$Name</option> <br>";

			$i++;

		}	

	}

	echo "</select>";	

}



//function to genarate initials of staff

function ddmenuinitial($select_name)

{

	

    global $db;



	$query = "SELECT * FROM staff";

	//execute query 

	$result = mysqli_query($db,$query); 

	//count number of row

	$num_row = mysqli_num_rows($result);  

	echo "<select name=\"".$select_name."\" ><br>";

	if($num_row==0)

	{

	//display if their is no data in table

	echo "<option value=\"\">No data</option> <br>"; 

	}

	elseif($num_row>0)

	{

		$i = 1;

		while ($i <= $num_row)

		{					

			//fetch data from array

			$detail=mysqli_fetch_array($result); 

			//strip first for char names of staff

			$initial = substr($detail[fname], 0,1).substr($detail[mname], 0,1).substr($detail[lname], 0,1); 

			//$Name = strtoupper($Name);

			$Name = $detail[fname]." ".$detail[mname]." ".$detail[lname];			

			echo "<option value='$initial'>$Name</option> <br>";

			$i++;

		}	

	}

	echo "</select>";

}



/*

This function have function to download comma separeted value to browser

*/

function echocsv2($fields)

{		

	echo $fields;	 

	echo "\r\n";

}


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

function echocsverror($fields)

{		

	echo $fields;	 

	echo "<br>";

}

/*

This function have action of  autoPopulate data 

*/



function autoPopulate($name, $title, $value, $data, $query)

{

	//execute query

	//$result = mysqli_query($db,$query);

	global $db;



	if(!$result = mysqli_query($db,$query)){

    die('There was an error running the query [' . mysqli_error($db) . ']');

      }





	//count number of row from Entity query

	$num_row = mysqli_num_rows($result);

	//display SELECT HTML tag

	echo "<select tabindex=\"2\" name=\"".$name."\" title=\"".$title."\">\n";    

	if($num_row == 0)

	{

		echo "<option value=''>No data</option> \n";

	}

	elseif($num_row > 0)

	{

		echo "<option value=\"\">Choose data </option> \n";

		//create array function

		$data_array = array();

		//explode variable $data

		$data_array = explode(";",$data);

		//fetch data from the query execute above

		while($row = mysqli_fetch_array($result))

		{

			//Clear data from variable $option_data

			$option_data ="";

			//fetch data in array $data_array

			foreach($data_array as $data)

			{

				//check if their are data

				if(isset($data))

				{

					//hold data from fetch row

					$option_data = $option_data." ".$row[$data];

				}				

			}

			//show option 

			echo "<option value='$row[$value]'>$option_data</option> \n";

		}

	}

	echo "</select>\n";









}



function autoPopulate2($name, $title, $value, $data, $query)

{

	global $db;



	//execute query

	$result = mysqli_query($db,$query);

	//count number of row from Entity query

	$num_row = mysqli_num_rows($result);

	//display SELECT HTML tag

	echo "<select tabindex=\"2\" class=\"select-full\" name=\"".$name."\" title=\"".$title."\">\n";    

	if($num_row == 0)

	{

		echo "<option value=''>No data</option> \n";

	}

	elseif($num_row > 0)

	{

		echo "<option value=\"\">Choose data </option> \n";

		//create array function

		$data_array = array();

		//explode variable $data

		$data_array = explode(";",$data);

		//fetch data from the query execute above

		while($row = mysqli_fetch_array($result))

		{

			//Clear data from variable $option_data

			$option_data ="";

			//fetch data in array $data_array

			foreach($data_array as $data)

			{

				//check if their are data

				if(isset($data))

				{

					//hold data from fetch row

					$option_data = $option_data." ".$row[$data];

				}				

			}

			//show option 

			echo "<option value='$row[$value]'>$option_data</option> \n";

		}

	}

	echo "</select>\n";

}







function autoPopulate3($id,$name, $title, $value, $data, $query)

{

	//execute query

	//$result = mysqli_query($db,$query);

	global $db;



	if(!$result = mysqli_query($db,$query)){

    die('There was an error running the query [' . mysqli_error($db) . ']');

      }





	//count number of row from Entity query

	$num_row = mysqli_num_rows($result);

	//display SELECT HTML tag

	echo "<select tabindex=\"2\" class=\"select\" name=\"".$name."\" title=\"".$title."\">\n";    

	if($num_row == 0)

	{

		echo "<option value=''>No data</option> \n";

	}

	elseif($num_row > 0)

	{

		echo "<option value=\"\">Choose data </option> \n";

		//create array function

		$data_array = array();

		//explode variable $data

		$data_array = explode(";",$data);

		//fetch data from the query execute above

		while($row = mysqli_fetch_array($result))

		{

			//Clear data from variable $option_data

			$option_data ="";

			//fetch data in array $data_array

			foreach($data_array as $data)

			{

				//check if their are data

				if(isset($data))

				{

					//hold data from fetch row

					$option_data = $option_data." ".$row[$data];

				}				

			}



			if ($id == $row[$value])

		    {

		        $selected = 'selected';

		    }

		    else

		    {

		    $selected = '';

		    }

  



			//show option 

			echo "<option value='$row[$value]' ".$selected.">$option_data</option> \n";

		}

	}

	echo "</select>\n";









}



/*

This function have action of  autoPopulate data 

*/



function autoPopulateAjax($name, $title, $value, $data, $query, $onchange)

{

	global $db;

	//execute query

	$result = mysqli_query($db,$query);

	//count number of row from Entity query

	$num_row = mysqli_num_rows($result);

	//clear onchange value variable

	$onchange_value ="";

	//determine if onchange variable have value

	if($onchange != "")

	{

		$onchange_value="onChange=\"".$onchange."\"";

	}

	//display SELECT HTML tag

	echo "<select class=\"select-full\" name=\"".$name."\"  id=\"".$name."\" ".$onchange_value."  title=\"".$title."\">\n";

	if($num_row == 0)

	{

		echo "<option value=''>No data</option> \n";

	}

	elseif($num_row > 0)

	{

		echo "<option value=\"\">Choose data </option>\n";

		//create array function

		$data_array = array();

		//explode variable $data

		$data_array = explode(";",$data);

		//fetch data from the query execute above

		while($row = mysqli_fetch_array($result))

		{

			//Clear data from variable $option_data

			$option_data ="";

			//fetch data in array $data_array

			foreach($data_array as $data)

			{

				//check if their are data

				if(isset($data))

				{

					//hold data from fetch row

					$option_data = $option_data." ".$row[$data];

				}				

			}

			//show option 

			echo "<option value='$row[$value]'>$option_data</option> \n";

		}

	}

	echo "</select>\n";

}



/*

this function populate list to user according to choise of user

*/

function populate($name, $value, $title, $query, $function, $message)

{//start of function populate

	//execute query

	$result = mysqli_query($db,$query);

	//count number of row from Entity query

	$num_row = mysqli_num_rows($result);

	//clear $function_value variable

	$function_value="";

	//determine if onchange variable have value

	if($function != "")

	{

		$function_value=$function;

	}

	//display SELECT HTML tag

	echo "<select class=\"select-full\" name=\"".$name."\"  id=\"".$name."\" ".$function_value."  title=\"".$title."\">\n";

	if($num_row == 0)

	{

		echo "<option value=''>$message</option> \n";

	}

	elseif($num_row > 0)

	{

		echo "<option value=\"\">Choose data </option>\n";

		//create array function

		$data_array = array();

		//explode variable $data

		$data_array = explode(";",$data);

		//fetch data from the query execute above

		while($row = mysqli_fetch_array($result))

		{

			//Clear data from variable $option_data

			$option_data ="";

			//fetch data in array $data_array

			foreach($data_array as $data)

			{

				//check if their are data

				if(isset($data))

				{

					//hold data from fetch row

					$option_data = $option_data." ".$row[$data];

				}				

			}

			//show option 

			echo "<option value='$row[$value]'>$option_data</option> \n";

		}

	}

	echo "</select>\n";

}





//class for authentication user idenfication from system

class authentication{

	





// AUTHENTICATE



	function authenticate($q,$password) 

	{

	    

	    global $db;

		

		$result = mysqli_query($db,$q); 		

		$numrows = mysqli_num_rows($result);

		$row = mysqli_fetch_array($result);	



		$hashedpass = $row["password"];



		// CHECK IF THERE ARE RESULTS

		// Logic: If the number of rows of the resulting recordset is 0, that means that no

		// match was found. Meaning, wrong username-password combination.

		if ($numrows == 0) 

		{

			return 0;

		}                

        

		else 

		{

			return  array($numrows, $row);

		}

	}

	

	

} // End: class authentication







































