# Module 6: Using Sub queries and APPLY



## Introduction to Sub queries

### Module Overview

- Introduction to Sub queries
- Scalar or Multi-Valued?
- Self-Contained or Correlated?
- Using APPLY with with Table-Valued Functions

### Introduction to Sub queries

- Sub queries are nested queries: queries within queries
- Results of inner query passed to outer query
  - Inner query acts like an expression from perspective of outer query

![image-20191221205730375](C:\Users\goto\AppData\Roaming\Typora\typora-user-images\image-20191221205730375.png)

Scaler or Multi-Valued?

- Scaler sub query returns single value to outer query

  - Can be used anywhere single-valued expression is used: SELECT, WHERE, and so on

    > SELECT orderid, productid, unitprice, qty,
    > FROM Sales.OrderDetails
    > WHERE orderid = 
    > 	(SELECT MAX(oderid) AS lastorder FROM Sales.Orders);

- Multi-valued subquery returns multiple values as a single column set to the outer query

  - Used with IN predicate

    > SELECT custid, orderid
    > FROM Sales.orders
    > WHERE custid IN 
    > (SELECT custid FROM Sales.Customers WHERE countryregion = N'Mexico');

## Key Points and Additional Reading

### Key Points

- Subqueries are Transact-SQL queries nested within an outer query.
- Scalar subqueries return a single value.
- Multi-valued subqueries return a single-column rowset.

### Additional Reading

Review the documentation on [Subquery Fundamentals](https://technet.microsoft.com/en-us/library/ms189575(v=sql.105).aspx) in SQL Server 2008 R2 Books Online.

*Note that while this documentation is based on a previous release of SQL Server, it is still relevant.*

## Self-Contained or Correlated?

- Most sub queries are self-contained and have no connection with the outer query other thank passing it results

- Correlated subqueries refer to elements of tables used in outer query

  - Dependent on outer query, cannot be executed separately
  - Behaves as if inner query is executed once per outer row
  - May return scalar value or multiple values

  > SELECT orderid, empid, orderdate
  > FROM Sales.Orders as O1
  > WHERE orderdate = (SELECT MAX(orderdate)FROM Sales.Orders as O2 WHERE O2.empid = O1.empid)
  > ORDER BY empid, orderdate;



## Key Points and Additional Reading

### Key Points

- Correlated subqueries reference objects in the outer query.

### Additional Reading

Review the documentation on [Correlated Subqueries](https://technet.microsoft.com/en-us/library/ms187638(v=sql.105).aspx) in SQL Server 2008 R2 Books Online.

*Note that while this this documentation is based on a previous release of SQL Server, it is still relevant.*



## The APPLY Operator

Using APPLY with Table-Valued Functions

- CROSS APPLY applies the rifht table expression to each row in left table

  - Conceptually similar to CROSS JOIN between two tables but can correlate data between source

  > SELECT S.supplierid, s.comanyname, P.productid, P.productname, P.unitprice
  > FROM Production.Supplies AS S
  > CROSS APPLY dbo.fn_TopProductsByShipper(S.supplierid) AS P

- OUTER APPLY adds rows from those with NULL in columns from right table

  - Conceptually similar to LEFT OUTER JOIN between two tables

## Key Points and Additional Reading

### Key Points

- The APPLY operator enables you to execute a table-valued function for each row in a rowset returned by a SELECT statement. Conceptually, this approach is similar to a correlated subquery.
- CROSS APPLY returns matching rows, similar to an inner join. OUTER APPLY returns all rows in the original SELECT query results with NULL values for rows where no match was found.

### Additional Reading

Review the documentation on [Using Apply](https://technet.microsoft.com/en-us/library/ms175156(v=sql.105).aspx) in SQL Server 2008 R2 Books Online.