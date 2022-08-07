<?php
// All code was wrote by Tim Kipp @ TimKippTutorials.com - December 10, 2010

$host = "YOUR_HOST";
$username = "YOUR_USERNAME";
$password = "YOUR_PASSWORD";
$db = "YOUR_DATABASE";

$connect = mysql_connect($host, $username, $password);

if ($connect) {
	echo "Connection successful.";
	$select = mysql_select_db($db);
	if ($select) {
		echo "<br />Connected to ".$db;
	} else {
		echo "<br />Unable to connect to ".$db;
	}
} else {
	echo "Failed connection.";
}

?>