-- Retrieve the name and approximate weight of each product
SELECT p.ProductID as ProductID, UPPER(p.Name) AS Name, ROUND(Weight,0) as ApproxWeight
FROM SalesLT.Product AS p

-- Retrieve the year and month in which products were first sold
SELECT p.ProductID as ProductID, UPPER(p.Name) AS Name, ROUND(Weight,0) as ApproxWeight, YEAR(p.SellStartDate) as SellStartYear , DATENAME(mm,p.SellStartDate) as SellStartMonth
FROM SalesLT.Product AS p

-- Extract product types from product numbers
SELECT p.ProductID as ProductID, UPPER(p.Name) AS Name, ROUND(Weight,0) as ApproxWeight, YEAR(p.SellStartDate) as SellStartYear , DATENAME(mm,p.SellStartDate) as SellStartMonth, LEFT(p.ProductNumber,2) as ProductType 
FROM SalesLT.Product AS p

-- Retrieve only products with a numeric size
SELECT p.ProductID as ProductID, UPPER(p.Name) AS Name, ROUND(Weight,0) as ApproxWeight, YEAR(p.SellStartDate) as SellStartYear , 
DATENAME(mm,p.SellStartDate) as SellStartMonth, LEFT(p.ProductNumber,2) as ProductType
FROM SalesLT.Product AS p 
WHERE  ISNUMERIC(p.Size) = 1