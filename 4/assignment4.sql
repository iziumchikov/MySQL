/*Assignment 4*/
USE bookstore;

/*Query 1*/
/*Displays the rows from the Customer table 
whose customer ID is not equal to 77779.*/
SELECT customer_id 
	FROM customer
    WHERE customer_id != 77779;

/*Query 2*/
/*Displays the product name and description 
columns from the Product table where the 
category ID column is greater than 21.*/
SELECT product_id, description
	FROM product
    WHERE category_id > 21;

/*Query 3*/
/*Display the rows from the Customer table 
where the values in the customer ID column 
is 11119.*/
SELECT last_name, first_name,
	customer_id,email_address
    FROM customer
    WHERE customer_id = 11119;
    
/*Query 4*/
/*Displays the rows from the orderitems
table and adds new rows.Sorts the result 
set by item total in descending order.*/
SELECT item_id,item_price,discount_amount,
	quantity,
	/*A column that’s calculated by multiplying the item price
	by the quantity*/
    item_price * quantity 
    AS price_total,
	/*A column that’s calculated by multiplying the discount
	amount by the quantity*/   
	discount_amount * quantity
    AS discount_total,
    /*A column that’s calculated by subtracting the discount
	amount from the item price and then multiplying by the
	quantity*/
    (item_price - discount_amount) * quantity
    AS item_total
    FROM orderitems
    /*Return rows where 
	the item_total is greater than 900*/
    WHERE (item_price - discount_amount) * quantity > 900
    ORDER BY item_total;

/*Query 5*/
/*Displays these columns from the Store table*/
SELECT store_id,region_id,region_name
	FROM store;

/*Query 6*/
/*Display the customer ID for each customer in 
the Customer table, along with the email address.*/
SELECT customer_id 
	FROM customer 
    WHERE email_address IS NOT NUll;

/*Query 7*/
/*Display the customer ID from the Orders table 
for each customer who has placed an order with the 
bookstore. Display each customer ID only once.*/
SELECT DISTINCT customer_id
	FROM orders;

/*Query 8*/
/*Displays the rows from product table.Sorts the 
result set by discount price in descending sequence.*/
SELECT product_name, list_price, discount_percent,
	/*A column that’s calculated from the previous two columns*/
	list_price * (discount_percent / 100)
    AS discount_amount,
    /*A column that’s calculated from the previous three columns*/
    list_price - (list_price * (discount_percent / 100))
    AS discount_price
    FROM product
    ORDER BY discount_price
    /*Sets to display only 5 first rows*/
    LIMIT 5;

/*Query 9*/
/*Displays the rows from the Address table.
The city and state be listed as one column 
of output*/
SELECT customer_id, line1, line2,
	CONCAT (city, ', ', state)
    AS 'City State',
	zip_code
    FROM address;

/*Query 10*/
/*Displays one column from the Customer table.
Consist from last and first names, separated 
by comma*/
SELECT CONCAT (last_name, ', ',first_name) 
	AS 'full_name'
	FROM customer;
	