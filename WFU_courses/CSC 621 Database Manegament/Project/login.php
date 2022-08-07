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


// Checking to see if the login form has been submitted
if (isset($_POST['firstname'])) {
	$firstname = $_POST['firstname'];
	$lastname = $_POST['lastname'];
	// Query to check to see if the username and password supplied match the database records
	$query = "SELECT * FROM patient WHERE firstname='".$firstname."' AND lastname='".$lastname."'";
	$result = mysql_query($query);
	// If login information is correct
	if (mysql_num_rows($result) == 1) {
		//echo "You have successfully logged in.<br><br>";
		//include '$firstname.php';
		//echo "<a href='http://10.104.250.237/."$firstname."."$lasttname."' information.php'>Welcome, ."$firstname."."$lasttname."</a> ";
		//echo "/n Welcome! "; 		echo $firstname ; echo $lastname;
		//go to "index.php";
		//content="5";
		//<meta http-equiv="refresh" content="5; url=".$firstname."".$lastname.".php ">;
		header("Location: ".$firstname."".$lastname.".php");
		exit();
		//exit();
	} 
	// If login information is invalid
	else {
		echo "Invalid login information. Please return to the previous page.";
		exit();
	}
}
// Free resultset
mysql_free_result($result);

// Closing connection
mysql_close($link);

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>log in information</title>
</head>

<body>
<h1>--Patient login--</h1>
<form method="post" action="login.php">
First Name: <input type="text" name="firstname" /><br /><br />
Last Name: <input type="text" name="lastname" /><br /><br />
<input type="submit" name="submit" value="Log In" />
</form>
</body>
</html>

