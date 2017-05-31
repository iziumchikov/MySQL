-- Insert data into the tables

/* insert sample data into category table */
USE bookstore;
INSERT INTO category (category_id, category_name) VALUES
(11, 'Computer'),
(21, 'CD'), 
(31, 'DVD'),
(41, 'Book'),
(51, 'Video'),
(61, 'printer');

/* insert sample data into vendor table */

INSERT INTO vendor(company_name, contact_lname, contact_fname, address, city, state, zip, phone, fax, email)
  VALUES('All Merchandises', 'Huntington', 'Anne', '1515 NW Market Street',	'Seattle', 'WA', '98107', '206-325-6755', '206-329-9675', 'LAT@business.com');
INSERT INTO vendor(company_name, contact_lname, contact_fname, address, city, state, zip, phone, fax,email)
  VALUES('Computer Group', 'Tadema', 'Ken', '6123 15th Avenue NW','Seattle', 'WA', '98107', '206-325-7866', '206-329-9786', 'ES@business.com');
INSERT INTO vendor(company_name, contact_lname,  contact_fname, address, city, state, zip, phone, fax,email)
  VALUES('Foundation of America', 'Swanson', 'Sally', '506 Prospect Street', 'Seattle', 'WA', '98109', '206-325-8977', '206-329-9897', 'Foundation@business.com');
INSERT INTO vendor(company_name, contact_lname, contact_fname , address, city, state, zip, phone, fax,email)
	VALUES('book Group','Lee', 'Andrew', '1102 3rd Street','Kirkland', 'WA', '98033', '425-746-5433', '425-745-5433','Andrew.Lee@somewhere.com');
INSERT INTO vendor(company_name, contact_lname, contact_fname, address, city, state, zip, phone, fax,email)
	VALUES('HP Products', 'Harrison', 'Denise', '533 10th Avenue',	'Kirkland', 'WA', '98033', '425-746-4322', '425-746-4422','Denise.Harrison@somewhere.com');
INSERT INTO vendor(company_name, contact_lname, contact_fname , address, city, state, zip, phone, fax,email)
  VALUES('New York Brokerage', 'Smith', 'Mark', '621 Roy Street','Seattle', 'WA', '98109', '206-325-9088', '206-329-9908', 'NYB@business.com');
INSERT INTO vendor(company_name, contact_lname, contact_fname, address, city, state, zip, phone, fax,email)
	VALUES('Walsh Store', 'Walsh', 'Denesha', '6712 24th Avenue NE','Redmond', 'WA', '98053', '425-635-7566', '425-635-7555','Denesha.Walsh@somewhere.com');
INSERT INTO vendor(company_name, contact_lname, contact_fname, address, city, state, zip, phone, fax,email)
	VALUES('Chris Company', 'Bancroft', 'Chris', '12605 NE 6th Street','Bellevue', 'WA', '98005', '425-635-9788', '425-639-9978', 'Chris.Bancroft@somewhere.com');
INSERT INTO vendor(company_name, contact_lname, contact_fname, address, city, state, zip, phone, fax,email)
  VALUES('Harely Benton', 'Nelson', 'Fred', '2512 Lucky Street',
	'San Francisco', 'CA', '94110', '415-422-2121', '415-429-9212', 'SA@business.com');
INSERT INTO vendor(company_name, contact_lname, contact_fname, address, city, state, zip, phone, fax,email)
  VALUES('Eastman Corporation', 'Garner', 'Patty', '2515 Lucky Street','San Francisco', 'CA', '94110', '415-422-3232', '415-429-9323', 'GA@business.com');

