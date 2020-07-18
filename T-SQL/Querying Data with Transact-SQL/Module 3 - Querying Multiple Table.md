# Introduction to Joins



## Join Syntax

- ANSI SQL-92

  - Tables Joined by Join operator in FROM Claus

    - Preferred syntax

      > SELECT ...
      >
      > FROM Table1 JOIN Table2
      >
      > ON <on_predicate>;

- ANSI SQL-89

  - Tables joined by commas in FROM Clause

    - Not recommended: Accidental Cartesian products!

      > SELECT ...
      >
      > FROM Table1, Table2
      >
      > ON <on_predicate>;



## Inner Joins

- Return only rows where a match is found in both input tables
- Match rows based on attributes supplied in predicate
- If join predicate operator is = , also know as equi-join

> SELECT emp.FirstName, ord.Amount
> FROM HR.Employee as emp
> [INNER] JOIN Sales.SalesOrder AS ord
> ON emp.EmployeeID = ord.EmployeeID

![image-20191218212739004](C:\Users\piotr\AppData\Roaming\Typora\typora-user-images\image-20191218212739004.png)

## Key Points and Additional Reading

### Key Points

- Inner joins return only rows where a match can be found in both tables.
- Inner joins that match rows based on columns containing the same value in both tables are sometimes referred to as equi-joins.

### Additional Reading

Review the documentation on [Using Inner Joins](https://technet.microsoft.com/en-us/library/ms190014(v=sql.105).aspx) in SQL Server 2008 R2 Books Online.

*Note that while this documentation is based on a previous release of SQL Server, the information it contains is still relevant for Transact-SQL queries in SQL Server and Azure SQL Database.*

## Outer Joins

- Return all rows from one table and any matching rows from second table
- One Table's rows are "preserved"
  - Designed with LEFT, RIGHT; FULL keyword
  - All rows from preserved table output to result set
- Matches from other table retrieved
- Additional rows added to results for non-matched rows
  - NULLs added in places where attributes do not match
- Example: Return all employees and for those who have taken orders, return the order amount. Employees without matching orders will display NULL for order amount.

> SELECT emp.FirstName, ord.Amount
> FROM HR.Employee AS emp
> LEFT [OUTER] JOIN Sales.SalesOrder AS ord
> ON emp.EmployeeID = ord.EmployeeID;

![image-20191218213436371](C:\Users\piotr\AppData\Roaming\Typora\typora-user-images\image-20191218213436371.png)

## Key Points and Additional Reading

### Key Points

- Use a Left Outer Join to include all rows from the first table and values from matched rows in the second table. Columns in the second table for which no matching rows exist are populated with NULLs.
- Use a Right Outer Join to include all rows from the second table and values from matched rows in the first table. Columns in the first table for which no matching rows exist are populated with NULLs.
- Use a Full Outer Join to include all rows from the first and second tables. Columns in the either table for which no matching rows exist are populated with NULLs.

### Additional Reading

Review the documentation on [Using Outer Joins](https://technet.microsoft.com/en-us/library/ms187518(v=sql.105).aspx) in SQL Server 2008 R2 Books Online.

## Cross Joins

- Combine each row from first table with each row from second table
- All possible combinations output
- Logical foundation for inner and other joins
  - Inner join starters with Cartesian product, add filter
  - Outer join takes Cartesian output, filtered, adds back non-matching rows (with NULL placeholders)
- Due to Cartesian product output, not typically a desired form of join
  - Some useful exceptions:
    - Table of numbers, generating data for testing

![image-20191218213908199](C:\Users\piotr\AppData\Roaming\Typora\typora-user-images\image-20191218213908199.png)

> SELECT emp.FirstName, prd.Name
> FROM HR.Employee AS emp
> CROSS JOIN Production.Product AS prd;

![image-20191218214651904](C:\Users\piotr\AppData\Roaming\Typora\typora-user-images\image-20191218214651904.png)

## Key Points and Additional Reading

### Key Points

- A cross join returns a Cartesian product that includes every combination of the selected columns from both tables.
- While not commonly used in typical application processing, cross joins can be useful in some specialized scenarios - such as generating test data.

### Additional Reading

Review the documentation on [Using Cross Joins](https://technet.microsoft.com/en-us/library/ms190690(v=sql.105).aspx) in SQL Server 2008 R2 Books Online.

## Self Joins

- Compare rows in same table to each other
- Create two instances of same table in FROM clause
  - At least one alias required
- Example: Return all employees and the name of the emplyee's manger

![image-20191218214834826](C:\Users\piotr\AppData\Roaming\Typora\typora-user-images\image-20191218214834826.png)

> SELECT emp.FirstName AS Employee, man.FirstName as Manager
> FROM HR.Employee AS emp
> LEFT JOIN HR.Employee AS man
> ON emp.ManagerID = man.EmployeeID;

![image-20191218214844187](C:\Users\piotr\AppData\Roaming\Typora\typora-user-images\image-20191218214844187.png)

## Key Points and Additional Reading

### KEY POINTS

- A self-join is an inner, outer, or cross join that matches rows in a table to other rows in the same table. 
- When defining a self-join, you must specify an alias for at least one instance of the table being joined.

### ADDITIONAL READING

Review the documentation on [Using Self-Joins](https://technet.microsoft.com/en-us/library/ms177490(v=sql.105).aspx) in SQL Server 2008 R2 Books Online.