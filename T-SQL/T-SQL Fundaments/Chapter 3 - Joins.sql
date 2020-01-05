-- Write a query that generates five copies of each employee row:
-- Tables involved: HR.Employees and dbo.Nums

-- Write a query that returns a row for each employee and day in the range June 12, 2016 through June 16, 2016:
-- Tables involved: HR.Employees and dbo.Nums

-- Return US customers, and for each customer return the total number of orders and total quantities:
-- Tables involved: Sales.Customers, Sales.Orders, and Sales.OrderDetails

-- Return customers and their orders, including customers who placed no orders:
-- Tables involved: Sales.Customers and Sales.Orders

-- Return customers who placed no orders:
-- Tables involved: Sales.Customers and Sales.Orders

-- Return customers with orders placed on February 12, 2016, along with their orders:
-- Tables involved: Sales.Customers and Sales.Orders

-- Write a query that returns all customers in the output, but matches them with their respective orders only if they were placed on February 12, 2016:
-- Tables involved: Sales.Customers and Sales.Orders

-- Explain why the following query isn’t a correct solution query for Exercise 7:

SELECT C.custid, C.companyname, O.orderid, O.orderdate
FROM Sales.Customers AS C
LEFT OUTER JOIN Sales.Orders AS O
ON O.custid = C.custid
WHERE O.orderdate = '20160212'
OR O.orderid IS NULL;

-- Return all customers, and for each return a Yes/No value depending on whether the customer placed orders on February 12, 2016:
-- Tables involved: Sales.Customers and Sales.Orders