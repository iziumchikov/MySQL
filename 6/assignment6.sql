USE bookstore;

/*Query 1:*/
/*SELECT statement that joins the Category table 
to the Product table and returns columns: 
category_name, product_name, list_price.Sorted by
category_name and then by product_name in 
ascending sequence.*/
SELECT category_name, product_name, list_price
	FROM product 
	JOIN category
		ON category_name = category_name
    ORDER BY category_name, product_name;

/*Query 2:*/
/*SELECT statement that joins the Customer table 
to the Address table and returns columns: 
first_name, last_name, line1, city, state, zip_code.
Returns one row for each address for the customer 
with an email address of allan.sherwood@yahoo.com.*/
SELECT DISTINCT first_name, last_name, line1, city, state, zip_code
	FROM customer 
    JOIN address
    WHERE email_address = "allan.sherwood@yahoo.com";

/*Query 3:*/
/*SELECT statement that joins the customer table 
to the Address table and returns columns: 
first_name, last_name, line1, city, state, zip_code.
Returns one row for each customer, but only returns 
addresses that are the shipping address for a customer.*/
SELECT DISTINCT first_name, last_name, line1, city, state, zip_code
	FROM customer 
    JOIN address
    WHERE address_id = shipping_address_id;

/*Query 4:*/
/*SELECT statement that joins the customer, orders, 
order_items, and product tables. This statement 
returns these columns: last_name, first_name, order_date,
product_name, item_price, and quantity.Sorted by
last_name and order_date.*/
SELECT c.last_name, c.first_name, o.order_date, p.product_name, oi.item_price, oi.quantity
	FROM customer c
    JOIN orders o 
		ON c.customer_id = o.customer_id
	JOIN orderitems oi 
		ON o.order_id = oi.order_id
	JOIN product p 
		ON oi.product_id = p.product_id
	ORDER BY last_name, order_date;

/*Query 5:*/
/*SELECT statement that returns the product_name 
and list_price columns from the Product table. 
Returns one row for each product that has the same 
list price as another product. Sorted by product_name.*/
SELECT p1.product_name, p1.list_price
	FROM product p1 
    JOIN product p2 
		ON p1.product_id != p2.product_id
        AND p1.list_price = p2.list_price
	ORDER BY product_name;

/*Query 6:*/
/*SELECT statement that returns product id, name of 
the product, name of the vendor of the product, and 
price of the product.*/
SELECT p1.product_id,p1.product_name,p1.vendor_id,p1.list_price
	FROM product p1 
    JOIN product p2
		ON p1.product_id = p2.product_id
        AND p1.product_name = p2.product_name
        AND p1.vendor_id = p2.vendor_id
        AND p1.list_price = p2.list_price;

/*Query 7:*/
/*SELECT statement that returns category_name, 
product_id if product_id is 0*/
SELECT category_name, product_id
	FROM category 
    LEFT JOIN product
		ON product_id IS NULL;

/*Query 8:*/
/*SELECT statement that returns order_id order_date,
product_name,quantity,item_price from orderitems, 
orders, product tables.*/
SELECT oi.order_id, o.order_date, p.product_name, oi.quantity, oi.item_price
	FROM orderitems oi 
    JOIN orders o
		ON oi.order_id = o.order_id
    JOIN product p
		ON oi.product_id = p.product_id
    ORDER BY order_id;

/*Query 9:*/
/*SELECT statement that returns order_id from 
orders table and custem name from custmer table
if not shipped yet*/
SELECT order_id,first_name,last_name
	FROM orders o 
    JOIN customer c
		ON o.ship_date IS NULL
        AND o.customer_id = c.customer_id
	ORDER BY order_date;

/*Extra Query 1:*/
/*SELECTY statement that returns product_name,
order_id and shipping_address_id.If a product 
has been ordered by a customer, also lists the 
corresponding order ID and the shipping 
address ID.*/
SELECT p.product_name,oi.order_id,o.ship_address_id
	FROM product p 
    LEFT JOIN orderitems oi
		ON p.product_id = oi.product_id
	LEFT JOIN orders o
		ON oi.order_id = o.order_id;

/*Extra Query 2:*/
/*SELECT statement returns last name and first 
name of customers who have purchased an item 
that costs more than $50.*/        
SELECT DISTINCT c.last_name, c.first_name
	FROM customer c 
    JOIN orders o
		ON c.customer_id = o.customer_id
	JOIN orderitems oi
		ON oi.item_price > 50;

/*Extra Query 3:*/
/*SELECT statement that returns lase name,
first name, order ID, order date,product ID,
and product name. Shows which customers bought 
which items, and includes any items which have 
not been sold*/
SELECT DISTINCT c.last_name,c.first_name,o.order_id,o.order_date,oi.product_id,p.product_name
	FROM customer c 
    JOIN orders o
		ON c.customer_id = o.customer_id
	JOIN orderitems oi
		ON o.order_id = oi.order_id
	JOIN product p
		ON oi.product_id = p.product_id
	ORDER BY product_id, order_id;
	