-- Retrieve customer sales revenue for each parent category
SELECT *
FROM (SELECT c.CompanyName, ac.ParentProductCategoryName, od.LineTotal 
	FROM SalesLT.vGetAllCategories AS ac
	JOIN SalesLT.Product AS p
	ON ac.ProductCategoryID = p.ProductCategoryID
	JOIN SalesLT.SalesOrderDetail as od
	ON p.ProductID = od.ProductID
	JOIN SalesLT.SalesOrderHeader as oh
	ON od.SalesOrderID = oh.SalesOrderID
	JOIN SalesLT.Customer as c
	ON oh.CustomerID = c.CustomerID) AS PPC
PIVOT( SUM(LineTotal) FOR ParentProductCategoryName IN ([Bikes], [Accessories], [Clothing], [Components])) AS pvt
ORDER BY CompanyName;