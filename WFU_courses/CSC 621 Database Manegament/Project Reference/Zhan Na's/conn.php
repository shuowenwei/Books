<?php
$conn = @ mysql_connect("localhost", "root", "root") or die("connection fail");
mysql_select_db("googlemap", $conn);
?>