/* insert sample data into Product table */
INSERT INTO product (product_id, category_id, product_code, product_name, description, list_price, discount_percent, date_added, Vendor_id) VALUES
(1234, 11, 'comp1230', 'Dell XPS 8700 ', 'Dell XPS 8700 Desktop , Intel Core i7, 4GB Graphics', 999.00, 20.00, '2014-10-30 09:32:40',2),
(2234, 11, 'comp3450', 'Lenovo H50 Desktop ', 'Lenovo H50 Desktop , Intel Core i7, 2GB Graphics', 1199.00, 30.00, '2014-12-05 16:33:13', 2),
(3234, 11, 'comp1760', 'HP Envy 750qe Desktop', 'HP Envy 750qe Desktop , Intel Core i7, 4GB Graphics, Windows 10.', 2517.00, 52.00, '2015-02-04 11:04:31',2),
(4234, 11, 'lap3450', 'Toshiba Satellite S55T', 'Toshiba Satellite S55T Touchscreen Laptop , Intel Core i7 , 4GB Graphics | 4K Ultra HD.', 989.99, 20.00, '2015-06-01 11:12:59', 2),
(5234, 11, 'lap3423', 'HP Pavilion 15t Star', 'HP Pavilion 15t Star Wars Special Edition Touchscreen Laptop, Intel Core i7, 1080p, 2GB Graphics, Backlit Keyboard , Windows 10', 1299.00, 0.00, '2015-07-30 13:58:35',3),
(6234, 11, 'lap9000', 'Dell Inspiron 17 5000', 'Dell Inspiron 17 5000 Series Touchscreen Laptop, Intel Core i7, 4GB Graphics, 1080p', 1415.00, 39.00, '2015-07-30 14:12:41', 2),
(7234, 21, 'CD3467', 'Classical Music', 'The best classical music', 99.99, 30.00, '2015-06-01 11:29:35', 3),
(8234, 21, 'CD7689', 'Pop 3', 'The best popular music', 49.99, 25.00, '2015-07-30 14:18:33',5),
(13234, 31, 'DVD12356', 'Space Force 9', 'Adventures of heroes', 13.95, 20.00, '2012-10-30 10:32:50',9),
(14234, 31, 'DVD6789', 'From Another Planet', 'Alien from another planet lands on Earth', 49.99, 20.00, '2012-10-30 10:34:30',9),
(15234, 31, 'DVD8779', 'Supernova', 'A star explodes', 25.99, 15.00, '2011-10-30 10:32:40',5),
(11234, 41, 'book9907', 'Modern Science', 'A description of modern science', 19.95, 20.00, '2014-10-30 09:32:40',5),
(12234, 41, 'book6789','Chemistry', 'Introduction to Chemistry', 30.00, 20.00, '2013-10-30 09:32:40',5),
(9234, 51, 'video1234', '2412: The Return', 'Aliens return', 14.99, 30.00, '2015-07-30 12:46:40',5),
(10234, 51, 'video4567', 'Z Files', 'Series on mysterious activities', 49.99, 15.00, '2015-07-30 13:14:15',3),
(18234, 61, 'print7687', 'HP LaserJet Pro', 'HP LaserJet Pro M277dw Multifunction Color Printer', 200.99, 20.00, '2011-10-30 10:34:30',5),
(19234, 61, 'print4356', 'HP LaserJet Pro', 'HP LaserJet Pro M225dw Black and White Multifunction Printer', 500.99, 15.00, '2012-10-30 10:32:40',5),
(16234, 61, 'print2345', 'HP Color LaserJet', 'HP Color LaserJet Enterprise M553n Printer', 599.00, 20.00, '2015-10-30 09:35:20',5);

/* insert sample data into Customer table */
INSERT INTO customer (customer_id,email_address, password, first_name, last_name, shipping_address_id, billing_address_id) VALUES
(11119, 'allan.sherwood@yahoo.com', '650215acec746f0e32bdfff387439eefc1358737', 'Allan', 'Sherwood', 1, 2),
(22229, 'barryz@gmail.com', '3f563468d42a448cb1e56924529f6e7bbe529cc7', 'Barry', 'Zimmer', 3, 3),
(33339, 'christineb@solarone.com', 'ed19f5c0833094026a2f1e9e6f08a35d26037066', 'Christine', 'Brown', 4, 4),
(44449, 'david.goldstein@hotmail.com', 'b444ac06613fc8d63795be9ad0beaf55011936ac', 'David', 'Goldstein', 5, 6),
(55559, 'erinv@gmail.com', '109f4b3c50d7b0df729d299bc6f8e9ef9066971f', 'Erin', 'Valentino', 7, 7),
(66669, 'frankwilson@sbcglobal.net', '3ebfa301dc59196f18593c45e519287a23297589', 'Frank Lee', 'Wilson', 8, 8),
(77779, 'gary_hernandez@yahoo.com', '1ff2b3704aede04eecb51e50ca698efd50a1379b', 'Gary', 'Hernandez', 9, 10),
(88889, 'heatheresway@mac.com', '911ddc3b8f9a13b5499b6bc4638a2b4f3f68bf23', 'Heather', 'Esway', 11, 12);

