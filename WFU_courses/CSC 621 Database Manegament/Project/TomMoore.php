<?php
// Connecting, selecting database
// UPDATE THIS FILE TO HAVE THE PASSWORD APPROPRIATE FOR THE ROOT MYSQL USER INSTEAD OF PASSWORD_GOES_HERE!!!!
$link = mysql_connect('localhost', 'root', '3214Me!') or die('Could not connect: ' . mysql_error());
//echo 'Connected successfully<P>';
mysql_select_db('HSP') or die('Could not select database');

echo "You have successfully logged in.<br><br>";

echo " Welcome! Dear Tom Moore!!<br><br>";

// Performing SQL query

$query ="select staffnumber, firstname, lastname, sex, cdtnname from doctor d, cdtn c where d.firstname='Tom' and d.lastname='Moore' and d.cdtntype=c.cdtntype;";
//"SELECT * FROM patient WHERE firstname='Ellen' AND lastname='Jones'";
//$query = 'SELECT * FROM hotel WHERE city=\'Winston-Salem\'';
$result = mysql_query($query) or die('Query failed: ' . mysql_error());

// Printing results in HTML
printf("<B>--Your personal information--</B><BR>");
printf("<table border=3 cellspacing=3 cellpadding=3>\n");
printf("<tr><th>Your Staff ID</th><th>First Name</th><th>Last Name</th><th>Sex</th><th>Treat Condition</th></tr>\n");
while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
    printf("<tr>\n");
    printf("<td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td>\n", $line["staffnumber"], $line["firstname"],$line["lastname"],$line["sex"],$line["cdtnname"]);
    printf("</tr>\n");
}
printf("</table>\n");
//echo " <br><br>";

$query1 ="select croomnumber, c.cdtnname, p.firstname, p.lastname, p.sex, date, time from appointment ap, patient p, doctor d, cdtn c where ap.patientnumber=p.patientnumber and ap.staffnumber=d.staffnumber and d.firstname='Tom' and d.lastname='Moore' and c.cdtntype=p.cdtntype";
$result1 = mysql_query($query1) or die('Query failed: ' . mysql_error());

printf("<br><B>--All Your Appointments--</B><BR>");
printf("<table border=3 cellspacing=3 cellpadding=3>\n");
printf("<tr><th>Consulting Room</th><th>Condition</th><th>Patient's Last Name</th><th>Patient's Last Name</th><th>Patient's Sex</th><th>Date</th><th>Time</th>\n");
while ($line = mysql_fetch_array($result1, MYSQL_ASSOC)) {
    printf("<tr>\n");
    printf("<td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td>\n", $line["croomnumber"], $line["cdtnname"], $line["firstname"],$line["lastname"],$line["sex"],$line["date"],$line["time"]);
    printf("</tr>\n");
}
printf("</table>\n");

echo "<br><a href='http://10.104.250.237/logout.php'>Logout</a><br>";

//echo "<br><a href='http://10.104.250.237/makeapp.php'>Make another appointment</a> ";


// Free resultset
mysql_free_result($result);
mysql_free_result($result1);
// Closing connection
mysql_close($link);
?>
