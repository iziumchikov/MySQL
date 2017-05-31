/*Switch to bookdb*/
Use bookdb;



/* Displays tables in DataBase */
SHOW TABLES;

/*  Shows the column names and data types of a table.*/
DESC book;

/* Shows all info in the table */
SELECT * FROM book;

/* Inserts a new element to the database */
INSERT INTO BOOK VALUES
		('9247381001','HOW TO MANAGE THE MANAGER','09-05-03',1,31.95),
		('2147428890','SHORTEST POEMS','01-05-05',5,39.95);

/*Shows only ISBN, Title and Price info int the table*/
SELECT ISBN, Title, Price FROM book; 

/*Deletes any any info from database,
 if publisher id greater then 10*/
DELETE FROM book WHERE publisher_id > 10;

/* Shows all info in the table */
SELECT * FROM book;

