-- The following query attempts to filter orders that were not placed on the last day of the year.
-- It’s supposed to return the order ID, order date, customer ID, employee ID, and respective end-of-year date for each order:


SELECT orderid, orderdate, custid, empid,
DATEFROMPARTS(YEAR(orderdate), 12, 31) AS endofyear
FROM Sales.Orders
WHERE orderdate <> endofyear;

-- When you try to run this query, you get the following error:
--Msg 207, Level 16, State 1, Line 233
--Invalid column name 'endofyear'.
--Explain what the problem is, and suggest a valid solution.

WITH C AS (
	SELECT *,
	DATEFROMPARTS(YEAR(orderdate), 12, 31) AS endofyear
	FROM Sales.Orders
)
SELECT orderid, orderdate, custid, empid, endofyear
FROM C
WHERE orderdate <> endofyear; 


-- Write a query that returns the maximum value in the orderdate column for each employee:
-- Table involved: TSQLV4 database, Sales.Orders table

-- Encapsulate the query from Exercise 2-1 in a derived table. Write a join query between the derived table and the Orders table to return the orders with the maximum order date for each employee:
-- Table involved: Sales.Orders

-- Write a query that calculates a row number for each order based on orderdate, orderid ordering:
-- Table involved: Sales.Orders

-- Write a query that returns rows with row numbers 11 through 20 based on the row-number definition in Exercise 3-1. Use a CTE to encapsulate the code from Exercise 3-1:
-- Table involved: Sales.Orders

-- Write a solution using a recursive CTE that returns the management chain leading to Patricia Doyle (employee ID 9):
-- Table involved: HR.Employees

-- Create a view that returns the total quantity for each employee and year:
-- Tables involved: Sales.Orders and Sales.OrderDetails
-- When running the following code:

SELECT * FROM Sales.VEmpOrders ORDER BY empid, orderyear;

-- Write a query against Sales.VEmpOrders that returns the running total quantity for each employee and year:
-- Table involved: Sales.VEmpOrders view

-- Create an inline TVF that accepts as inputs a supplier ID (@supid AS INT) and a requested number of products (@n AS INT). The function should return @n products with the highest unit prices that are supplied by the specified supplier ID:
-- Table involved: Production.Products
-- When issuing the following query:Click here to view code image
SELECT * FROM Production.TopProducts(5, 2);

-- Using the CROSS APPLY operator and the function you created in Exercise 6-1, return the two most expensive products for each supplier:
-- Table involved: Production.Suppliers