<?php
// Building A PHP MySQL Forum Tutorial Series
// Published by Tim Kipp @ www.timkipptutorials.com on February 14, 2011
// This script will allow you to connect to your MySQL database using PHP

$host = "YOUR_HOST_HERE"; // the host info assigned by your hosting provider
$username = "YOUR_USERNAME_HERE"; // the username you supply when setting up your database
$password = "YOUR_PASSWORD_HERE"; // the password you chose for your database
$db = "YOUR_DATABASE_NAME"; // the database name you assigned when setting up your database

// Information below will try connecting to your database with the information you specified above
// A mysql_connect error occurs when your host, username, or password are incorrect
mysql_connect($host, $username, $password) or die(mysql_error());
// A mysql_select_db error occurs when the database name you specify does not exist
mysql_select_db($db) or die(mysql_error());
?>