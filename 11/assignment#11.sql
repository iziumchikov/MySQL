USE bookstore;

/*Query 1*/
/*Creates view customer_address and returns columns 
from customer and addresses tables.*/
CREATE OR REPLACE VIEW customer_address AS 
	SELECT c.customer_id, c.email_address, c.last_name, c.first_name,
			a.line1 AS bill_line1, a.line2 AS bill_line2, a.city AS bill_city,
            a.state AS bill_state, a.zip_code AS bill_zip, a.line1 AS ship_line1,
            a.line2 AS ship_line2, a.city AS ship_city, a.state AS ship_state,
            a.zip_code AS ship_zip
	FROM customer c, address a
    WHERE c.customer_id = a.customer_id;
    
/*Query 2*/
/*Returns given columns from customer_address view.*/
SELECT customer_id, last_name, first_name, bill_line1
	FROM customer_address;
    
/*Query 3*/
/*Updates customer table using customer_addresses view*/
UPDATE customer_address
	SET ship_line1 = '1990 Westwood Blvd'
    WHERE customer_id = '11119';
    
/*Query 4*/
/*Creates a view order_item_products that returns 
columns from the Orders, OrderItems, and Product 
tables.*/
CREATE OR REPLACE VIEW order_item_products AS
	SELECT o.order_id, o.order_date, o.tax_amount,o.ship_date,
		   oi.item_price, oi.discount_amount,
		   (oi.item_price - oi.discount_amount) AS final_price,
           oi.quantity,((oi.item_price - oi.discount_amount) * quantity) as item_total,
           p.product_name
		FROM orders o, orderitems oi, product p
        WHERE o.order_id = oi.order_id AND oi.product_id = p.product_id;
        
/*Query 5*/
/*Returns all info from order_item_products view*/
SELECT * 
	FROM order_item_products;
    
/*Query 6*/
/*Creates a view product_summary. Returns summary 
information about each product, counts total price
for each product.*/
CREATE OR REPLACE VIEW product_summary AS 
	SELECT DISTINCT p.product_id,oi.quantity AS order_count,
		   (oi.quantity * (oi.item_price - discount_amount)) AS order_total
	FROM product p, orderitems oi
    WHERE p.product_id = oi.product_id
    ORDER BY p.product_id;
    
/*Query 7*/
/*Returns total sales for the five best selling 
products from product_summary view.*/
SELECT order_total 
	FROM product_summary
    ORDER BY order_total DESC LIMIT 5;
    
/*Query 8*/
/*Creates a view named cheap_products_view whose 
subquery retrieves products with prices less than
$15.*/
CREATE OR REPLACE VIEW cheap_products_view AS 
	SELECT * 
		FROM product
        WHERE list_price < 15;
        
/*Query 9*/
/*Returns all info from cheap_product_view*/
SELECT * 
	FROM cheap_products_view;
    
/*Query 10*/
/*Creates a view named cheap_products_view2 whose 
subquery retrieves products with prices greater 
than $50 and adds CHECK OPTION constraint.*/
CREATE OR REPLACE VIEW cheap_products_view2 AS
	SELECT *
		FROM product
        WHERE list_price > 50 WITH CHECK OPTION;
/*INSERT statement that adds this row to the cheap_ products_view2*/
INSERT INTO cheap_products_view2
	(product_id, category_id,product_code,product_name,list_price, description, discount_percent, date_added,vendor_id) 
VALUES
	('17888','41','book db','Fundamental of database systems','45.99','Fundamental of database systems Elmasri','20.00','2015-06-01 11:12:59','2');
        
/*Query 11*/
/*Creates an index named i_customers_last_name on
the lastname column of the Customer table.*/
CREATE INDEX i_customer_last_name ON
	customer(last_name);

    
/*Query 12*/
/*Drops the index i_customers_last_name.*/
ALTER TABLE customer
	DROP INDEX i_customer_last_name;
	
        
    

           