-- ctrl + enter to run the line your cursor is on

CREATE DATABASE Customer; -- creates a database named 'customer'
USE Customer; -- tells SQL what database it should work with
-- notice each line ends with a semi-colon
-- unlike python, white space like new lines, tabs, etc. do not define the structure

-- below, lines 10 through 15 act as a single line, with the ending denoted by the semi-colon

CREATE TABLE Customer_Table -- creates a table named 'customer_table'
( -- 
	FirstName varchar(50), -- creates a column named 'FirstName' that holds a string with at most 50 characters
    LastName varchar(50), -- creates a column named 'LastName'
    Age int -- creates a column named 'Age' that holds an integer value
); -- This makes code easier to read as you can align things as you need
-- ctrl + shift + enter to run highlighted code, if nothing is highlighted, this will run the whole script
-- Each line below adds a row of data to our customer_table
INSERT INTO customer_table (FirstName,LastName,Age) VALUES ('Jacob','Locke',23);
INSERT INTO customer_table (FirstName,LastName,Age) VALUES ('Thomas','Brown',24);
INSERT INTO customer_table (FirstName,LastName,Age) VALUES ('Jerry','Fry',55);
INSERT INTO customer_table (FirstName,LastName,Age) VALUES ('Griffen','Fry',23);
INSERT INTO customer_table (FirstName,LastName,Age) VALUES ('Kody','Maynard',30);
INSERT INTO customer_table (FirstName,LastName,Age) VALUES ('robot','test1',1);
INSERT INTO customer_table (FirstName,LastName,Age) VALUES ('robot','test2',1);
INSERT INTO customer_table (FirstName,LastName,Age) VALUES ('nothing','test3',1);
DELETE customer_table FROM customer_table WHERE LastName LIKE 'test_';

SELECT * FROM customer.customer_table; -- see how the table was modified
ALTER TABLE customer_Table ADD City varchar(50); -- adds a new column to our table called 'City'

SELECT * FROM customer_table; -- see that values are initialized to 'null'

UPDATE customer_table SET City='Atlanta'; -- sets the value to 'atlanta' for all rows
-- run the select line again to see the edits by selecting line 3 and pressing ctrl+enter\\

UPDATE customer_table SET City='Dallas' WHERE LastName = 'Fry'; -- update with a 'where' clause
DROP TABLE customer_table; -- deletes a table, not just the content, but the table itself

-- deletes a database and everything within it
DROP DATABASE customer;
-- If we try to insert multiple people with the same name, we won't be able to distinguish between the two
-- To get around this, we can set up a 'Primary Key', which gives each item a unique index

-- create our new database to work with
DROP DATABASE IF EXISTS participants; -- removes the database to remake it so the whole page can be run at once
CREATE DATABASE participants;
USE participants;

CREATE TABLE People 
(
ID int NOT NULL AUTO_INCREMENT, -- This tells our primary key how to operate, it will start at one, and increment by 1 for each item added
PRIMARY KEY (ID), -- Creates our primary key
FirstName varchar(50) NOT NULL,
LastName varchar(50),
Age int,
City varchar(50)
);

INSERT INTO People (FirstName,LastName,Age,City) VALUES ('Jacob','Locke',23,'Atlanta'); -- notice that we don't have to specify what the primary key needs to initialize to
INSERT INTO People (FirstName,LastName,Age,City) VALUES ('Thomas','Brown',24,'Atlanta');
INSERT INTO People (FirstName,LastName,Age,City) VALUES ('Jerry','Fry',55,'Dallas');
INSERT INTO People (FirstName,LastName,Age,City) VALUES ('Griffen','Fry',23,'Dallas');
INSERT INTO People (FirstName,LastName,Age,City) VALUES ('Kody','Maynard',30,'Atlanta');
INSERT INTO People (FirstName,LastName,Age,City) VALUES ('robot','test',1,'Atlanta');
INSERT INTO People (FirstName,LastName,Age,City) VALUES ('robot','test',1,'Atlanta');
INSERT INTO People (FirstName,LastName,Age,City) VALUES ('nothing','test',1,'Atlanta');

