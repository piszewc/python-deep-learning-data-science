# Module 9: Modifying Data 

### Overview of Modifying Data

Module Overview 

- Inserting Data into Tables
- Generating Identifiers
- Updating Data in Tables
- Deleting Data in Tables

## Inserting Data into Tables

- INSERT ... VALUES
  - Inserts explicit values
  - You can omit identity columns, columns that allow NULL, and columns with default constraints. 
  - You can also explicitly specify NULL and DEFAULT 

- INSERT ... SELECT / INSERT ... EXEC 
  - Inserts the results returned by the query or stored procedure into an existing table 
- SELECT .... INTO
  - Creates a new table from the results of a query
  - Not currently supported in Azure SQL Database 

### Generating Identifiers

#### Using Identity Columns

- IDENTITY property of a column generates sequential numbers automatically for insertion into a table

  - Can specify optional seed and increment values

  - Use system variables and functions to return last inserted identity:

    - @@IDENTITY: The last identity generated in the session

    - SCOPE_IDENTITY(): The last identity generated in the current scope 

    - IDENT_CURRENT('<table_name>'): the last identity inserted into a table

      > INSERT INTO Sales.Orders (CustomerID, Amount)
      > VALUES
      > (12, 2056.99);
      > ....
      > SELECT SCOPE_IDENTITY() AS OrderID;

#### Using Sequences

- Sequences are objects that generate sequential numbers

  - Supported in SQL Server 2012 and later

  - Exist independently of tables, so offer greater flexibility than identity

  - Use SELECT NEXT VALUE FOR to retrieve the  next sequential number

    - Can be set as the default value for a column

      > CREATE SEQUENCE Sales.OrderNumbers AS INT
      > START WITH 1 INCREMENT BY 1;
      > ...
      > SELECT NEXT VALUE FOR Sales.OrderNumber;

## Key Points and Additional Reading

### Key Points

- Use the INSERT statement to insert one or more rows into a table.
- When inserting explicit values, you can omit identity columns, columns that allow NULLs, and columns on which a default constraint is defined.
- Identity columns generate a unique integer identifier for each row. You can also use a *sequence* to generate unique values that can be used in multiple tables.

### Additional Reading

Review the documentation on [INSERT](https://msdn.microsoft.com/en-us/library/ms174335.aspx), [IDENTITY](https://msdn.microsoft.com/en-us/library/ms186775.aspx) in the Transact-SQL Language Reference, and [Sequence Numbers](https://msdn.microsoft.com/en-us/library/ff878058.aspx) in SQL Server Books Online.

## Updating and Deleting Data

### The UPDATE Statement

- Updates all rows in a table or view 

  - Set can be filtered with a WHERE clause
  - Set can be defined with FROM clause

  > UPDATE Production.Product
  > SET unitprice = (unitprice * 1.04)
  > WHERE categoryid = 1 AND discontinued  = 0; 

### The MERGE Statement

- MERGE modifies data based on a condition 

  - When the source matches the target
  - When the source has no match in the target
  - When the target as no match in the source

  > MERGE INTO Production.Product as P
  >
  > ​	USING Production.ProductsStaging as S
  > ​	ON P.ProductID = S.ProductID
  >
  > WHEN MATCHED THEN
  >
  > ​	UPDATE SET
  > ​	P.UnitPrice = S.UnitPrice, P.Discontunued = S.Discontinued
  >
  > WHEN NOT MATCHED THEN 
  >
  > ​	INSERT (PrductName, CategoryID, UnitPrice, Discontinued)
  > ​	VALUES (S.ProductName, S.CategoryID, S.UnitPrice, S.Discontinued)

### Deleting Data From a Table

- DELETE without a WHERE clause deletes all rows

  - Use a WHERE clause to delete specific rows

    > DELETE FROM Sales.OrderDetails
    > WHERE orderid = 20248;

- TRUNCATE TABLE clears the entire table
  - Storage physically deallocated, rows not individually removed 
  - Minimally logged
  - Can be rolled back if TRUNCATE issued within a transaction
  - TRUNCATE TABLE Will fail if the table is referenced by a foreign key constraint in another table

## Key Points and Additional Reading

### Key Points

- Use the UPDATE statement to modify the values of one or more columns in specified rows of a table.
- Use the DELETE statement to delete specified rows in a table.
- Use the MERGE statement to insert, update, and delete rows in a target table based on data in a source table.

### Additional Reading

Review the documentation on [UPDATE](https://msdn.microsoft.com/en-us/library/ms177523.aspx), [DELETE](https://msdn.microsoft.com/en-us/library/ms189835.aspx), and [MERGE](https://msdn.microsoft.com/en-us/library/bb510625.aspx) in the Transact-SQL Language Reference.

