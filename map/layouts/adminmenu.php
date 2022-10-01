<?php

$i = $current_user["seculevel"];

$extension="php";

$p = $i. "." .$extension; 

switch ($i) {
case 1:
     include_once($p);
     break;
case 2:
      include_once($p);
     break;
case 3:
     include_once($p);
     break;

}




?>