SELECT * FROM People; -- see what our table looks like
-- Lets create two more tables of items and orders, and give each primary keys.
-- This will set us up to see the 'relational' aspect of 'relational database'

drop tables if exists items, orders;
CREATE TABLE Items
(
ID int NOT NULL AUTO_INCREMENT,
ItemName varchar(50),
PRIMARY KEY (ID)
);

ALTER TABLE Items ADD Price float; -- variables can also be decimals

INSERT INTO Items (ItemName, Price) VALUES ('Baseball', 7.89);
INSERT INTO Items (ItemName, Price) VALUES ('Bat', 97.99);

CREATE TABLE Orders
(
OrderID int AUTO_INCREMENT,
PRIMARY KEY (OrderID),
OrderDate Datetime, -- another built in type, stores a date and time
PersonID int,
ItemID int
);

INSERT INTO Orders (OrderDate,PersonID,ItemID) 
VALUES (now(),2,2); -- now() returns the computers current date and time
INSERT INTO Orders (OrderDate,PersonID,ItemID) 
VALUES (now(),1,1);
INSERT INTO Orders (OrderDate,PersonID,ItemID) 
VALUES (now(),3,2);

SELECT * FROM Orders;
SELECT * FROM Items;
SELECT * FROM People;
-- Can we insert an order for a person's ID that doesn't exist?
INSERT INTO Orders (OrderDate,PersonID,ItemID) VALUES (now(),20,2);

-- We fix this with 'Foreing Keys'
-- A foreign key is a field that references a primary key in another table 

ALTER TABLE Orders ADD FOREIGN KEY (PersonID) REFERENCES People(ID);
-- This should return an error, lets clear out the invalid data point and try again

DELETE Orders FROM Orders WHERE PersonID > 8;
-- Now try line 5 again, and then see what happens when you run line 2

-- add another foreign key so we can only order item IDs that exist
ALTER TABLE orders ADD FOREIGN KEY (ItemID) REFERENCES People(ID);
-- Lets combine table data together to make use of the 'relational' aspect

-- similar to what we did in the data cleaning python lecture
SELECT * FROM orders INNER JOIN items ON Orders.itemID=items.id;

-- Alias our tables and select only specific rows to make it cleaner
SELECT o.OrderDate,i.ItemName,i.Price,p.* -- only select certain columns (* selects all)
FROM orders AS o -- alieasing our tables (temporary names)
INNER JOIN items AS i ON o.itemID=i.id
INNER JOIN people AS p ON o.personID=p.id;
-- from the second part of 10)
/*
SELECT o.OrderDate,i.ItemName,i.Price,p.* -- only select certain columns (* selects all)
FROM orders AS o -- alieasing our tables (temporary names)
INNER JOIN items AS i ON o.itemID=i.id
INNER JOIN people AS p ON o.personID=p.id;
*/

-- modify it to get just the sum of the price
select sum(i.Price) as Total -- remove all but i.Price and enclose in sum(), alias as Total
from Orders as o
inner join items as i on o.ItemID=i.ID
inner join people as p on o.PersonID=p.ID;


-- get sum spent on a person basis using group by
select p.ID,sum(i.Price) as Total  -- adds 'p.ID' to get person ID column information
from Orders as o
inner join items as i on o.ItemID=i.ID
inner join people as p on o.PersonID=p.ID
group by p.ID; -- Groups the sum on the person ID


-- Group by city to get regional income information
select p.City,sum(i.Price) as Total  -- adds 'p.City' to get city column information
from Orders as o
inner join items as i on o.ItemID=i.ID
inner join people as p on o.PersonID=p.ID
group by p.City; -- Groups the sum on the city