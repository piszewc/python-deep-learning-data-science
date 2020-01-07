-- Write a query that generates five copies of each employee row:
-- Tables involved: HR.Employees and dbo.Nums

SELECT e.lastname, e.firstname, e.empid, n.n
FROM HR.Employees AS e 
CROSS JOIN dbo.Nums as n
WHERE n.n <= 5
ORDER BY e.empid

-- Write a query that returns a row for each employee and day in the range June 12, 2016 through June 16, 2016:
-- Tables involved: HR.Employees and dbo.Nums

SELECT e.empid, e.firstname, e.lastname, DATEADD(day, n.n-1,CAST('20160612' AS DATE)) AS dates
FROM HR.Employees AS e
CROSS JOIN dbo.Nums AS n
WHERE n.n <= DATEDIFF(day,'20160612','20160616')+1
ORDER BY e.empid

-- Return US customers, and for each customer return the total number of orders and total quantities:
-- Tables involved: Sales.Customers, Sales.Orders, and Sales.OrderDetails

SELECT c.custid, count(DISTINCT o.orderid) AS CountOfOrders, SUM(od.qty) as TotalOrders
FROM Sales.Customers AS c
JOIN Sales.Orders AS o 
	ON c.custid = o.custid
JOIN Sales.OrderDetails as od
	ON o.orderid = od.orderid
WHERE c.Country = 'USA'
GROUP BY c.custid
ORDER BY c.custid


-- Return customers and their orders, including customers who placed no orders:
-- Tables involved: Sales.Customers and Sales.Orders

SELECT c.custid, c.companyname, o.orderid, o.orderdate
FROM Sales.Customers AS c
LEFT JOIN Sales.Orders as o
ON c.custid = o.custid

-- Return customers who placed no orders:
-- Tables involved: Sales.Customers and Sales.Orders

SELECT c.custid, c.companyname
FROM Sales.Customers AS c
LEFT JOIN Sales.Orders as o
ON c.custid = o.custid
WHERE o.orderid IS NULL

-- Return customers with orders placed on February 12, 2016, along with their orders:
-- Tables involved: Sales.Customers and Sales.Orders

SELECT c.custid, c.companyname, o.orderid, o.orderdate
FROM Sales.Customers AS c
JOIN Sales.Orders AS o
ON c.custid = o.custid
WHERE o.orderdate = '20160212'

-- Write a query that returns all customers in the output, but matches them with their respective orders only if they were placed on February 12, 2016:
-- Tables involved: Sales.Customers and Sales.Orders

SELECT c.custid, c.companyname, o.orderid, o.orderdate
FROM Sales.Customers AS c
LEFT outer JOIN Sales.Orders AS o
ON c.custid = o.custid
AND o.orderdate = '20160212'

-- Explain why the following query isn’t a correct solution query for Exercise 7:

SELECT C.custid, C.companyname, O.orderid, O.orderdate
FROM Sales.Customers AS C
LEFT OUTER JOIN Sales.Orders AS O
ON O.custid = C.custid
WHERE O.orderdate = '20160212'
OR O.orderid IS NULL;

-- Return all customers, and for each return a Yes/No value depending on whether the customer placed orders on February 12, 2016:
-- Tables involved: Sales.Customers and Sales.Orders

SELECT C.custid, C.companyname, CASE WHEN O.orderid IS NOT NULL THEN 'YES' ELSE 'NO' END AS hasorderon20160212
FROM Sales.Customers AS C
LEFT OUTER JOIN Sales.Orders AS O
ON c.custid = o.custid
AND o.orderdate = '20160212'
