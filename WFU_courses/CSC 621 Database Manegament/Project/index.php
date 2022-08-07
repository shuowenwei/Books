<?php
// Connecting, selecting database
// UPDATE THIS FILE TO HAVE THE PASSWORD APPROPRIATE FOR THE ROOT MYSQL USER INSTEAD OF PASSWORD_GOES_HERE!!!!
$link = mysql_connect('localhost', 'root', '3214Me!') or die('Could not connect: ' . mysql_error());
//echo 'Connected successfully<P>';
mysql_select_db('HSP') or die('Could not select database');

// Performing SQL query
$query = 'SELECT * FROM cdtn';
$result = mysql_query($query) or die('Query failed: ' . mysql_error());

// Printing results in HTML

printf("<B>--All the condition we can treat--</B><BR>");
printf("<table border=2 cellspacing=2 cellpadding=2>\n");
printf("<tr><th>Condition Type</th><th>Condition Name</th></tr>\n");
while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
    printf("<tr>\n");
    printf("<td>%s</td><td>%s</td>\n", $line["cdtntype"], $line["cdtnname"]);
    printf("</tr>\n");
}
printf("</table>\n");

printf("<p></p>\n");

echo "<a href='http://10.104.250.237/alldoctor.php' information.php'>Check all doctors' information</a> ";


//<input type='button' name='Check all doctors information' onclick="window.location='alldoctor.php'"/>;

printf("<p></p>\n");

echo "<a href='http://10.104.250.237/login.php' information.php'>For patients, please log in here</a><br><br>";

echo "<a href='http://10.104.250.237/logindoc.php' information.php'>For doctors, please log in here</a><br><br> ";


// Free resultset
mysql_free_result($result);

// Closing connection
mysql_close($link);
?>
