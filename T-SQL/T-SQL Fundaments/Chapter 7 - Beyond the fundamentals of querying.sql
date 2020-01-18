-- Write a query against the dbo.Orders table that computes both a rank and a dense rank for each customer order, partitioned by custid and ordered by qty:
-- Table involved: TSQLV4 database, dbo.Orders table

SELECT o.custid, o.orderid, o.qty, RANK() OVER(PARTITION BY o.custid ORDER BY o.qty) AS rank, DENSE_RANK() OVER(PARTITION BY o.custid  ORDER BY o.qty) as dense_rank
FROM dbo.Orders AS o
ORDER BY o.custid

-- Earlier in the chapter in the section “Ranking window functions,” I provided the following query against the Sales.OrderValues view to return distinct values and their associated row numbers:

SELECT val, ROW_NUMBER() OVER(ORDER BY val) AS rownum
FROM Sales.OrderValues
GROUP BY val;

-- Can you think of an alternative way to achieve the same task?
-- Table involved: TSQLV4 database, Sales.OrderValues view

--Write a query against the dbo.Orders table that computes for each customer order both the difference between the current order quantity and the customer’s previous order quantity and the difference between the current order quantity and the customer’s next order quantity:
-- Table involved: TSQLV4 database, dbo.Orders table

SELECT o.custid, o.orderid, o.qty, 
o.qty - LAG(o.qty) OVER(PARTITION BY custid
ORDER BY o.custid, o.orderdate ) AS prev_diff_in_qty ,
o.qty - LEAD(o.qty) OVER(PARTITION BY custid
ORDER BY o.custid, o.orderdate )  AS next_diff_in_qty
FROM dbo.Orders AS o
ORDER BY o.custid, o.orderdate 


-- Write a query against the dbo.Orders table that returns a row for each employee, a column for each order year, and the count of orders for each employee and order year:
-- Table involved: TSQLV4 database, dbo.Orders table

SELECT o.empid,
sum(CASE WHEN YEAR(o.orderdate) = 2014 THEN 1 ELSE 0 END) AS cnt2014,
sum(CASE WHEN YEAR(o.orderdate) = 2015 THEN 1 ELSE 0 END) AS cnt2015,
sum(CASE WHEN YEAR(o.orderdate) = 2016 THEN 1 ELSE 0 END) AS cnt2016
FROM dbo.Orders AS o
GROUP BY o.empid


-- Run the following code to create and populate the EmpYearOrders table:
USE TSQLV4;
DROP TABLE IF EXISTS dbo.EmpYearOrders;
CREATE TABLE dbo.EmpYearOrders
(
empid INT NOT NULL
CONSTRAINT PK_EmpYearOrders PRIMARY KEY,
cnt2014 INT NULL,
cnt2015 INT NULL,
cnt2016 INT NULL
);INSERT INTO dbo.EmpYearOrders(empid, cnt2014, cnt2015, cnt2016)
SELECT empid, [2014] AS cnt2014, [2015] AS cnt2015, [2016] AS cnt2016
FROM (SELECT empid, YEAR(orderdate) AS orderyear
FROM dbo.Orders) AS D
PIVOT(COUNT(orderyear)
FOR orderyear IN([2014], [2015], [2016])) AS P;
SELECT * FROM dbo.EmpYearOrders;

-- Write a query against the EmpYearOrders table that unpivots the data, returning a row for each employee and order year with the number of orders. Exclude rows in which the number of orders is 0 (in this example, employee 3 in the year 2015).

SELECT empid, orderyear, numorders
FROM dbo.EmpYearOrders
	CROSS APPLY 
		(VALUES
		(2014,cnt2014),
		(2015,cnt2015),
		(2016,cnt2016)) AS C(orderyear, numorders)
		WHERE numorders >0 ;

-- Write a query against the dbo.Orders table that returns the total quantities for each of the following: (employee, customer, and order year), (employee and order year), and (customer and order year). Include a result column in the output that uniquely identifies the grouping set with which the current row is associated:
-- Table involved: TSQLV4 database, dbo.Orders table

-- When you’re done with the exercises in this chapter, run the following code for cleanup:
DROP TABLE IF EXISTS dbo.Orders;