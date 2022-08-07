<?php
// Building A PHP MySQL Forum Tutorial Series
// Published by Tim Kipp @ www.timkipptutorials.com on February 14, 2011
// This script will allow you to create a topic in the category chosen

session_start(); // Start your sessions to allow your page to interact with session variables

// Check to see if the person accessing this page is logged in and that there is a category id in the url
if ((!isset($_SESSION['uid'])) || ($_GET['cid'] == "")) {
	header("Location: index.php");
	exit();
}
// Assign local variables found in the url
$cid = $_GET['cid'];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Forum Series - Create Forum Topic</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<!-- IMPLEMENTING THE TINYMCE WYSIWYG EDITOR -->
<script language="javascript" type="text/javascript" src="tiny_mce/tiny_mce.js"></script>
<script language="javascript" type="text/javascript">
tinyMCE.init({
        theme : "advanced",
        mode : "textareas"
});
</script>
<!-- END TINYMCE SCRIPT -->
</head>

<body>

<div id="wrapper">
<h2>TimKippTutorials | Forum Tutorial Series</h2>
<p>Complete Source Code.</p>

<?php
echo "<p>You are logged is as ".$_SESSION['username']." &bull; <a href='logout_parse.php'>Logout</a>";
?>

<hr />
<div id="content">
<form action="create_topic_parse.php" method="post">
<p>Topic Title</p>
<input type="text" name="topic_title" size="98" maxlength="150" />
<p>Topic Content</p>
<textarea name="topic_content" rows="5" cols="75"></textarea>
<br /><br />
<input type="hidden" name="cid" value="<?php echo $cid; ?>" />
<input type="submit" name="topic_submit" value="Create Your Topic" />
</form>
</div>
</div>

</body>
</html>