/* insert sample data into address table */
INSERT INTO address (address_id, customer_id, line1, line2, city, state, zip_code, phone, disabled) VALUES
(1, 11119, '100 East Ridgewood Ave.', '', 'Paramus', 'NJ', '07652', '201-653-4472', 0),
(2, 11119, '21 Rosewood Rd.', '', 'Woodcliff Lake', 'NJ', '07677', '201-653-4472', 0),
(3, 22229, '16285 Wendell St.', '', 'Omaha', 'NE', '68135', '402-896-2576', 0),
(4, 33339, '19270 NW Cornell Rd.', '', 'Beaverton', 'OR', '97006', '503-654-1291', 0),
(5, 44449, '186 Vermont St.', 'Apt. 2', 'San Francisco', 'CA', '94110', '415-292-6651', 0),
(6, 44449, '1374 46th Ave.', '', 'San Francisco', 'CA', '94129', '415-292-6651', 0),
(7, 55559, '6982 Palm Ave.', '', 'Fresno', 'CA', '93711', '559-431-2398', 0),
(8, 66669, '23 Mountain View St.', '', 'Denver', 'CO', '80208', '303-912-3852', 0),
(9, 77779, '7361 N. 41st St.', 'Apt. B', 'New York', 'NY', '10012', '212-335-2093', 0),
(10, 77779, '3829 Broadway Ave.', 'Suite 2', 'New York', 'NY', '10012', '212-239-1208', 0),
(11, 88889, '2381 Buena Vista St.', '', 'Los Angeles', 'CA', '90023', '213-772-5033', 0),
(12, 88889, '291 W. Hollywood Blvd.', '', 'Los Angeles', 'CA', '90024', '213-391-2938', 0);

/* insert sample data into Store table */
INSERT INTO store (store_id, store_zip, region_id, region_name) VALUES ('S1','60600','C', 'Chicagoland');
INSERT INTO store VALUES ('S2','35400','T', 'Tristate');
INSERT INTO Store VALUES ('S3','60640','C', 'Chicagoland');
INSERT INTO Store VALUES ('S4','46307','T', 'Tristate');
INSERT INTO Store VALUES ('S5','47374','I', 'Indiana');
INSERT INTO Store VALUES ('S6','47401','I', 'Indiana');
INSERT INTO Store VALUES ('S7','55401','N', 'North');

/* insert sample data into Employee table */
INSERT INTO employee(employee_id, store_id, last_name, first_name, phone,email, salary, mgr)
  VALUES(78397, 'S1','Stuart', 'Anne', '206-527-0010', 'Anne.Stuart@PBS.com', 6000, NULL);
INSERT INTO employee(employee_id, store_id, last_name, first_name, phone,email, salary, mgr)
  VALUES(88887,'S2','Stuart', 'George', '206-527-0011', 'George.Stuart@PBS.com', 3000, 78397);
INSERT INTO employee(employee_id, store_id, last_name, first_name, phone,email, salary, mgr)
  VALUES(73447, 'S3', 'Stuart', 'Mary', '206-527-0012', 'Mary.Stuart@PSB.com', 2800, 78397);
INSERT INTO employee(employee_id, store_id, last_name, first_name, phone,email, salary, mgr)
  VALUES(73557, 'S3', 'Orange', 'William', '206-527-0013', 'William.Orange@PBS.com', 3400, 78397);
INSERT INTO employee(employee_id, store_id, last_name, first_name, phone,email, salary, mgr)
 VALUES(88447,'S4', 'Griffith', 'John', '206-527-0014', 'John.Griffith@PBS.com', 4500, 88887);
  INSERT INTO employee(employee_id, store_id, last_name, first_name, phone,email, salary, mgr)
 VALUES(66447,'S5', 'Alexander', 'John', '206-527-0014', 'John.Alexander@PBS.com', 2500, 88887);
  INSERT INTO employee(employee_id, store_id, last_name, first_name, phone,email, salary, mgr)
  VALUES(99887,'S6','Victor', 'George', '206-527-0011', 'George.victor@PBS.com', 3000, 78397);
INSERT INTO employee(employee_id, store_id, last_name, first_name, phone,email, salary, mgr)
  VALUES(55447, 'S7', 'Lee', 'Marwan', '206-527-0012', 'Marwan.Lee@PSB.com', 2800, 78397);
 

