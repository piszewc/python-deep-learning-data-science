-- Write a query against the dbo.Orders table that computes both a rank and a dense rank for each customer order, partitioned by custid and ordered by qty:
-- Table involved: TSQLV4 database, dbo.Orders table

-- Earlier in the chapter in the section “Ranking window functions,” I provided the following query against the Sales.OrderValues view to return distinct values and their associated row numbers:

SELECT val, ROW_NUMBER() OVER(ORDER BY val) AS rownum
FROM Sales.OrderValues
GROUP BY val;
-- Can you think of an alternative way to achieve the same task?
-- Table involved: TSQLV4 database, Sales.OrderValues view

--Write a query against the dbo.Orders table that computes for each customer order both the difference between the current order quantity and the customer’s previous order quantity and the difference between the current order quantity and the customer’s next order quantity:
-- Table involved: TSQLV4 database, dbo.Orders table

-- Write a query against the dbo.Orders table that returns a row for each employee, a column for each order year, and the count of orders for each employee and order year:
-- Table involved: TSQLV4 database, dbo.Orders table

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

-- Write a query against the dbo.Orders table that returns the total quantities for each of the following: (employee, customer, and order year), (employee and order year), and (customer and order year). Include a result column in the output that uniquely identifies the grouping set with which the current row is associated:
-- Table involved: TSQLV4 database, dbo.Orders table

-- When you’re done with the exercises in this chapter, run the following code for cleanup:
DROP TABLE IF EXISTS dbo.Orders;