# create a new database for the problem of interest


CREATE DATABASE parking;


# use the parking database


USE parking;



# create the staff entity relation

CREATE TABLE staff (staffNumber INTEGER(4) PRIMARY KEY, name VARCHAR(30) NOT NULL, telephone CHAR(10), tag CHAR(7)) ENGINE=INNODB;



# create the lots entity relation

CREATE TABLE lots (lotName VARCHAR(30) PRIMARY KEY, location VARCHAR(30) NOT NULL, capacity INTEGER(3) NOT NULL, numberOfFloors INTEGER NOT NULL) ENGINE=INNODB;



# create the spaces entity relation
CREATE TABLE spaces (space INTEGER(5) PRIMARY KEY, lotName VARCHAR(30), FOREIGN KEY (lotName) REFERENCES lots(lotName) ON DELETE RESTRICT ON UPDATE RESTRICT) ENGINE=INNODB;



# create the uses relation

CREATE TABLE uses (staffNumber INTEGER(4), space INTEGER(5), PRIMARY KEY (staffNumber, space), FOREIGN KEY (staffNumber) REFERENCES staff(staffNumber) ON DELETE RESTRICT ON UPDATE RESTRICT, FOREIGN KEY (space) REFERENCES spaces(space) ON DELETE RESTRICT ON UPDATE RESTRICT) ENGINE=INNODB;
