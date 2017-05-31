/* Assignment3 */

/*Query 1:*/
DROP DATABASE IF EXISTS artcourse;
CREATE DATABASE IF NOT EXISTS artcourse;
USE artcourse;

/*Query 2:*/
CREATE TABLE customer(
	customer_number INT(11) NOT NULL AUTO_INCREMENT,
    last_name CHAR(25) NOT NULL,
    first_name CHAR(25) NOT NULL,
    phone CHAR(12),
	PRIMARY KEY (customer_number)
	)ENGINE = INNODB;
    
CREATE TABLE course (
	course_number INT(11) NOT NULL AUTO_INCREMENT,
    course_name CHAR(50) NOT NULL,
    course_date DATETIME NOT NULL,
    fee DECIMAL(8,2),
    PRIMARY KEY (course_number)
    )ENGINE = INNODB;
    
CREATE TABLE enrolls (
	customer_number INT(11) NOT NULL,
	course_number INT(11) NOT NULL,
    amount_paid DECIMAL(8, 2) NOT NULL,
	FOREIGN KEY (customer_number) REFERENCES customer(customer_number),
	FOREIGN KEY (course_number) REFERENCES course(course_number) ON DELETE CASCADE
	)ENGINE = INNODB;


/*Query 3:*/
/* ****   customer DATA   ******************************************************/
INSERT INTO customer (last_name, first_name, Phone)
	VALUES('Johnson', 'Ariel','206-567-1234');
INSERT INTO customer (last_name, first_name, Phone)
	VALUES('Green', 'Robin', '425-678-8765');
INSERT INTO customer (last_name, first_name, Phone)
	VALUES('Jackson', 'Charles','306-789-3456');
INSERT INTO customer (last_name, first_name, Phone)
	VALUES('Pearson', 'Jeffery', '206-567-2345');
INSERT INTO customer (last_name, first_name, Phone)
	VALUES('Sears', 'Miguel','360-789-4567');
INSERT INTO customer (last_name, first_name, Phone)
	VALUES('Kyle', 'Leah', '425-678-7654');
INSERT INTO customer (last_name, first_name, Phone)
	VALUES('Myers', 'Lynda', '360-789-5678');

/* ****   COURSE DATA   **********************************************************/

INSERT INTO COURSE (Course_name, course_date, Fee)
	VALUES('Adv Pastels', '2015-10-01', 500.00);
INSERT INTO COURSE (Course_name, course_date, Fee)
	VALUES('Beg Oils', '2015-09-15', 350.00);
INSERT INTO COURSE (Course_name, course_date, Fee)
	VALUES('Int Pastels', '2015-03-15', 350.00);
INSERT INTO COURSE (Course_name, course_date, Fee)
	VALUES('Beg Oils', '2015-10-15', 350.00);
INSERT INTO COURSE (Course_name, course_date, Fee)
	VALUES('Adv Pastels', '2015-11-15', 500.00);

/* ****   ENROLLS DATA   ******************************************************/

INSERT INTO ENROLLS VALUES(1, 1, 250.00);
INSERT INTO ENROLLS VALUES(1, 3, 350.00);
INSERT INTO ENROLLS VALUES(2, 2, 350.00);
INSERT INTO ENROLLS VALUES(3, 1, 500.00);
INSERT INTO ENROLLS VALUES(4, 1, 500.00);
INSERT INTO ENROLLS VALUES(5, 2, 350.00);
INSERT INTO ENROLLS VALUES(6, 5, 250.00);
INSERT INTO ENROLLS VALUES(7, 4, 0.00);

/* *******************************************************************************/

/*Query 4:*/
SELECT * FROM customer;
SELECT * FROM course;
SELECT * FROM enrolls;

 
/*Query 5:*/
ALTER TABLE course 
	ADD date_added DATETIME;
    
/*Query 6:*/
ALTER TABLE customer 
	MODIFY COLUMN first_name CHAR(20) NOT NULL;
    
/*Query 7:*/
DESC customer;
DESC course;
DESC enrolls;


