<?php
// All code was wrote by Tim Kipp @ TimKippTutorials.com - December 29, 2010
// Your MySQL database login information
//$host = ""; // Your host address to your database on your server. Usually "localhost". Check with your hosting provider
//$user = ""; // Your username you set up for this database on your server
//$pass = ""; // Your password you set up for this database on your server
//$db = ""; // The database name that you will be connecting to

// Connecting to the MySQL database
$link = mysql_connect('localhost', 'root', '3214Me!') or die('Could not connect: ' . mysql_error());
mysql_select_db('HSP') or die('Could not select database');

echo "<br><a href='http://10.104.250.237/alldoctor.php' information.php'>Check all doctors' information, click here</a><br>";

$query1 ="select croomnumber, cdtnname from consultingroom cr, cdtn c where cr.cdtntype=c.cdtntype;";
$result1 = mysql_query($query1) or die('Query failed: ' . mysql_error());
// Printing results in HTML
printf("<br><B>--Current Consulting Room information--</B><BR>");
printf("<table border=3 cellspacing=3 cellpadding=3>\n");
printf("<tr><th>Consulting Room</th><th>Condition Type</th></tr>\n");
while ($line = mysql_fetch_array($result1, MYSQL_ASSOC)) {
    printf("<tr>\n");
    printf("<td>%s</td><td>%s</td>\n", $line["croomnumber"], $line["cdtnname"]);
    printf("</tr>\n");
}
printf("</table>\n");
//echo " <br><br>";

// Checking to see if the login form has been submitted

if (isset($_POST['staffnumber'])) {
	$staffnumber = $_POST['staffnumber'];
	$croomnumber = $_POST['croomnumber'];
	$patientnumber = $_POST['patientnumber'];
	$date = $_POST['date'];
	$time = $_POST['time'];
	
	$query3 ="select croomnumber, date, time from appointment where croomnumber='".$croomnumber."' and date='".$date."' and time='".$time."';";
	$result3 = mysql_query($query3);
	
	$query4 ="select d.firstname, d.lastname, a.date, a.time from appointment a, doctor d where a.staffnumber=d.staffnumber and a.staffnumber='".$staffnumber."' and a.date='".$date."' and a.time='".$time."';";
	$result4 = mysql_query($query4);
	
	$query5 ="select * from patient p, doctor d, consultingroom cr, cdtn c where p.patientnumber='".$patientnumber."' and d.staffnumber='".$staffnumber."' and cr.croomnumber='".$croomnumber."' and d.cdtntype=p.cdtntype and p.cdtntype=cr.cdtntype and cr.cdtntype=c.cdtntype and c.cdtntype=d.cdtntype";
	$result5 = mysql_query($query5);
    
	
	if ($line = mysql_fetch_array($result3, MYSQL_ASSOC)) 
	{
		echo "<br>Sorry! The consulting room ".$line["croomnumber"]." room  is occupied on ".$line["date"]." at ".$line["time"].", please choose another room or time.<br>";
		exit();
	}
	else
	{
		if ($line1 = mysql_fetch_array($result4, MYSQL_ASSOC)) 
		{
			echo "<br>Dr. ".$line1["firstname"]." ".$line1["lastname"]." has other appointments and is not available on ".$line1["date"]." at ".$line1["time"].", sorry for this and please make an appointment with another doctor.";
			exit();
		}
		else
		{
			if(mysql_num_rows($result5) == 0) 
			{
				echo "<br>Dr. ".$line1["firstname"]." ".$line1["lastname"]." doesn't treat your condition or the consulting room ".$croomnumber." is not used for your condition";
				exit();
			}
			else
			{
				$query="INSERT INTO appointment VALUES('".$staffnumber."','".$croomnumber."','".$patientnumber."','".$date."','".$time."')";
				$result = mysql_query($query) or die(mysql_error());
				}
		}
	}


		//echo "You have successfully logged in.<br><br>";
		//include '$firstname.php';
		//echo "<a href='http://10.104.250.237/."$firstname."."$lasttname."' information.php'>Welcome, ."$firstname."."$lasttname."</a> ";
		//echo "/n Welcome! "; 		echo $firstname ; echo $lastname;
		//go to "index.php";
		//content="5";
		//<meta http-equiv="refresh" content="5; url=".$firstname."".$lastname.".php ">;
		//header("Location: ".$firstname."".$lastname.".php");
		//exit();
		//exit();
	// If login information is invalid
	
	
	// Query to check to see if the username and password supplied match the database records
	
    //$query="INSERT INTO appointment VALUES('".$staffnumber."','".$croomnumber."','".$patientnumber."','".$date."','".$time."')";
	
    //printf("que: %s",$query);
	//echo mysql_error($link);
    //$sql = "INSERT INTO topics (category_id, topic_title, topic_creator, topic_date, topic_reply_date) VALUES ('".$cid."', '".$title."', '".$creator."', now(), now())";

    //$query = "SELECT * FROM patient WHERE firstname='".$firstname."' AND lastname='".$lastname."'";
	//$result = mysql_query($query) or die(mysql_error());
	// If login information is correct
	//if (mysql_num_rows($result) == 1) {
		//echo "You have successfully logged in.<br><br>";
		//include '$firstname.php';
		//echo "<a href='http://10.104.250.237/."$firstname."."$lasttname."' information.php'>Welcome, ."$firstname."."$lasttname."</a> ";
		//echo "/n Welcome! "; 		echo $firstname ; echo $lastname;
		//go to "index.php";
		//content="5";
		//<meta http-equiv="refresh" content="5; url=".$firstname."".$lastname.".php ">;
		//header("Location: ".$firstname."".$lastname.".php");
		//exit();
		//exit();
	//} 
	// If login information is invalid
	//else {
		//echo "Invalid login information. Please return to the previous page.";
		//exit();
	//}
	$query2 = "SELECT firstname, lastname FROM patient WHERE patientnumber='".$patientnumber."'";
	$result2 = mysql_query($query2) or die('Query failed: ' . mysql_error());
	$line2 = mysql_fetch_array($result2, MYSQL_ASSOC);
	//$firstname = $result2['firstname'];
	//$lastname = $result2['lastname'];
	header("Location: ".$line2["firstname"]."".$line2["lastname"].".php");
}

//header("Location: ".$firstname."".$lastname.".php");

// Free resultset
mysql_free_result($result);
mysql_free_result($result1);
mysql_free_result($result2);
mysql_free_result($result3);
mysql_free_result($result4);
mysql_free_result($result5);

// Closing connection
mysql_close($link);
mysql_close($link1);
mysql_close($link2);
mysql_close($link3);
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>log in information</title>
</head>

<body>
<h1>Please fill in all information below</h1>
<form method="post" action="makeapp.php">
Doctor's ID: <input type="text" name="staffnumber" /><br /><br />
Consulting Room: <input type="text" name="croomnumber" /><br /><br />
Your ID: <input type="text" name="patientnumber" /><br /><br />
Date: <input type="text" name="date" /><br /><br />
time: <input type="text" name="time" /><br /><br />
<input type="submit" name="submit" value="make an appointment" />
</form>

<a href='http://10.104.250.237/logout.php'>Logout</a><br>

</body>
</html>

