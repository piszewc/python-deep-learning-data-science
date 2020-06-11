-- Skill 2.2: Query data by using table expressions

-- Derived tables

SELECT categoryid, productid, productname, unitprice
FROM (SELECT
    ROW_NUMBER() OVER(PARTITION BY categoryid
        ORDER BY unitprice, productid) AS rownum,
    categoryid, productid, productname, unitprice
    
    FROM Production.Products) AS D
WHERE rownum <= 2;


-- Common table expressions

-- A common table expression (CTE) is a similar concept to a derived table in the sense that it’s
-- a named table expression that is visible only to the statement that defines it. Like a query
-- against a derived table, a query against a CTE involves three main parts:
-- ■ The inner query
-- ■ The name you assign to the query and its columns
-- ■ The outer query

-- Recall the example from the section about derived tables where you returned for each
-- product category the two products with the lowest unit prices. Here’s how you can implement the same task with a CTE:

WITH C AS (
    SELECT
        ROW_NUMBER() OVER(
            PARTITION BY categoryid
            ORDER BY
                unitprice,
                productid
        ) AS rownum,
        categoryid,
        productid,
        productname,
        unitprice
    FROM
        Production.Products
)
SELECT
    categoryid,
    productid,
    productname,
    unitprice
FROM
    C
WHERE
    rownum <= 2;


-- The fact that you don’t nest CTEs makes it easier to follow the logic
-- and therefore reduces the chances for errors. For example, if you want to refer to one CTE
-- from another, you can use the following general form:
WITH C1 AS (
    SELECT
...
    FROM
        T1
    WHERE
...
),
C2 AS (
    SELECT
    FROM
        C1
    WHERE
...
)
SELECT
...
FROM
    C2
WHERE
...;

-- Views and inline table-valued functions
-- The main difference between views and inline table-valued functions is that the former
-- doesn’t accept input parameters and the latter does. As an example, suppose you need to
DROP VIEW IF EXISTS Sales.RankedProducts;

GO
    CREATE VIEW Sales.RankedProducts AS
SELECT
    ROW_NUMBER() OVER(
        PARTITION BY categoryid
        ORDER BY
            unitprice,
            productid
    ) AS rownum,
    categoryid,
    productid,
    productname,
    unitprice
FROM
    Production.Products;

GO

-- As for inline table-valued functions, they are very similar to views in concept; however,
-- as mentioned, they do support input parameters. So if you want to define something like a
-- view with parameters, the closest you have is an inline table-valued function. 

DROP FUNCTION IF EXISTS HR.GetManagers;

GO
    CREATE FUNCTION HR.GetManagers(@empid AS INT) RETURNS TABLE AS RETURN WITH EmpsCTE AS (
        SELECT
            empid,
            mgrid,
            firstname,
            lastname,
            0 AS distance
        FROM
            HR.Employees
        WHERE
            empid = @empid
        UNION
        ALL
        SELECT
            M.empid,
            M.mgrid,
            M.firstname,
            M.lastname,
            S.distance + 1 AS distance
        FROM
            EmpsCTE AS S
            JOIN HR.Employees AS M ON S.mgrid = M.empid
    )
SELECT
    empid,
    mgrid,
    firstname,
    lastname,
    distance
FROM
    EmpsCTE;

GO