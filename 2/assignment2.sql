/*Assignment 2*/
USE bookstore;

/*Query 1*/
CREATE TABLE IF NOT EXISTS COMPUTER(
  serial_number INT(7) NOT NULL,
  make VARCHAR(25) NOT NULL, 
  model CHAR(35),
  processor_type VARCHAR(25),
  memore CHAR(15),
  disk_size VARCHAR(15)
 ) ENGINE = INNODB;
 
 /*Query 2*/
 INSERT INTO COMPUTER VALUES(
9871234, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530',
'6.0 GBytes', '1.0 TBytes');
INSERT INTO COMPUTER VALUES(
9871245, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530',
'6.0 GBytes', '1.0 TBytes');
INSERT INTO COMPUTER VALUES(
9871256, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530',
'6.0 GBytes', '1.0 TBytes');
INSERT INTO COMPUTER VALUES(
9871267, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530',
'6.0 GBytes', '1.0 TBytes');
INSERT INTO COMPUTER VALUES(
9871278, 'HP', 'Pavilion 500-210qe','Intel i5-4530', 
'6.0 GBytes', '1.0 TBytes');

/*Query 3*/
ALTER TABLE COMPUTER
 ADD processor_speed DECIMAL(10, 2);
 
 /*Query 4*/
SELECT *
	FROM computer
	ORDER BY make DESC;

/*Query 5*/
DESCRIBE COMPUTER;

/*Query 6*/
SELECT serial_number, make, model
 FROM computer;
 
 /*Query 7*/
ALTER TABLE COMPUTER
 DROP COLUMN processor_speed;
 
 /*Query 8*/
SELECT *
 FROM computer;
 
 /*Query 9*/
RENAME TABLE COMPUTER 
 TO computer_backup;

/*Query 10*/
SHOW TABLES;

/*Query 11*/
DROP TABLE computer_backup;

/*Query 12*/
SHOW TABLES;