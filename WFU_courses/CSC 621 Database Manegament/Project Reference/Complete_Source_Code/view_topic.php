<?php
// Building A PHP MySQL Forum Tutorial Series
// Published by Tim Kipp @ www.timkipptutorials.com on February 14, 2011
// This script will allow you to view all topic data that is associated with the topic id in the URL

session_start(); // Start your sessions to allow your page to interact with session variables
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Forum Series - View Topic</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body>

<div id="wrapper">
<h2>TimKippTutorials | Forum Tutorial Series</h2>
<p>Complete Source Code.</p>

<?php
// Check to see if the person accessing this page is logged in
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

// Function that will convert a user id into their username
function getusername($uid) {
	$sql = "SELECT username FROM users WHERE id='".$uid."' LIMIT 1";
	$res = mysql_query($sql) or die(mysql_error());
	$row = mysql_fetch_assoc($res);
	return $row['username'];
}
// Function that will convert the datetime string from the database into a user-friendly format
function convertdate($date) {
	$date = strtotime($date);
	return date("M j, Y g:ia", $date);
}

// Assign local variables from the variables in the URL
$cid = $_GET['cid'];
$tid = $_GET['tid'];
// Select the topic data depending on the $cid and $tid variables
$sql = "SELECT * FROM topics WHERE category_id='".$cid."' AND id='".$tid."' LIMIT 1";
// Execute the SELECT query
$res = mysql_query($sql) or die(mysql_error());
// Check to see if the topic exists
if (mysql_num_rows($res) == 1) {
	echo "<table width='100%'>";
	// Check to see if the person accessing this page is logged in
	if ($_SESSION['uid']) { echo "<tr><td colspan='2'><input type='submit' value='Add Reply' onClick=\"window.location = 'post_reply.php?cid=".$cid."&tid=".$tid."'\" /><hr />"; } else { echo "<tr><td colspan='2'><p>Please log in to add your reply.</p><hr /></td></tr>"; }
	// Fetch all the topic data from the database
	while ($row = mysql_fetch_assoc($res)) {
		// Query the posts table for all posts in the specified topic
		$sql2 = "SELECT * FROM posts WHERE category_id='".$cid."' AND topic_id='".$tid."'";
		// Execute the SELECT query
		$res2 = mysql_query($sql2) or die(mysql_error());
		// Fetch all the post data from the database
		while ($row2 = mysql_fetch_assoc($res2)) {
			// Echo out the topic post data from the database
			echo "<tr><td valign='top' style='border: 1px solid #000000;'><div style='min-height: 125px;'>".$row['topic_title']."<br />by ".getusername($row2['post_creator'])." - ".convertdate($row2['post_date'])."<hr />".$row2['post_content']."</div></td><td width='200' valign='top' align='center' style='border: 1px solid #000000;'>User Info Here</td></tr><tr><td colspan='2'><hr /></td></tr>";
		}
		// Assign local variable for the current number of views that this topic has
		$old_views = $row['topic_views'];
		// Add 1 to the current value of the topic views
		$new_views = $old_views + 1;
		// Update query that will update the topic_views for this topic
		$sql3 = "UPDATE topics SET topic_views='".$new_views."' WHERE category_id='".$cid."' AND id='".$tid."' LIMIT 1";
		// Execute the UPDATE query
		$res3 = mysql_query($sql3) or die(mysql_error());
	}
} else {
	// If the topic does not exist
	echo "<p>This topic does not exist.</p>";
}
?>
</div>
</div>

</body>
</html>