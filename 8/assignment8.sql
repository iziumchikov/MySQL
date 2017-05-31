/*Assignment 8*/
USE bookstore;

/*Query 1*/
/*Returns the count of the number of Orders in the Orders table
and the sum of the tax_amount columns in the Orders table.*/
SELECT COUNT(order_id) AS number_of_orders,
	   SUM(tax_amount) AS tax_amount
	FROM orders;
    
/*Query 2*/
/*Retrns the product_id and the number of orders placed 
for each product. Sorted in decreasing order.*/
SELECT p.product_id, COUNT(oi.quantity) AS NumOrders
	FROM product p, orderitems oi
    WHERE p.product_id = oi.product_id
    GROUP BY product_id
    ORDER BY NumOrders DESC;

/*Query 3*/
/*Returns category name, count of the products in the 
product table for current category and list price of 
the most expensive product in product table for 
current category. Sorted in order list price.*/
SELECT c.category_name, COUNT(p.product_id) AS NumProducts, MAX(p.list_price)
	FROM category c
		JOIN product p
			ON c.category_id = p.category_id
    GROUP BY category_name
    ORDER BY list_price DESC;
    
/*Query 4*/
/*Returns email address, the sum of the item price in the 
Order Items table multiplied by the quantity, sum of the discount 
amount column in the Order items table multiplied by the quantity.
Sorted in descending sequence by the item price total for each customer.*/
    SELECT c.email_address,SUM(oi.discount_amount * oi.quantity) AS Total_Discount,
						   SUM(oi.item_price * oi.quantity) AS Total_Price
	FROM customer c 
		JOIN orders o 
			ON c.customer_id = o.customer_id
		JOIN orderitems oi
			ON o.order_id = oi.order_id
    GROUP BY email_address
    ORDER BY Total DESC;
    
/*Query 5*/
/*Returns one row for each customer that has orders with:
email address, count of the number of orders, the total 
amount for each order.Returns only those rows where the 
customer has more than 1 order.*/
SELECT c.email_address,COUNT(o.order_id) AS Num_Orders,
					   SUM((oi.item_price - oi.discount_amount) * quantity) AS Total_Amount
	FROM customer c, orderitems oi, orders o
    WHERE c.customer_id = o.customer_id AND o.order_id = oi.order_id
    GROUP BY email_address
    HAVING COUNT(o.order_id) > 1
    ORDER BY total_amount DESC;
    
/*Query 6*/
/*Modified the solution to query 5 so it only counts and 
totals line items that have an item price value that's 
greater then 400.*/
SELECT c.email_address,COUNT(o.order_id) AS Num_Orders,
					   SUM((oi.item_price - oi.discount_amount) * quantity) AS total_amount
	FROM customer c 
		JOIN orders o 
			ON c.customer_id = o.customer_id 
		JOIN orderitems oi
			ON o.order_id = oi.order_id 
		AND oi.item_price > 400
	GROUP BY email_address
    ORDER BY total_amount DESC;
    
/*Query 7!!!!*/
/*Returns email address and the count of distinct
products for custumers who have more then one product*/
SELECT email_address,COUNT(DISTINCT product_id) AS Num_Orders
	FROM customer c 
		JOIN orders o
			ON c.customer_id = o.customer_id 
		JOIN orderitems oi
			ON o.order_id = oi.order_id
    GROUP BY email_address
    HAVING Num_Orders > 1;
    
/*Query 8*/
/*Returns the number of products, average product price, 
lowest product price, and highest product price in the 
book product category.*/
SELECT COUNT(product_id) AS Num_Products,
	   AVG(list_price) AS average_price,
       MIN(list_price) AS min_price,
       MAX(list_price) AS max_price
	FROM product
    WHERE category_id = 41;
    
/*Query 9*/
/*For each vendor, returns the vendor ID and the number 
of products with a product price of $100 or higher supplied 
by the vendor.*/
    SELECT vendor_id, COUNT(product_id) AS Num_Products
		FROM product
		WHERE list_price >= 100
		GROUP BY vendor_id;
    
/*Query 10*/
/*Displays groups of products where each group contains 
the products that are from the same category and supplied 
by the same vendor. For each group returns that has more 
than one product, retrieve the vendor ID, product category ID, 
number of products in the group, and average price of the 
products in the group.*/
SELECT vendor_id, category_id, COUNT(product_id) AS Num_Products, 
		AVG(list_price) AS average_price
	FROM product
	GROUP BY vendor_id, category_id
	HAVING Num_Products > 1;

    
