/*Assignment #10*/
USE bookstore;

/*Query 1*/
/*Returns list_price, formated list_price with one digit,
converted list_price as an integer, casted list_price as
an integer.*/
SELECT list_price, FORMAT(list_price,1) AS format_price, 
				   CONVERT(list_price, SIGNED) AS convert_price, 
                   CAST(list_price AS SIGNED) AS cast_price
	FROM product;
    
/*Query2*/
/*Returns date_added, casted date_added with its date only,
casted date_added with just year and the month, casted
date_added with full time only*/
SELECT date_added, 
	CAST(date_added AS DATE) as 'date',
	DATE_FORMAT(CAST(date_added as DATE), '%m/%y') AS 'month/year',
	CAST(date_added AS TIME) AS 'time'
	FROM product;
    
/*Query3*/
/*Returns lit_price, discount_percent, a column
discount_amount,that calculates discount_amount 
and ROUND function to round the result so it has
2 decimal digits.*/
SELECT list_price,discount_percent,
	ROUND((list_price * (discount_percent / 100)),2) AS discount_amount
	FROM product;
    
/*Query4*/
/*Returns order_date, formated date order_date that
returns the four-digit year stored in it. Formated
date order_date that returns abbreviated months and 
separate each date component with dashes.Formated
date order_date that retuns the hours and minutes 
on a 12-hour clock with an am/pm indicator.Formated
date order_date that returns date in format
MM/DD/YY HH:SS.*/
SELECT order_date,
	DATE_FORMAT(order_date, '%Y') AS 'year',
    DATE_FORMAT(order_date, '%b %d/%y') AS 'abbreviated',
    DATE_FORMAT(order_date,	'%l:%i %p') AS 'time',
    DATE_FORMAT(order_date, '%m/%d/%y %k:%i') AS 'MM/DD/YY HH:SS'
	FROM orders;
    
/*Query5*/
/*Returns card_number, length of the card_number, 
last for digits of card_number,conacted string 
that returns card_number in format: 
XXXX-XXXX-XXXX-1234 where last four digits are 
last actual numbers of card_number.*/
SELECT card_number, 
	   LENGTH(card_number) as 'length',
       RIGHT(card_number,LENGTH(card_number) - 12) AS last_four_digits,
       CONCAT('XXXX-XXXX-XXXX-',RIGHT(card_number,LENGTH(card_number) - 12)) AS 'X_four_digits'
	FROM orders;
    
/*Query6*/
/*Retuns order_id, order_date, approx_ship_date
that retuns days with added 2 days,ship_date,
days_to_ship that shows the number of days 
between the order date and the ship date.
Displays all orders start from May 2015.*/
SELECT order_id, order_date,
	   ADDDATE(order_date, INTERVAL 2 DAY) AS approx_ship_date,
	   ship_date,
       DATEDIFF(ship_date, order_date) as 'days_to_ship',
	   TO_DAYS(ship_date) - TO_DAYS(order_date) as 'days_to_ship'
	FROM orders
    WHERE order_date >= '2015-05-01';
