USE DBH;

INSERT INTO hotel VALUES(1,'Winston Hotel','Winston-Salem');
INSERT INTO hotel VALUES(2,'Capital Hotel','Raleigh');
INSERT INTO hotel VALUES(3,'Tryon Tower','Charlotte');
INSERT INTO hotel VALUES(4,'Twin City Tower','Winston-Salem');

INSERT INTO room VALUES(1,1,'D',80.00);
INSERT INTO room VALUES(2,1,'D',80.00);
INSERT INTO room VALUES(3,1,'Q',100.00);
INSERT INTO room VALUES(4,1,'K',120.00);

INSERT INTO room VALUES(1,2,'D',85.00);
INSERT INTO room VALUES(2,2,'Q',90.00);
INSERT INTO room VALUES(3,2,'Q',90.00);
INSERT INTO room VALUES(4,2,'K',150.00);

INSERT INTO room VALUES(1,3,'D',75.00);
INSERT INTO room VALUES(2,3,'D',75.00);
INSERT INTO room VALUES(3,3,'K',100.00);
INSERT INTO room VALUES(4,3,'K',120.00);
INSERT INTO room VALUES(5,3,'K',140.00);

INSERT INTO room VALUES(1,4,'D',90.00);
INSERT INTO room VALUES(2,4,'Q',90.00);
INSERT INTO room VALUES(3,4,'K',150.00);

INSERT INTO guest VALUES(1,'William Turkett', 'Manchester 240');
INSERT INTO guest(guestNumber,guestName) VALUES(2,'David John');
INSERT INTO guest VALUES(3,'Errin Fulp', 'Manchester 239');
INSERT INTO guest VALUES(4,'Pete Santago', 'Manchester 236');
INSERT INTO guest VALUES(5,'Paul Whitener', 'Manchester 230');

INSERT INTO booking VALUES(1,1,'2012-02-15','2012-02-18',2);
INSERT INTO booking VALUES(1,5,'2012-03-12','2012-03-15',2);
INSERT INTO booking VALUES(3,3,'2012-02-22','2012-02-25',2);
INSERT INTO booking VALUES(3,2,'2012-02-20','2012-02-23',1);
INSERT INTO booking VALUES(4,1,'2012-02-20','2012-02-22',3);
INSERT INTO booking VALUES(4,2,'2012-04-15','2012-04-15',1);
INSERT INTO booking VALUES(4,5,'2012-05-24','2012-05-30',3);