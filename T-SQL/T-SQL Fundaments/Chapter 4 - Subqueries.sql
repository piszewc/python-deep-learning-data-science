-- Write a query that returns all orders placed on the last day of activity that can be found in the Orders table:
-- Table involved: Sales.Orders

SELECT o.orderid, o.orderdate, o.custid, o.empid
FROM Sales.Orders as o
WHERE o.orderdate = (SELECT MAX(orderdate)
FROM Sales.Orders)
ORDER BY o.empid

-- Write a query that returns all orders placed by the customer(s) who placed the highest number of orders. Note that more than one customer might have the same number of orders:
-- Table involved: Sales.Orders

SELECT o.orderid, o.orderdate, o.custid, o.empid
FROM Sales.Orders as o
WHERE o.custid = (SELECT TOP(1) custid
FROM Sales.Orders
GROUP BY custid
ORDER BY COUNT(*) DESC
)


-- Write a query that returns employees who did not place orders on or after May 1, 2016:
-- Tables involved: HR.Employees and Sales.Orders

SELECT e.empid, e.firstname, e.lastname
FROM HR.Employees as e
WHERE e.empid NOT IN (SELECT DISTINCT empid
FROM Sales.Orders WHERE orderdate >= '20160501')

-- Write a query that returns countries where there are customers but not employees:
-- Tables involved: Sales.Customers and HR.Employees
SELECT DISTINCT c.country
FROM Sales.Customers AS c
WHERE c.country NOT IN (SELECT DISTINCT country
FROM HR.Employees as e)


-- Write a query that returns for each customer all orders placed on the customer’s last day of activity:
-- Table involved: Sales.Orders

SELECT custid, orderid, orderdate, empid
FROM Sales.Orders AS o
WHERE orderdate = 
(SELECT MAX(o1.orderdate)
FROM Sales.Orders AS o1
WHERE o1.custid = o.custid)
ORDER BY custid


-- Write a query that returns customers who placed orders in 2015 but not in 2016:
-- Tables involved: Sales.Customers and Sales.Orders

SELECT o.custid, o.companyname
FROM Sales.Customers AS o
WHERE o.custid IN 
	(SELECT custid
	FROM Sales.Orders 
	WHERE YEAR(orderdate) = 2015
	) AND o.custid NOT IN (SELECT custid
	FROM Sales.Orders 
	WHERE YEAR(orderdate) = 2016
	)


-- Write a query that returns customers who ordered product 12:
-- Tables involved: Sales.Customers, Sales.Orders, and Sales.OrderDetails

SELECT custid, companyname
FROM Sales.Customers AS o
WHERE o.custid IN 
	(
	SELECT custid
	FROM Sales.Orders
	WHERE orderid IN
		(
		SELECT orderid
		FROM Sales.OrderDetails
		WHERE productid = 12
		)
	)
ORDER BY o.custid 

-- Write a query that calculates a running-total quantity for each customer and month:
-- Table involved: Sales.CustOrders



-- Explain the difference between IN and EXISTS

-- The form of the IN predicate is <scalar_expression> IN (<multivalued subquery>) The predicate evaluates to TRUE if scalar_expression is equal to any of the values returned by the subquery. Recall the request in the previous section—returning orders that were handled by employees with a last name starting with a certain letter. Because more than one employee can have a last name starting with the same letter, this request should be handled with the IN predicate not with an equality operator

-- T-SQL supports a predicate called EXISTS that accepts a subquery as input and returns TRUE if the subquery returns any rows and FALSE otherwise.
-- One of the benefits of using the EXISTS predicate is that you can intuitively phrase queries that sound like English. For example, this query can be read just as you would say it in ordinary English: Return customers from Spain if they have any orders where the order’s customer ID is the same as the customer’s customer ID

-- Write a query that returns for each order the number of days that passed since the same customer’s previous order. To determine recency among orders, use orderdate as the primary sort element and orderid as the tiebreaker:
-- Table involved: Sales.Orders