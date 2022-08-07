<?php
// Building A PHP MySQL Forum Tutorial Series
// Published by Tim Kipp @ www.timkipptutorials.com on February 14, 2011
// This script will act as the home page for your forum and display all the categories of your forum

session_start(); // Start your sessions to allow your page to interact with session variables
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Forum Series - Forum Index</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body>

<div id="wrapper">
<h2>TimKippTutorials | Forum Tutorial Series</h2>
<p>Complete Source Code.</p>

<?php
// Check to see if the person viewing this page is logged in or not
if (!isset($_SESSION['uid'])) {
	echo "<form action='login_parse.php' method='post'>
	Username: <input type='text' name='username' />&nbsp;
	Password: <input type='password' name='password' />&nbsp;
	<input type='submit' name='submit' value='Log In' />
	";
} else {
	echo "<p>You are logged is as ".$_SESSION['username']." &bull; <a href='logout_parse.php'>Logout</a>";
}
?>

<hr />
<div id="content">
<?php
// Connect to the database
include_once("connect.php");
// Select all the data from the categories table in your database and order them by the category_title
$sql = "SELECT * FROM categories ORDER BY category_title ASC";
// Execute the SELECT query
$res = mysql_query($sql) or die(mysql_error());
$categories = "";
// Check to make sure that the categories table has data in it
if (mysql_num_rows($res) > 0) {
	// Retrieve data from the categories table
	while ($row = mysql_fetch_assoc($res)) {
		// Assign local variables from each field in the categories table
		$id = $row['id'];
		$title = $row['category_title'];
		$description = $row['category_description'];
		// Append the data from the categories table into a list of links
		$categories .= "<a href='view_category.php?cid=".$id."' class='cat_links'>".$title." - <font size='-1'>".$description."</font></a>";
	}
	// Display list of links
	echo $categories;
} else {
	// If there are is no data in the categories table
	echo "<p>There are no categories available yet.</p>";
}
?>
</div>
</div>

</body>
</html>