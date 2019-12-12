-- Retrieve customer information for all sales orders
SELECT  soh.SalesOrderID, soh.CustomerID, ci.FirstName, ci.LastName, soh.TotalDue
FROM SalesLT.SalesOrderHeader as soh
	CROSS APPLY dbo.ufnGetCustomerInformation(soh.CustomerID) AS ci
ORDER BY soh.CustomerID


-- Retrieve customer information for all sales orders

SELECT ca.CustomerID, ci.FirstName, ci.LastName, a.AddressLine1, a.City
FROM SalesLT.Address as a
JOIN SalesLT.CustomerAddress as ca
ON a.AddressID = ca.AddressID
	CROSS APPLY dbo.ufnGetCustomerInformation(ca.CustomerID) AS ci
ORDER BY ca.CustomerID