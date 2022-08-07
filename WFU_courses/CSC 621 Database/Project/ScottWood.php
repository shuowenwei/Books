<?php
// Connecting, selecting database
// UPDATE THIS FILE TO HAVE THE PASSWORD APPROPRIATE FOR THE ROOT MYSQL USER INSTEAD OF PASSWORD_GOES_HERE!!!!
$link = mysql_connect('localhost', 'root', '3214Me!') or die('Could not connect: ' . mysql_error());
//echo 'Connected successfully<P>';
mysql_select_db('HSP') or die('Could not select database');

echo "You have successfully logged in.<br><br>";

echo " Welcome! Dear Scott Wood!!<br><br>";

// Performing SQL query

$query ="select patientnumber, firstname, lastname, sex, address, cdtnname from patient p, cdtn c where p.firstname='Scott' and p.lastname='Wood' and p.cdtntype=c.cdtntype";
//"SELECT * FROM patient WHERE firstname='Ellen' AND lastname='Jones'";
//$query = 'SELECT * FROM hotel WHERE city=\'Winston-Salem\'';
$result = mysql_query($query) or die('Query failed: ' . mysql_error());

// Printing results in HTML
printf("<B>--Your personal information--</B><BR>");
printf("<table border=3 cellspacing=3 cellpadding=3>\n");
printf("<tr><th>ID</th><th>First Name</th><th>Last Name</th><th>Sex</th><th>Address</th><th>Condition</th></tr>\n");
while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
    printf("<tr>\n");
    printf("<td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td>\n", $line["patientnumber"], $line["firstname"],$line["lastname"],$line["sex"],$line["address"],$line["cdtnname"]);
    printf("</tr>\n");
}
printf("</table>\n");
//echo " <br><br>";

$query1 ="select croomnumber, d.firstname, d.lastname, date, time from appointment ap, patient p, doctor d where ap.patientnumber=p.patientnumber and ap.staffnumber=d.staffnumber and p.firstname='Scott' and p.lastname='Wood'";
$result1 = mysql_query($query1) or die('Query failed: ' . mysql_error());

printf("<br><B>--Your Appointments--</B><BR>");
printf("<table border=3 cellspacing=3 cellpadding=3>\n");
printf("<tr><th>Consulting Room</th><th>Doctor's Last Name</th><th>Doctor's Last Name</th><th>Date</th><th>Time</th>\n");
while ($line = mysql_fetch_array($result1, MYSQL_ASSOC)) {
    printf("<tr>\n");
    printf("<td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td>\n", $line["croomnumber"], $line["firstname"],$line["lastname"],$line["date"],$line["time"]);
    printf("</tr>\n");
}
printf("</table>\n");


echo "<br><a href='http://10.104.250.237/makeapp.php'>Make another appointment</a><br>";

echo "<br><a href='http://10.104.250.237/cancelapp.php'>Cancel your appointments</a><br>";

echo "<br><a href='http://10.104.250.237/logout.php'>Logout</a><br>";

// Free resultset
mysql_free_result($result);
mysql_free_result($result1);
// Closing connection
mysql_close($link);
?>
