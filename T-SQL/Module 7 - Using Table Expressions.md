# Module 7: Using Table Expressions 



## Table Expressions Overview

Module Overview

- Views

- Temporary Tables

- Table Variables

- Table-Valued Functions

- Derived Tables

- Common Table Exprossions

  

## Key Points and Additional Reading

### Key Points

- Views are database objects that encapsulate SELECT queries.
- You can query a view in the same way as a table, however there are some considerations for updating them.

### Additional Reading

Review the documentation on [CREATE VIEW](https://msdn.microsoft.com/en-us/library/ms187956.aspx) in the Transact-SQL Language Reference.

## Using Temporary Tables and Table Variables

### Temporary Tables

> CREATE TABLES #tmpProducts
> (ProductID INTEGER, 
> 	ProductName varchar(50));
> GO
> ...
> SELECT * FROM #tmpProducts;

- Temporary tables are used to hold temporary results sets within a user's session
  - Created in tempdb and deleted automatically 
  - Created with a # prefix
  - Global temporary tables are created with ## prefix

### Table Variables

> DECLARE @varProducts table
> (ProductID INTEGER, 
> ProductNamese varchar(50));
> ...
> SELECT * FROM @varProducts

- Introduced because temporary tables can cause recompilations
- Used similarly to temporary tables but scoped to the batch 
- Used only on very small datasets

## Key Points and Additional Reading

### Key Points

- Temporary tables are prefixed with a **#** symbol (You can also create global temporary tables that can be accessed by other processes by prefixing the name with **##**)
- Local temporary tables are automatically deleted when the session in which they were created ends. Global temporary tables are deleted when the last user sessions referencing them is closed.
- Table variables are prefixed with a **@** symbol.
- Table variables are scoped to the batch in which they are created.

### Additional Reading

Review the documentation for the [table](https://msdn.microsoft.com/en-us/library/ms175010.aspx) data type in the Transact-SQL Language Reference.

## Querying Table-Valued Functions

Table-Valued Functions

> CREATE FUNCTION Sales.fn_GetOrderItems (@OrderID as Integer)
> RETURNS TABLE
> AS
> RETURN 
> (SELECT ProductID, UnitPrice, Quantity
> FROM Sales.OrdersDetails
> WHERE OrderID = @OrderID);
> ...
> SELECT * FROM Sales.fn_GetOrderItems (1025) as LineItems;

- TVFs are named objects with definitions stored in a database
- TVFs return a virtual table to the calling query 
- Unlike views, TVFs support input parameters
  - TVFs may be though of as parameterized views



## Key Points and Additional Reading

### Key Points

- Table-Valued Functions (TVFs) are functions that return a rowset.
- TVFs can be parameterized.

### Additional Reading

Review the documentation on [Table-Valued User-Defined Functions](https://msdn.microsoft.com/en-us/library/ms191165(v=sql.105).aspx) in SQL Server 2008 R2 Books Online.



## Using Derived Tables

Derived Tables

- Derived tables **must**:
  - Have an alies
  - Have unique names for all columns
  - Not use an ORDER BY clause (without TOP or OFFSET/FETCH)
  - Not be referred to multiple times in the same query

- Derived tables may:
  -  Use internal or external aliases for columns 
  - Refer to parameters and/or variables
  - Be nested within other derived tables

Specifying Column Aliases

- > Column aliases may be defined inline:
  > SELECT orderyear, COUNT(DISTINCT custid) AS cust_count
  > FROM ( SELECT YEAR(orderdate) AS orderyear, custid
  > 	FROM Sales.Orders) AS derived_year
  > GROUP BY orderyear;

- Or externally:

  > SELECT orderyear, COUNT(DISTINT custid) AS cust_count
  > FROM ( SELECT YEAR(orderdate), custid
  > 	FROM Sales.Orders) AS derived_year(orderyear, custid)
  > GROUP BY orderyear;

## Using Common Table Expressions

Recursion

> WITH OrgREport (ManagerID, EmployeeID, EmployeeName, Level)
> AS 
>
> (
>
> SELECT e.ManagerID, e.EmployeeID, EmployeeName, 0
> FROM HR.Employee AS e
> WHERE ManagerID IS NULL
> UNION ALL
> SELECT e.ManagerID, e.EmployeeID, e.EmployeeName, Level +1
> FROM HR.Employee AS e
> INNER JOIN OrgReport AS o ON e.ManagerID = o.EmployeeID
>
> )
>
> SELECT * FROM OrgReport
> OPTION (MAXRECURSION 3);

- Specify a query for the anchor (root) level
- Use UNION ALL to add a recursive query for other levles

## Key Points and Additional Reading

### Key Points

- A derived table is a subquery that generates a multicolumn rowset. You must use the AS clause to define an alias for a derived query.
- Common Table Expressions (CTEs) provide a more intuitive syntax or defining rowsets than derived tables, and can be used mulitple times in the same query.
- You can use CTEs to define recursive queries.

### Additional Reading

Review the documentation on [WITH common_table_expression](https://msdn.microsoft.com/en-us/library/ms175972.aspx) in the Transact-SQL Language Reference.

