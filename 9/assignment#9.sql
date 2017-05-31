
/*Assignment #9*/

USE bookstore;

/*Query 1*/
/*Re-written Selectstatement*/
SELECT DISTINCT category_name
	FROM category c
	WHERE c.category_id IN( 
					SELECT DISTINCT p.category_id 
                    FROM product p)
	ORDER BY category_name;
    
/*Query 2*/
/*Returns the product_name and list_price columns for products
that have a list price greater than the average list price
for all products*/
SELECT product_name, list_price 
	FROM product p 
    WHERE p.list_price > 
				(SELECT AVG(pp.list_price)
					FROM product pp)
	ORDER BY list_price DESC;


/*Query 3*/
/*Displays category_name from category table.
Returns one row for each category that has never 
been assigned to any product in the Products
table.*/
SELECT category_name 
	FROM category c
    WHERE NOT EXISTS 
			(SELECT *
				FROM product p
				WHERE p.category_id IS NULL);
                    

/*Query 4*/
/*First statement displays email_address and 
and the largest order for that customer.
Second statement displays email address,
order_id and order total for each customer.
First uese second in FROM clause.*/

SELECT email_address,MAX(order_total) AS max_order_total
FROM 
	(SELECT c.email_address, o.order_id, SUM((oi.item_price - oi.discount_amount) * oi.quantity) AS order_total
		FROM customer c 
			JOIN orders o 
				ON c.customer_id = o.customer_id
			JOIN orderitems oi 
				ON o.order_id = oi.order_id
	GROUP BY email_address, oi.order_id) t
GROUP BY email_address;


/*Query 5*/
/*Display product name and discount percent of 
each product that has a unique discount percent.
*/
SELECT  p.product_name,p.discount_percent
	FROM product p
    WHERE p.discount_percent NOT IN
			(SELECT pp.discount_percent
				FROM product pp
                WHERE p.product_name <> pp.product_name) 
	ORDER BY product_name;
    
/*Query 6*/
/*Displays email address, order id and order date for each
customer with oldest order*/
SELECT c.email_address, order_id, order_date
	FROM customer c
		JOIN orders o
		ON o.order_date = 
				(SELECT MIN(order_date)
					FROM orders o
                    WHERE c.customer_id = o.customer_id);
/*Query 7*/
/*For each product whose items were sold in more than
one sales transaction, displays the product ID, 
product name, and list price.*/
SELECT product_id, product_name,list_price
	FROM product
    WHERE product_id IN
		(SELECT product_id
			FROM orderitems
            WHERE quantity > 1);
            
/*Query 8*/
/*Displays last and first name of customers who 
have purchased an item that costs more than $300.*/
SELECT last_name, first_name 
FROM customer c
WHERE EXISTS 
	(SELECT * 
		FROM orders o, orderitems oi 
        WHERE c.customer_id = o.customer_id
			AND o.order_id = oi.order_id 
			AND oi.item_price > 300);

/*Query 9*/
/*Displays the last name, first name, and email address 
of the customers who made the purchase with 
order IDs 1, 2, and 3.*/
SELECT last_name,first_name,email_address
FROM customer c
WHERE EXISTS(SELECT * 
				FROM orders o, orderitems oi 
				WHERE c.customer_id = o.customer_id 
					AND o.order_id = oi.order_id 
					AND oi.order_id BETWEEN 1 AND 3);
                    
                    
                    
/*10*/
/*Displays the last name, first name, and email address 
of customers who have purchased an item that was supplied
by a vendor with a Company Name that begins with the
letter H.*/
SELECT last_name, first_name, email_address
	FROM customer c
    WHERE EXISTS (SELECT *
					FROM orders o,orderitems oi,product p,vendor v
                    WHERE c.customer_id = o.customer_id
                    AND o.order_id = oi.order_id
                    AND oi.product_id = p.product_id
                    AND p.vendor_id = v.vendor_id
                    AND v.company_name LIKE 'H%');

/*11*/
/*Displays the product id, product name, and product price
for each product that has more than two items sold within 
all sales transactions*/
SELECT product_id,product_name,list_price
	FROM product
    WHERE product_id IN (SELECT product_id
							FROM orderitems
                            GROUP BY product_id
                            HAVING SUM(quantity) > 2);