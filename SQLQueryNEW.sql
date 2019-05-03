use Northwind

-- 1 Create a list of every country where we have either a customer or a supplier

Select Country
from Customers

union

Select Country
from suppliers


--2 Create a list of every city and country where we have either a customer or a supplier.

Select City
from Customers

union

Select City
from Suppliers


--3 Create a list of every country where we have both a customer and a supplier.

Select Country
from Customers

Intersect

Select Country
from suppliers




--4 Create a list of every city and country where we have both a customer and a supplier.

Select City
from Customers

Intersect

Select City
from Suppliers



--5 Create a list of every country where we have customers but not suppliers.

Select Country
from Customers

Except

Select Country
from suppliers




--6 Create a list of every country where we have suppliers but not customers.

Select City
from Customers

Except

Select City
from Suppliers


Go 

use TSQLV4


--1 Write a query that generates a virtual auxiliary table of 10 numbers 
--in the range 1 through 10 without using a looping construct. You do not 
--need to guarantee any order of the rows in the output of your solution

SELECT 1 AS n
UNION ALL SELECT 2
UNION ALL SELECT 3
UNION ALL SELECT 4
UNION ALL SELECT 5
UNION ALL SELECT 6
UNION ALL SELECT 7
UNION ALL SELECT 8
UNION ALL SELECT 9
UNION ALL SELECT 10;


--3 Write a query that returns customer and employee pairs that had order 
-- activity in January 2016 but not in February 2016:

SELECT custid, empid
FROM Sales.Orders
WHERE orderdate >= '2016 Janurary' AND orderdate < '2016 February'

EXCEPT

SELECT custid, empid
FROM Sales.Orders
WHERE orderdate >= '2016 February' AND orderdate < '2016 March';


--4 Write a query that returns customer and employee pairs that had order 
-- activity in both January 2016 and February 2016:

SELECT custid, empid
FROM Sales.Orders
WHERE orderdate >= '2016 Janurary' AND orderdate < '2016 February'

INTERSECT

SELECT custid, empid
FROM Sales.Orders
WHERE orderdate >= '2016 February' AND orderdate < '2016 March';


--5 Write a query that returns customer and employee pairs that had order 
-- activity in both January 2016 and February 2016 but not in 2015:

SELECT custid, empid
FROM Sales.Orders
WHERE orderdate >= '2016 January' AND orderdate < '2016 February'

INTERSECT

SELECT custid, empid
FROM Sales.Orders
WHERE orderdate >= '2016 February' AND orderdate < '2016 March'

EXCEPT

SELECT custid, empid
FROM Sales.Orders
WHERE orderdate >= '2015 January' AND orderdate < '2016 February';




--6 You are asked to add logic to the query so that it guarantees that the rows from Employees are
--returned in the output before the rows from Suppliers. Also, within each segment, the rows 
--should be sorted by country, region, and city: 

SELECT country, region, city
FROM (SELECT 1 AS sortcol, country, region, city
FROM HR.Employees


UNION ALL

SELECT 2,  country, region, city
FROM Production.Suppliers) AS D

ORDER BY sortcol, country, region, city;


   

 


