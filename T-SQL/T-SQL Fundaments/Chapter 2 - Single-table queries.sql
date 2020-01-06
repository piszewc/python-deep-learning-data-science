-- Write a query against the Sales.Orders table that returns orders placed in June 2015:
-- Tables involved: TSQLV4 database and the Sales.Orders table

SELECT o.orderid, o.orderdate, o.custid, o.empid
FROM Sales.Orders AS o
WHERE YEAR(o.orderdate) = 2015 AND MONTH(o.orderdate) = 6

-- Write a query against the Sales.Orders table that returns orders placed on the last day of the month:
-- Tables involved: TSQLV4 database and the Sales.Orders table

SELECT o.orderid, o.orderdate, o.custid, o.empid
FROM Sales.Orders as o
WHERE MONTH(o.orderdate) != MONTH(DATEADD(day,1,o.orderdate))

-- Write a query against the HR.Employees table that returns employees with a last name containing the letter e twice or more:
-- Tables involved: TSQLV4 database and the HR.Employees table
SELECT e.lastname, e.firstname 
FROM HR.Employees as e
WHERE e.lastname LIKE '%e%e%'

-- Write a query against the Sales.OrderDetails table that returns orders with (quantity * unitprice) greater than 10,000, sorted by total value:
-- Tables involved: TSQLV4 database and the Sales.OrderDetails table

SELECT od.orderid, SUM(od.qty * od.unitprice) AS total_value
FROM Sales.OrderDetails as od
GROUP BY od.orderid
HAVING SUM(od.qty * od.unitprice) > 10000
ORDER BY total_value DESC

-- To check the validity of the data, write a query against the HR.Employees table that returns employees with a last name that starts with a lowercase English letter in the range a through z.
-- Remember that the collation of the sample database is case insensitive (Latin1_General_CI_AS):
-- Tables involved: TSQLV4 database and the HR.Employees table

SELECT e.lastname
FROM HR.Employees as e
WHERE e.lastname COLLATE Latin1_General_CS_AS like N'[abcdfghjklmnpqrstvwxyz]%'

-- Explain the difference between the following two queries:
-- Click here to view code image
-- Query 1
SELECT empid, COUNT(*) AS numorders
FROM Sales.Orders
WHERE orderdate < '20160501'
GROUP BY empid;
-- Query 2
SELECT empid, COUNT(*) AS numorders
FROM Sales.Orders
GROUP BY empid
HAVING MAX(orderdate) < '20160501';
-- Tables involved: TSQLV4 database and the Sales.Orders table
/* 
Query 1 is Using WHERE - with is filtering data before aggrigating it
In Query 2 we are using Having that is filtering data after aggregation 
*/

/*
Answer from book
The WHERE clause is a row filter, whereas the HAVING clause is a group filter. Query 1
filters only orders placed before May 2016, groups them by the employee ID, and returns the
number of orders each employee handled among the filtered ones. In other words, it
computes how many orders each employee handled prior to May 2016. The query doesn’t
include orders placed in May 2016 or later in the count. An employee will show up in the
output as long as he or she handled orders prior to May 2016, regardless of whether the
employee handled orders since May 2016. Here’s the output of Query 1:
empid numorders
----------- -----------
9 43
3 127
6 67
7 70
1 118
4 154
5 42
2 94
8 101
Query 2 groups all orders by the employee ID, and then filters only groups having a
maximum date of activity prior to May 2016. Then it computes the order count in each
employee group. The query discards the entire employee group if the employee handled any
orders since May 2016. In a sentence, this query returns for employees who didn’t handle any
orders since May 2016 the total number of orders they handled. This query generates the
following output:
empid numorders
----------- -----------
9 43
3 127
6 67
5 42
Take employee 1 as an example. This employee had activity both before and since May
2016. The first query result includes this employee, but the order count reflects only the
orders the employee handled prior to May 2016. The second query result doesn’t include this
employee at all.
*/

-- Write a query against the Sales.Orders table that returns the three shipped-to countries with the highest average freight in 2015:
-- Tables involved: TSQLV4 database and the Sales.Orders table

SELECT TOP(3) o.shipcountry, AVG(o.freight) AS avg_freight
FROM Sales.Orders as o
WHERE YEAR(o.orderdate) = 2015 
GROUP BY o.shipcountry
ORDER BY AVG(o.freight) DESC

-- Write a query against the Sales.Orders table that calculates row numbers for orders based on order date ordering (using the order ID as the tiebreaker) for each customer separately:
-- Tables involved: TSQLV4 database and the Sales.Orders table

SELECT o.custid, o.orderdate, o.orderid ,ROW_NUMBER() OVER(PARTITION BY o.custid ORDER BY o.orderdate, o.orderid) AS rownum
FROM Sales.Orders AS o
GROUP BY o.custid, o.orderdate, o.orderid
ORDER BY o.custid, o.orderdate ASC

-- Using the HR.Employees table, write a SELECT statement that returns for each employee the gender based on the title of courtesy. For ‘Ms.’ and ‘Mrs.’ return ‘Female’; for ‘Mr.’ return ‘Male’; and in all other cases (for example, ‘Dr.‘) return ‘Unknown’:
-- Tables involved: TSQLV4 database and the HR.Employees table


SELECT e.lastname, e.firstname, 
CASE 
	WHEN e.titleofcourtesy LIKE 'Ms.' THEN 'Female'
	WHEN e.titleofcourtesy LIKE 'Mrs.' THEN 'Female'
	WHEN e.titleofcourtesy LIKE 'Mr.' THEN 'Male'
	ELSE 'Unknown'
END
AS Gender
FROM HR.Employees as e


-- Write a query against the Sales.Customers table that returns for each customer the customer ID and region. Sort the rows in the output by region, having NULLs sort last (after non-NULL values). Note that the default sort behavior for NULLs in T-SQL is to sort first (before nonNULL values):
-- Tables involved: TSQLV4 database and the Sales.Customers table

SELECT c.custid, c.region
FROM Sales.Customers AS c
ORDER BY CASE WHEN c.region IS NOT NULL THEN 1 ELSE 0 END DESC, c.region ASC