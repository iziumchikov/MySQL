
/*Assignment #7*/

/*Query 1*/
/*Adds new row to the category table*/

/*ON DUPLICATE key update just because i tested 
a lot and decided to keep it for case.*/
INSERT INTO category
	VALUE ('71', 'Video Game')
    ON DUPLICATE key update
    category_id = 71;
    
/*Query 2*/
/*Modifys previous Query. This statement change the
categoty_name column to “Camera”, and use the 
category_id column to identify the row.*/
UPDATE category
	SET category_name = 'Camera'
    WHERE category_id = 71;
    
/*Query 3*/
/*Adds new row to the Product table*/
INSERT INTO product
	VALUE ('17234', '71', 'Camera640', 'Canon', 'Canon EOS Rebel T5 DSLR Camera',
		   755.99, 0, '2015-04-30 13:14:15',2)
	ON DUPLICATE key update
    category_id = 71;

/*Query 4*/
/*Modifys previous Query.This statement change the 
discount_percent column from 0% to 30%.*/       
UPDATE product
	SET discount_percent = 30
    WHERE category_id = 71;
    
/*Query 5*/
/*Deletes the row that have been added to 
the category table in query 1. Before delete
Query1 row, deletes all products of this category
from Product table.*/
DELETE FROM product
	WHERE category_id = 71;
DELETE FROM category 
	WHERE category_id = 71;
    
/*Query 6*/
/*Changes card type for order #9
to American Express*/
UPDATE orders 
	SET card_type = 'American Express'
    WHERE order_id = 9;
    
/*Query 7*/
/*Delets order_id from Orders table. Before
delets all ordered items from Orderitems 
table.*/
DELETE FROM orderitems
	WHERE order_id = 5;
DELETE FROM orders
	WHERE order_id = 5;
    
/*Query 8*/
/*Modifys salary of employee, who's 
salary 6000 and change it to 6500.*/
UPDATE employee
	SET salary = 6500
    WHERE salary = 6000;
    
/*Query 9*/
/*Adds this row to the Customer table*/
INSERT INTO customer 
	VALUE (99999, 'rick@raven.com', '', 'Rick', 'Raven', 13, 14)
    ON DUPLICATE key update
    email_address = 'rick@raven.com';

/*Query 10*/
/*Statement modifies the Customer table. It change 
the password column to “secret” for the customer 
with an email address of rick@raven.com.*/
UPDATE customer 
	SET password = 'secret'
    WHERE email_address = 'rick@raven.com';
    
/*Query 11*/
/*Statement that modifies the Customer table. It change 
the password column to “reset” for every customer
in the table.*/
UPDATE customer
	SET password = 'reset';
    
/*Query 12*/
/*Creates a Union between SHIPPED and NOT SHIPPED
items and prints shiping status, order id and order date
in order by order date.*/
	SELECT 'SHIPPED' AS ship_status, order_id, order_date
		FROM orders
		WHERE ship_date IS NOT NULL
UNION
	SELECT 'NOT SHIPPED' AS ship_status,order_id,order_date
		FROM orders
		WHERE ship_date IS NULL
ORDER BY order_date;