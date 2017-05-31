
/*Assignment 5*/

/*Query 1*/
/*Displays the rows from the Customer table where 
the customer ID is between 22229 and 66669.*/
SELECT last_name, first_name, customer_id
	FROM customer
	WHERE customer_id BETWEEN 22229 AND 66669;
    
/*Query 2:*/
/*Displays all employees who DO NOT earn exactly 
$3,400, $3,000, or $6,000 and who have a
last name that begins with the letter 'S'.*/
SELECT employee_id, first_name, last_name
	FROM employee
	WHERE salary != 3400 
	  AND salary != 3000
	  AND salary != 6000
	  AND last_name LIKE 'S%';

/*Query 3:*/
/*Displays order id, order date, ship date 
from product table and returns only the rows 
where the ship_date column contains a null 
value.*/
SELECT order_id, order_date, ship_date
	FROM orders
    WHERE ship_date IS NULL ;

/*Query 4:*/
/*Displays all customers whose last name contains 
the letter pattern “IN.”*/
SELECT last_name, first_name
	FROM customer
    WHERE last_name LIKE '%IN%';

/*Query 5:*/
/*Displays product id, product name, product price 
from product table and returns only the rows 
with a list price greater than $30.00 and less 
than $900.00.*/
SELECT product_id, product_name, list_price
	FROM product
    WHERE list_price > 30.00 AND list_price < 900.00;

/*Query 6:*/
/*Displays order id, oder date, 
from order table and returns only the rows 
where oder date is March 2015.
Sorted in descending order by 
the order date column.*/
SELECT order_id, order_date
	FROM orders
    WHERE order_date LIKE '2015-03%'
    ORDER BY order_date DESC;
    
/*Query 7:*/
/*Displays order id, oder date, 
from order table and returns only the rows 
where the orders placed on or 
before April 1, 2015.*/
SELECT order_id, ship_date
	FROM orders
    WHERE ship_date > '2009-04-01%';

/*Query 8:*/
/*Displays order id, oder date, 
from order table and returns only the rows 
where shipping date after April 1, 2009.*/
SELECT order_id, ship_date
	FROM orders
    WHERE order_date <= '2015-04-01%';
    
/*Query 9:*/
/*Displays product id, product code, product 
name from product table based n the pattern 
where name contains “E” for the second letter 
and “L” for the fourth letter.Sorted by product
code in descending order.*/
SELECT product_id, product_code, product_name
	FROM product
    WHERE product_name LIKE '_E%_L%'
	ORDER BY product_code DESC;

/*Query 10:*/
/*Displays product id, category id, vendor id, 
list_price from product table where category id
is in range from 11 to 61 and provided by 
vendor 1 or vendor 2 and result does not include
any product selling for less than $1100.00*/
SELECT product_id, category_id, vendor_id, list_price
	FROM product
    WHERE category_id IN(11,61)
		AND vendor_id IN(1,2)
        AND list_price >= 1100;
    

