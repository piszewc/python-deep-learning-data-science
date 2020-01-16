-- Explain the difference between the UNION ALL and UNION operators. In what cases are the two equivalent? When they are equivalent, which one should you use?

-- Write a query that generates a virtual auxiliary table of 10 numbers in the range 1 through 10 without using a looping construct. You do not need to guarantee any order of the rows in the output of your solution:

SELECT DISTINCT o1.custid, o1.empid
FROM Sales.Orders as o1
WHERE MONTH(o1.orderdate) = '01' AND YEAR(o1.orderdate) = 2016
EXCEPT
SELECT DISTINCT o1.custid, o1.empid
FROM Sales.Orders as o1
WHERE MONTH(o1.orderdate) = '02' AND YEAR(o1.orderdate) = 2016

-- Write a query that returns customer and employee pairs that had order activity in January 2016 but not in February 2016:
-- Table involved: Sales.Orders table

SELECT DISTINCT o1.custid, o1.empid
FROM Sales.Orders as o1
WHERE MONTH(o1.orderdate) = '01' AND YEAR(o1.orderdate) = 2016
INTERSECT
SELECT DISTINCT o1.custid, o1.empid
FROM Sales.Orders as o1
WHERE MONTH(o1.orderdate) = '02' AND YEAR(o1.orderdate) = 2016

-- Write a query that returns customer and employee pairs that had order activity in both January 2016 and February 2016:
-- Table involved: Sales.Orders

SELECT o1.custid, o1.empid
FROM Sales.Orders as o1
WHERE MONTH(o1.orderdate) = '01' AND YEAR(o1.orderdate) = 2016
INTERSECT

SELECT o1.custid, o1.empid
FROM Sales.Orders as o1
WHERE MONTH(o1.orderdate) = '02' AND YEAR(o1.orderdate) = 2016

EXCEPT
SELECT o1.custid, o1.empid
FROM Sales.Orders as o1
WHERE YEAR(o1.orderdate) = 2015

-- Write a query that returns customer and employee pairs that had order activity in both January 2016 and February 2016 but not in 2015:
--Table involved: Sales.Orders


SELECT o1.custid, o1.empid
FROM Sales.Orders as o1
WHERE MONTH(o1.orderdate) = '01' AND YEAR(o1.orderdate) = 2016
INTERSECT

SELECT o1.custid, o1.empid
FROM Sales.Orders as o1
WHERE MONTH(o1.orderdate) = '02' AND YEAR(o1.orderdate) = 2016

EXCEPT
SELECT o1.custid, o1.empid
FROM Sales.Orders as o1
WHERE YEAR(o1.orderdate) = 2015


--You are given the following query:
SELECT country, region, city
FROM HR.Employees
UNION ALL
SELECT country, region, city
FROM Production.Suppliers;
-- You are asked to add logic to the query so that it guarantees that the rows from Employees are returned in the output before the rows from Suppliers. Also, within each segment, the rows should be sorted by country, region, and city:
-- Tables involved: HR.Employees and Production.Suppliers