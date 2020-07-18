-- Retrieve totals for country/region and state/province
SELECT a.CountryRegion, a.StateProvince, SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca
ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c
ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh
ON c.CustomerID = soh.CustomerID
GROUP BY ROLLUP(a.CountryRegion, a.StateProvince)
ORDER BY a.CountryRegion, a.StateProvince;


-- Indicate the grouping level in the results
SELECT 
	(CASE
	WHEN GROUPING_ID(a.CountryRegion, a.StateProvince) = 0 THEN 'Province'
	WHEN GROUPING_ID(a.CountryRegion, a.StateProvince) = 1 THEN 'Country Total'
	WHEN GROUPING_ID(a.CountryRegion, a.StateProvince) = 3 THEN 'Total' 
	ELSE ''
	END) AS SummaryType, a.CountryRegion, a.StateProvince, SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca
ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c
ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh
ON c.CustomerID = soh.CustomerID
GROUP BY ROLLUP(a.CountryRegion, a.StateProvince)
ORDER BY a.CountryRegion, a.StateProvince;



-- Add a grouping level for cities
SELECT 
	(CASE
	WHEN GROUPING_ID(a.CountryRegion, a.StateProvince, a.City) = 0 THEN 'City'
	WHEN GROUPING_ID(a.CountryRegion, a.StateProvince, a.City) = 1 THEN 'Province Total'
	WHEN GROUPING_ID(a.CountryRegion, a.StateProvince, a.City) = 3 THEN 'Country Total'
	WHEN GROUPING_ID(a.CountryRegion, a.StateProvince, a.City) = 7 THEN 'Total' 
	ELSE ''
END) AS SummaryType,a.CountryRegion, a.StateProvince, a.City, SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca
ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c
ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh
ON c.CustomerID = soh.CustomerID
GROUP BY ROLLUP(a.CountryRegion, a.StateProvince, a.City)
ORDER BY a.CountryRegion, a.StateProvince, a.City;
