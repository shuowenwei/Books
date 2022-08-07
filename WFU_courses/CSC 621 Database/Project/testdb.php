<?php
// Connecting, selecting database
// UPDATE THIS FILE TO HAVE THE PASSWORD APPROPRIATE FOR THE ROOT MYSQL USER INSTEAD OF PASSWORD_GOES_HERE!!!!
$link = mysql_connect('localhost', 'root', '3214Me!') or die('Could not connect: ' . mysql_error());
//echo 'Connected successfully<P>';
mysql_select_db('DBH') or die('Could not select database');

// Performing SQL query
$query = 'SELECT * FROM hotel WHERE city=\'Winston-Salem\'';
$result = mysql_query($query) or die('Query failed: ' . mysql_error());

// Printing results in HTML
printf("<B>--Hotels In Winston Salem--</B><BR>");
printf("<table border=2 cellspacing=2 cellpadding=2>\n");
printf("<tr><th>Hotel Number</th><th>Hotel Name</th></tr>\n");
while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
    printf("<tr>\n");
    printf("<td>%s</td><td>%s</td>\n", $line["hotelNumber"], $line["hotelName"]);
    printf("</tr>\n");
}
printf("</table>\n");

// Free resultset
mysql_free_result($result);

// Closing connection
mysql_close($link);
?>
