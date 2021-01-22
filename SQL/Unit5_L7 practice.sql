-- 1.	Create a table with the following parameters: 
--		CustomerID, CustomerName, Address, City, PostalCode, Country, Email

CREATE TABLE newtable (
	CustomerID SERIAL PRIMARY KEY,
	CustomerName VARCHAR(255) NOT NULL,
	Address VARCHAR(255),
	City VARCHAR(100),
	PostalCode VARCHAR(30),
	Country VARCHAR(100),
	Email VARCHAR(255) NOT NULL);
	
SELECT * FROM newtable;

-- 2.	Insert 3 rows of data into these columns using INSERT.  
--		The data you insert should make sense for the column.

INSERT INTO newtable (CustomerName, Address, City, PostalCode, Country, Email)
VALUES
	('James Taylor', '34 Smart St', 'North Hampton', '34487', 'USA', 'jtayor@james.com'),
	('Ginny Steak', '301 4th St', 'New York', '10045', 'USA', 'ginny@aol.com'),
	('Fahad Davis', '456 Intervale Ave', 'Bronx', '10456', 'USA', 'fa.da@yahoo.com')

SELECT * FROM newtable;

-- 3.	Use an UPDATE to modify any portion of the data

UPDATE newtable
SET address='76 1st Ave', postalcode='10001'
WHERE customername='Ginny Steak';

SELECT * FROM newtable;

-- 4.	Finally, write a statement to delete one row of data.

DELETE FROM newtable WHERE customername='Fahad Davis';

SELECT * FROM newtable;