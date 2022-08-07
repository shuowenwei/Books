USE HSP;




INSERT INTO cdtn VALUES('1','flu');

INSERT INTO cdtn VALUES('2','dermatopathya');

INSERT INTO cdtn VALUES('3','diabetes');

INSERT INTO cdtn VALUES('4','dentist');




INSERT INTO doctor VALUES('MD1001','1','David','Smith','Male');

INSERT INTO doctor VALUES('MD1002','2','Jack','Patt','Male');
INSERT INTO doctor VALUES('MD1003','3','Victor','Yu','Male');
INSERT INTO doctor VALUES('MD1004','4','Tom','Moore','Male');
INSERT INTO doctor VALUES('MD1005','1','Emily','Rich','Female');
INSERT INTO doctor VALUES('MD1006','2','Lara','Snow','Female');
INSERT INTO doctor VALUES('MD1007','3','Katy','King','Female');
INSERT INTO doctor VALUES('MD1008','4','Michell','White','Female');



INSERT INTO patient VALUES('p101','1','Ellen','Jones','Male','331 Cherry St, Winston salem, NC');

INSERT INTO patient VALUES('p102','1','Mark','Kirrty','Male','1330 University Parkway, Winston salem, NC');

INSERT INTO patient VALUES('p103','3','Manhan','Burn','Female','431 Polo Road, Winston salem, NC');

INSERT INTO patient VALUES('p104','4','Scott','Wood','Female','114 Rochell Circle, Winston salem, NC');


INSERT consultingroom VALUES('R101','1');

INSERT consultingroom VALUES('R102','1');

INSERT consultingroom VALUES('R201','2');

INSERT consultingroom VALUES('R202','2');

INSERT consultingroom VALUES('R203','3');
INSERT consultingroom VALUES('R204','3');

INSERT consultingroom VALUES('R301','4');
INSERT consultingroom VALUES('R302','4');



INSERT INTO appointment VALUES('MD1001','R101','p102','2012-04-10','13:00');

INSERT INTO appointment VALUES('MD1004','R301','p104','2012-04-12','15:00');

