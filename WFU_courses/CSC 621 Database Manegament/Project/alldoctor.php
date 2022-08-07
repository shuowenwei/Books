<?php
// Connecting, selecting database
// UPDATE THIS FILE TO HAVE THE PASSWORD APPROPRIATE FOR THE ROOT MYSQL USER INSTEAD OF PASSWORD_GOES_HERE!!!!
$link = mysql_connect('localhost', 'root', '3214Me!') or die('Could not connect: ' . mysql_error());
//echo 'Connected successfully<P>';
mysql_select_db('HSP') or die('Could not select database');

// Performing SQL query
$query = 'select staffnumber, firstname, lastname, sex, cdtnname from doctor d, cdtn c where d.cdtntype=c.cdtntype;';
$result = mysql_query($query) or die('Query failed: ' . mysql_error());

// Printing results in HTML
//select staffnumber,firstname,lastname,cdtnname from doctor d, cdtn c where d.cdtntype=c.cdtntype;

printf("<B>--All the condition we can treat--</B><BR>");
printf("<table border=3 cellspacing=3 cellpadding=3>\n");
printf("<tr><th>staff number</th><th>First Name</th><th>Last Name</th><th>Sex</th><th>can treat</th></tr>\n");
while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
    printf("<tr>\n");
    printf("<td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td>\n", $line["staffnumber"], $line["firstname"],$line["lastname"],$line["sex"],$line["cdtnname"]);
    printf("</tr>\n");
}
printf("</table>\n");


//printf("NEW");
//echo "new";
//echo "<a href='http://10.104.250.237/EllenJonesappt.php'>Check your appointment</a> ";


// Free resultset
mysql_free_result($result);

// Closing connection
mysql_close($link);
?>
