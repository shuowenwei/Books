<?php
// All code was wrote by Tim Kipp @ TimKippTutorials.com - December 29, 2010

// Your MySQL database login information
$host = ""; // Your host address to your database on your server. Usually "localhost". Check with your hosting provider
$user = ""; // Your username you set up for this database on your server
$pass = ""; // Your password you set up for this database on your server
$db = ""; // The database name that you will be connecting to

// Connecting to the MySQL database
mysql_connect($host, $user, $pass);
mysql_select_db($db);

// Checking to see if the login form has been submitted
if (isset($_POST['username'])) {
	$username = $_POST['username'];
	$password = $_POST['password'];
	// Query to check to see if the username and password supplied match the database records
	$sql = "SELECT * FROM users WHERE username='".$username."' AND password='".$password."' LIMIT 1";
	$res = mysql_query($sql);
	// If login information is correct
	if (mysql_num_rows($res) == 1) {
		echo "You have successfully logged in.";
		exit();
	} 
	// If login information is invalid
	else {
		echo "Invalid login information. Please return to the previous page.";
		exit();
	}
}

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<h1>Forum Tutorial Login</h1>
<form method="post" action="login.php">
Username: <input type="text" name="username" /><br /><br />
Password: <input type="password" name="password" /><br /><br />
<input type="submit" name="submit" value="Log In" />
</form>
</body>
</html>