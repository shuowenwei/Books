<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>log in information</title>
</head>

<body>
<h1>--To Cancel Your Appointments--</h1>
<form method="post" action="cancelapp.php">
Your Patient's ID: <input type="text" name="patientnumber" /><br /><br />
<input type="submit" name="submit" value="Login" />
</form>

</body>
</html>

<?php

//$patientnumber = $GET_['patientnumber'];

// Connecting to the MySQL database
$link = mysql_connect('localhost', 'root', '3214Me!') or die('Could not connect: ' . mysql_error());
mysql_select_db('HSP') or die('Could not select database');

// Checking to see if the login form has been submitted
if (isset($_POST['patientnumber'])) {
	$patientnumber = $_POST['patientnumber'];
	// Query to check to see if the username and password supplied match the database records
	$query = "SELECT * FROM appointment a, patient p WHERE a.patientnumber='".$patientnumber."' and a.patientnumber=p.patientnumber";
	$result = mysql_query($query) or die('Query failed: ' . mysql_error());
	$line = mysql_fetch_array($result, MYSQL_ASSOC);
	echo "<br>Hello! ".$line["firstname"]." ".$line["lastname"].", Your ID is ".$line["patientnumber"].". Please input the appointment you want to cancel below. <br>";
		
	
	$query1 ="select ap.patientnumber, croomnumber, d.firstname, d.lastname, date, time from appointment ap, patient p, doctor d where ap.patientnumber=p.patientnumber and ap.staffnumber=d.staffnumber and ap.patientnumber='".$patientnumber."'";
	$result1 = mysql_query($query1) or die('Query failed: ' . mysql_error());

	printf("<br><B>--All the Appointments Your Made--</B><BR>");
	printf("<table border=3 cellspacing=3 cellpadding=3>\n");
	printf("<tr><th>Your patient' ID</th><th>Consulting Room</th><th>Doctor's Last Name</th><th>Doctor's Last Name</th><th>Date</th><th>Time</th>\n");
	while ($line = mysql_fetch_array($result1, MYSQL_ASSOC)){
		    printf("<tr>\n");
			printf("<td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></td>\n", $line["patientnumber"], $line["croomnumber"], $line["firstname"],$line["lastname"],$line["date"],$line["time"]);
			printf("</tr>\n");}
			printf("</table>\n");

//include 'deleteapp.php';

//include 'deleteapp.php';

printf("<br><B>--Input the Appointment You Want to Cancel--</B><BR>");
printf("<br><form method=\"post\" action=\"deleteapp.php\">
Your ID : ".$patientnumber." <input type=\"hidden\" name=\"patientnumber\" value=\"".$patientnumber."\"/><br/><br/>
Date: <input type=\"text\" name=\"date\" /><br /><br />
time: <input type=\"text\" name=\"time\" /><br /><br />
<input type=\"submit\" name=\"submit\" value=\"Cancel this Appointment\" />
</form><BR>");

//Your ID :  ".$patientnumber." <input type=\"hidden\" name=\"patientnumber\" value=".$patientnumber."/><br/><br/>

//include "deleteapp.php";

}


?>
