-- Retrieve companies ranked by sales totals
SELECT c.CompanyName as CompanyName, oh.TotalDue as TotalDue, RANK() OVER (ORDER BY TotalDue DESC) AS Rank
FROM SalesLT.Customer as c
Join SalesLT.SalesOrderHeader as oh
ON c.CustomerID = oh.CustomerID

-- Retrieve total sales by product
SELECT p.Name, SUM(od.LineTotal) as Total
FROM SalesLT.SalesOrderDetail as od
JOIN SalesLT.Product AS p
ON od.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY Total DESC

-- Filter the product sales list to include only products that cost over $1,000

SELECT p.Name, SUM(od.LineTotal) as Total
FROM SalesLT.SalesOrderDetail as od
JOIN SalesLT.Product AS p
ON od.ProductID = p.ProductID
WHERE p.ListPrice > 1000
GROUP BY p.Name
ORDER BY Total DESC


-- Filter the product sales groups to include only total sales over $20,000

SELECT p.Name, SUM(od.LineTotal) as Total
FROM SalesLT.SalesOrderDetail as od
JOIN SalesLT.Product AS p
ON od.ProductID = p.ProductID
WHERE p.ListPrice > 1000
GROUP BY p.Name
HAVING SUM(od.LineTotal) > 20000
ORDER BY Total DESC