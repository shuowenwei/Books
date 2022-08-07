<?php
// All code was wrote by Tim Kipp @ TimKippTutorials.com - December 10, 2010

// This code will allow you to connect to a MySQL database.

// your host may be "localhost" but some hosts may be different
$db_host = "YOUR_HOST_NAME";

// your username will be the one you specify when you create your database on your server
$db_username = "YOUR_USERNAME";

// your password that you specify when you create your database on your server
$db_pass = "YOUR_PASSWORD"; 

// your db_name will be to database name that you used when creating your database
$db_name = "YOUR_DATABASE"; 

// ----------------------------DO NOT CHANGE BELOW HERE-----------------------------

// db_connection runs the "mysql_connect" function that uses all your information
// from above and tries to connect to your personal database on your server
$db_connection = mysql_connect("$db_host","$db_username","$db_pass", "$db_name") or die (mysql_error());

// "mysql_select_db" is saying which database to draw the information from
mysql_select_db("$db_name");
?>