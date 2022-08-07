# use the parking database

USE parking;



# delete the uses relation (needs to go first, as relies on staff, lot
) 
DROP TABLE uses;


# needs to go second, as relies on lot 

DROP TABLE spaces;



# clean up the rest
DROP TABLE lots;

DROP TABLE staff;



# get rid of the database itself (technically, this would have deleted all the tables too)

DROP DATABASE parking;
