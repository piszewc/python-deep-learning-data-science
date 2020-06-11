-- Skill 2.1: Query data by using subqueries and APPLY
-- Subqueries
-- Self-contained subqueries
--Subqueries that return a single value, or scalar subqueries, can be used where a single-valued expression is expected, like in one side of a comparison. 
--For example, the following query uses a self-contained subquery to return the products with the minimum unit price:

USE TSQLV4;
SELECT productid,
    productname,
    unitprice
FROM Production.Products
WHERE unitprice = (
        SELECT MIN(unitprice)
        FROM Production.Products
    );

-- A subquery can also return multiple values in the form of a single column and multiple
-- rows. Such a subquery can be used where a multi-valued result is expected—for example,
-- when using the IN predicate. As an example, the following query uses a multi-valued subquery to return products supplied by suppliers from Japan.
SELECT productid,
    productname,
    unitprice
FROM Production.Products
WHERE supplierid IN (
        SELECT supplierid
        FROM Production.Suppliers
        WHERE country = N'Japan'
    );

-- Correlated subqueries
-- Correlated subqueries are subqueries where the inner query has a reference to a column from the table in the outer query. 
-- They are trickier to work with compared to self-contained subqueries because you can’t just highlight the inner portion and run it independently.
-- As an example, suppose that you need to return products with the minimum unit price per category. 
-- You can use a correlated subquery to return the minimum unit price out of the products where the category ID
-- is equal to the one in the outer row (the correlation), as follows:

SELECT categoryid,
    productid,
    productname,
    unitprice
FROM Production.Products AS P1
WHERE unitprice = (
        SELECT MIN(unitprice)
        FROM Production.Products AS P2
        WHERE P2.categoryid = P1.categoryid
    );

-- As another example of a correlated subquery, the following query returns customers who
-- placed orders on February 12, 2016:

SELECT custid,
    companyname
FROM Sales.Customers AS C
WHERE EXISTS (
        SELECT *
        FROM Sales.Orders AS O
        WHERE O.custid = C.custid
            AND O.orderdate = '20070212'
    );

-- As with other predicates, you can negate the EXISTS predicate as well. The following query
-- negates the previous query’s predicate, returning customers who did not place orders on
-- February 12, 2016:

SELECT custid,
    companyname
FROM Sales.Customers AS C
WHERE NOT EXISTS (
        SELECT *
        FROM Sales.Orders AS O
        WHERE O.custid = C.custid
            AND O.orderdate = '20160212'
    );

-- Optimization of subqueries versus joins

CREATE INDEX idx_cid_i_frt_oid ON Sales.Orders(custid) INCLUDE(freight, orderid);
Here ’ s the solution for the task using correlated subqueries:
SELECT orderid,
    custid,
    freight,
    freight / (
        SELECT SUM(O2.freight)
        FROM Sales.Orders AS O2
        WHERE O2.custid = O1.custid
    ) AS pctcust,
    freight - (
        SELECT AVG(O3.freight)
        FROM Sales.Orders AS O3
        WHERE O3.custid = O1.custid
    ) AS diffavgcust
FROM Sales.Orders AS O1;

-- Here’s the solution for the task using a derived table and a join:

SELECT O.orderid,
    O.custid,
    O.freight,
    freight / totalfreight AS pctcust,
    freight - avgfreight AS diffavgcust
FROM Sales.Orders AS O
    INNER JOIN (
        SELECT custid,
            SUM(freight) AS totalfreight,
            AVG(freight) AS avgfreight
        FROM Sales.Orders
        GROUP BY custid
    ) AS A ON O.custid = A.custid;

-- In short, when optimizing your solutions, it’s important to be informed about cases where
-- one tool does better than another. Also, make sure to keep an open mind, test different solutions, 
-- compare their run times and query plans, and eventually choose the optimal one.
-- The APPLY operator
-- The CROSS APPLY operator operates on left and right inputs. The right table expression can
-- have a correlation to elements from the left table. The right table expression is applied to
-- each row from the left input. What’s special about the CROSS APPLY operator as compared to
-- OUTER APPLY is that if the right table expression returns an empty set for a left row, the left
-- row isn’t returned. The reason that this operator is called CROSS APPLY is that per the left row,
-- the operator behaves like a cross join between that row and the result set returned for it from
-- the right input. Figure 2-3 shows an illustration of the CROSS APPLY operator
-- As an example, consider the following query, which returns the two products with the lowest unit prices for supplier 1:

SELECT TOP (2) productid,
    productname,
    unitprice
FROM Production.Products
WHERE supplierid = 1
ORDER BY unitprice,
    productid;

-- Suppose that you need to apply this logic to each of the suppliers from Japan that you
-- have in the Production.Suppliers table. You don’t want to use a cursor to iterate through the
-- suppliers one at a time and invoke a separate query for each. Instead, you can use the CROSS
-- APPLY operator, like so:

SELECT S.supplierid,
    S.companyname AS supplier,
    A.*
FROM Production.Suppliers AS S
    CROSS APPLY (
        SELECT TOP (2) productid,
            productname,
            unitprice
        FROM Production.Products AS P
        WHERE P.supplierid = S.supplierid
        ORDER BY unitprice,
            productid
    ) AS A
WHERE S.country = N'Japan';

-- OUTER APPLY
-- The OUTER APPLY operator extends what the CROSS APPLY operator does by also including
-- in the result rows from the left side that get an empty set back from the right side. NULLs are
-- used as placeholders for the result columns from the right side. In other words, the OUTER
-- APPLY operator preserves the left side. In a sense, for each single left row, the difference
-- between OUTER APPLY and CROSS APPLY is similar to the difference between a LEFT OUTER
-- JOIN and a CROSS JOIN. Figure 2-4 shows an illustration of the OUTER APPLY operator:

SELECT
    S.supplierid,
    S.companyname AS supplier,
    A.*
FROM
    Production.Suppliers AS S
    OUTER APPLY (
        SELECT
            TOP (2) productid,
            productname,
            unitprice
        FROM
            Production.Products AS P
        WHERE
            P.supplierid = S.supplierid
        ORDER BY
            unitprice,
            productid
    ) AS A
WHERE
    S.country = N'Japan';