/* insert sample data into Orders table */
INSERT INTO orders (order_id, customer_id, employee_id, store_id, order_date, ship_amount, tax_amount, ship_date, ship_address_id, card_type, card_number, card_expires, billing_address_id) VALUES
(1, 11119, 78397,'S1', '2015-03-28 09:40:28', '5.00', '32.32', '2015-03-30 15:32,:51', 1, 'Visa', '4111111111111111', '04/2020', 2),
(2, 22229, 78397,'S2', '2015-03-28 11:23:20', '5.00', '0.00', '2015-03-29 12:52:14', 3, 'Visa', '4012888888881881', '08/2019', 3),
(3, 11119, 73447,'S3', '2015-03-29 09:44:58', '10.00', '89.92', '2015-03-31 9:11:41', 1, 'Visa', '4111111111111111', '04/2017', 2),
(4, 33339, 88887,'S2', '2015-03-30 15:22:31', '5.00', '0.00', '2015-04-03 16:32:21', 4, 'American Express', '378282246310005', '04/2016', 4),
(5, 44449, 88887,'S3', '2015-03-31 05:43:11', '5.00', '0.00', NULL, 5, 'Visa', '4111111111111333', '03/2019', 6),
(6, 55559, 73447,'S3', '2015-03-31 18:37:22', '5.00', '0.00', NULL, 7, 'Discover', '6011111111111117', '04/2019', 7),
(7, 66669, 73557,'S3',  '2015-04-01 23:11:12', '15.00', '0.00', '2015-04-03 10:21:35', 8, 'MasterCard', '5555555555554444', '04/2019', 8),
(8, 77779, 88887,'S2','2015-04-02 11:26:38', '5.00', '0.00', NULL, 9, 'Visa', '4012888888881991', '04/2019', 10),
(9, 44449, 88447,'S4','2015-04-03 12:22:31', '5.00', '0.00', NULL, 5, 'Visa', '4111111111111333', '03/2019', 6),
(10,22229, 88447,'S4','2015-05-03 12:22:31', '5.00', '0.00', NULL, 3, 'Visa', '4012888888881881', '08/2019', 3),
(11,22229, 66447,'S5','2015-06-03 12:22:31', '5.00', '0.00', NULL, 3, 'Visa', '4012888888881881', '08/2019', 3);

/* insert sample data into OrderItems table */
INSERT INTO orderitems (item_id,order_id, product_id, item_price, discount_amount, quantity) VALUES
(1, 1, 2234, 1199.00, 359.70, 1),
(2, 1, 10234, 49.99, 7.49, 2),
(3, 2, 4234, 989.99, 197.80, 1),
(4, 3, 3234, 2517.00, 1308.84, 1),
(5, 3, 1234, 999.00, 199.87, 1),
(6, 3, 5234, 1299.00, 0.00, 1),
(7, 4, 2234, 1199.00, 359.70,2),
(8, 4, 13234, 13.95, 2.79, 1),
(9, 5, 5234, 1299.00, 0.00, 1),
(10, 6, 5234, 1299.00, 0.00, 1),
(11, 7, 1234, 999.00, 199.87, 1),
(12, 7, 7234, 99.99, 29.97, 1),
(13, 7, 9234, 14.99, 4.20, 1),
(14, 8, 10234, 49.99, 7.49, 1),
(15, 9, 1234, 999.00, 199.87, 1),
(16, 9, 14234, 49.99, 9.99, 1),
(17, 10, 15234, 25.99, 3.89, 1),
(18, 10, 16234, 120.00, 24.00, 1),
(20, 2, 11234, 19.95, 3.99, 1),
(21, 2, 6234, 1415.00, 551.46, 1),
(22, 11, 18234, 200.99, 40.00, 1),
(23, 7, 19234, 500.99, 75.18, 1);

/* insert sample data into administrators table */
INSERT INTO administrators (admin_id, email_address, password, first_name, last_name) VALUES
(1, 'admin@Pioneerbookstore.com', '6a718fbd768c2378b511f8249b54897f940e9022', 'Admin', 'User'),
(2, 'joel@Pioneerbookstore.com', '971e95957d3b74d70d79c20c94e9cd91b85f7aae', 'Joel', 'Smith'),
(3, 'mike@Pioneerbookstore.com', '3f2975c819cefc686282456aeae3a137bf896ee8', 'Mike', 'Johnson');


