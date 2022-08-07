#By Shuowen Wei

# create a new database for the problem of interest
CREATE DATABASE DBH;



# use the DBH database


USE DBH;



# create the Hotel entity relation

CREATE TABLE hotel (hotelNumber INTEGER(1) PRIMARY KEY, hotelName VARCHAR(200) NOT NULL, city CHAR(200) NOT NULL) ENGINE=INNODB;
#CREATE TABLE hotel (hotelNumber VARCHAR(200) PRIMARY KEY, hotelName VARCHAR(200) NOT NULL, city CHAR(200) NOT NULL) ENGINE=INNODB;

# create the Room entity relation

CREATE TABLE room (roomNumber INTEGER(2), hotelNumber INTEGER(1), PRIMARY KEY (roomNumber, hotelNumber),type CHAR(1) NOT NULL, price DECIMAL(6,2) NOT NULL, FOREIGN KEY (hotelNumber) REFERENCES hotel(hotelNumber) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=INNODB;


#CREATE TABLE room (roomNumber VARCHAR(200), hotelNumber VARCHAR(200), type CHAR(20) NOT NULL, price VARCHAR(8) NOT NULL, PRIMARY KEY (roomNumber, hotelNumber), FOREIGN KEY (hotelNumber) REFERENCES hotel(hotelNumber) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=INNODB;




# create the Guest entity relation
CREATE TABLE guest (guestNumber INTEGER PRIMARY KEY, guestName VARCHAR(200) NOT NULL, guestAddress VARCHAR(200)) ENGINE=INNODB;


#CREATE TABLE guest (guestNumber VARCHAR(200) PRIMARY KEY, guestName VARCHAR(200) NOT NULL, guestAddress VARCHAR(200)) ENGINE=INNODB;



# create the Booking relation

CREATE TABLE booking (hotelNumber INTEGER(1), guestNumber INTEGER, dateFrom DATE, dateto DATE NOT NULL, roomNumber integer(2) NOT NULL, PRIMARY KEY (hotelNumber, guestNumber, dateFrom), FOREIGN KEY (hotelNumber) REFERENCES hotel(hotelNumber) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY (guestNumber) REFERENCES guest(guestNumber) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY (roomNumber) REFERENCES room(roomNumber) ON DELETE RESTRICT ON UPDATE CASCADE) ENGINE=INNODB;

#CREATE TABLE booking (hotelNumber VARCHAR(200), guestNumber VARCHAR(200), dateFrom DATE, dateto VARCHAR(200) NOT NULL, roomNumber VARCHAR(200) NOT NULL, PRIMARY KEY (hotelNumber, guestNumber, dateFrom), FOREIGN KEY (hotelNumber) REFERENCES hotel(hotelNumber) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY (guestNumber) REFERENCES guest(guestNumber) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY (roomNumber) REFERENCES room(roomNumber) ON DELETE RESTRICT ON UPDATE CASCADE) ENGINE=INNODB;


