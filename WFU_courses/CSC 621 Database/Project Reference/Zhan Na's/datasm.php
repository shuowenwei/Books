<?php
require("sqlinfo.php");

// Gets data from URL parameters
$address = $_GET['useraddress'];
$city = $_GET['usercity'];
$state = $_GET['userstate'];
$lat = $_GET['lat'];
$lng = $_GET['lng'];
$summary = $_GET['usersum'];
$description = $_GET['userdescript'];
//$imagefile = $_GET['imagefile'];
$name = $_GET['name'];
$email = $_GET['useremail'];
//upload picture
//print_r($_FILES["imagefile"]);

//$date = now();
//$image = '';
// Opens a connection to a MySQL server
$connection=mysql_connect ("localhost", $username, $password);
if (!$connection) {
  die('Not connected : ' . mysql_error());
}

// Set the active MySQL database
$db_selected = mysql_select_db($database, $connection);
if (!$db_selected) {
  die ('Can\'t use db : ' . mysql_error());
}

// Insert new row with user data
mysql_query("BEGIN");
$query = sprintf("INSERT INTO post " .
         " (post_id,street_address,city,state,lat,lng,date,summary,description,username,useremail ) " .
         " VALUES ('', '%s', '%s', '%s', '%s', '%s',now(),'%s','%s','%s','%s');",
        
         mysql_real_escape_string($address),
         mysql_real_escape_string($city),
         mysql_real_escape_string($state),
         mysql_real_escape_string($lat),
         mysql_real_escape_string($lng),
      //   mysql_real_escape_string($date),
         mysql_real_escape_string($summary),
         mysql_real_escape_string($description),
       //  mysql_real_escape_string($image),
         mysql_real_escape_string($name),
         mysql_real_escape_string($email));
$result = mysql_query($query);
//$sql_id = "select post_id from post";
//$res=mysql_query($sql_id);
//$row=mysql_fetch_array($res);
//echo $row[0];
$sql_id = mysql_insert_id();
//echo  $sql_id;
if (!$result) {
  mysql_query("ROLLBACK");
 // die('Invalid query: ' . mysql_error());
}else {
  mysql_query("COMMIT");
  header("Location:addData.php?id=$sql_id");	
}
  mysql_query("END");
?>

