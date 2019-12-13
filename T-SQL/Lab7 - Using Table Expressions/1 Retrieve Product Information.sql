-- Retrieve product model descriptions

SELECT p.ProductID, p.Name as Product_Name, vpm.Name as Product_Model_Name, vpm.Summary
FROM SalesLT.Product as p
JOIN SalesLT.vProductModelCatalogDescription as vpm ON p.ProductModelID = vpm.ProductModelID
ORDER BY p.ProductID


-- Create a table of distinct colors
DECLARE @colors AS TABLE (Color nvarchar(15));

INSERT INTO @Colors
SELECT DISTINCT Color FROM SalesLT.Product;

SELECT ProductID, Name, Color
FROM SalesLT.Product
WHERE Color IN (SELECT Color FROM @Colors);


-- Retrieve product parent categories
SELECT C.ParentProductCategoryName AS ParentCategory,
       C.ProductCategoryName AS Category,
       P.ProductID, P.Name AS ProductName
FROM SalesLT.Product AS P
JOIN dbo.ufnGetAllCategories() AS C
ON P.ProductCategoryID = C.ProductCategoryID
ORDER BY ParentCategory, Category, ProductName;