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


if (isset($_POST['patientnumber'])) {
	$patientnumber = $_POST['patientnumber'];
	$date = $_POST['date'];
	$time = $_POST['time'];
	
	$query="DELETE FROM appointment where patientnumber='".$patientnumber."' and date='".$date."' and time='".$time."'";
	$result = mysql_query($query) or die(mysql_error());
	
	$query2 = "SELECT firstname, lastname FROM patient WHERE patientnumber='".$patientnumber."'";
	$result2 = mysql_query($query2) or die('Query failed: ' . mysql_error());
	$line2 = mysql_fetch_array($result2, MYSQL_ASSOC);
	//$firstname = $result2['firstname'];
	//$lastname = $result2['lastname'];
	header("Location: ".$line2["firstname"]."".$line2["lastname"].".php");


//header("Location: ".$firstname."".$lastname.".php");

// Free resultset
mysql_free_result($result);
mysql_free_result($result2);


// Closing connection
mysql_close($link);
mysql_close($link2);

}
?>
