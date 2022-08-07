#By Shuowen Wei

# create a new database for the relation model of hospital reserving system
CREATE DATABASE HSP;


# use the HSP database


USE HSP;



# create the Condition entity relation

CREATE TABLE cdtn (cdtntype VARCHAR(20) PRIMARY KEY, cdtnname VARCHAR(200) NOT NULL) ENGINE=INNODB; 

# create the Consultingroom entity relation

CREATE TABLE consultingroom (croomnumber VARCHAR(200) PRIMARY KEY, cdtntype VARCHAR(20) NOT NULL, FOREIGN KEY (cdtntype) REFERENCES cdtn(cdtntype) ON DELETE RESTRICT ON UPDATE CASCADE) ENGINE=INNODB;

# create the Doctor entity relation

CREATE TABLE doctor (staffnumber VARCHAR(200) PRIMARY KEY, cdtntype VARCHAR(20) NOT NULL, firstname VARCHAR(200) NOT NULL, lastname VARCHAR(200) NOT NULL, sex VARCHAR(20) NOT NULL, FOREIGN KEY (cdtntype) REFERENCES cdtn(cdtntype) ON DELETE RESTRICT ON UPDATE CASCADE ) ENGINE=INNODB;



# create the Patient entity relation
CREATE TABLE patient (patientnumber VARCHAR(20) PRIMARY KEY, cdtntype VARCHAR(20), firstname VARCHAR(200) NOT NULL, lastname VARCHAR(200) NOT NULL, sex VARCHAR(20) NOT NULL, address VARCHAR(200), FOREIGN KEY (cdtntype) REFERENCES cdtn(cdtntype) ON DELETE RESTRICT ON UPDATE CASCADE) ENGINE=INNODB;



# create the Appointment relation

CREATE TABLE appointment (staffnumber VARCHAR(200), croomnumber VARCHAR(200), patientnumber VARCHAR(20),date DATE, time VARCHAR(200), PRIMARY KEY (staffnumber, croomnumber, patientnumber, date, time), FOREIGN KEY (staffnumber) REFERENCES doctor(staffnumber) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY (patientnumber) REFERENCES patient(patientnumber) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY (croomnumber) REFERENCES consultingroom(croomnumber) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY (patientnumber) REFERENCES patient(patientnumber) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=INNODB;
