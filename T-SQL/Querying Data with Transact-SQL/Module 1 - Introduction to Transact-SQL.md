# Module 1 

Getting Started with Transact-SQL

## Module Overview

- What is Transact-SQL?
- Relational Databases
- Schema and Object Names
- SQL Statements Types
- The SELECT Statement
- Working with Data Types
- Working with NULLs

### What is Transact-SQL?

**Structured Query Language(SQL)**

- developed by IBM in 1970s
- Adopted as standard by ANSI and ISO standards bodies
- Widely used in industry

**Microsoft implementation is transact-SQL**

- Referred to as T-SQL
- Query language for SQL server and Azure SQL Database

**SQL is declarative, not procedural**

- Describe what you want, don't specify steps

### Relational Databases

- Entities are represented as *relations* (tables), in which their attributes are represented as *domains* (columns)
- Most relational databases are *normalized*, with relationships defined between tables through *primary* are *foreign* keys

![image-20191207123506084](C:\Users\goto\AppData\Roaming\Typora\typora-user-images\image-20191207123506084.png)



### Sachems and Object Names

- Sachems are namespaces for database objects
- Fully-Qualified names:
  [server_name].[database_name].[schema_name].object_name
- Within database context, best practice is to include schema name:
  schema_name.object_name

![image-20191207124019181](C:\Users\goto\AppData\Roaming\Typora\typora-user-images\image-20191207124019181.png)



### SQL Statements Types

![image-20191207124137167](C:\Users\goto\AppData\Roaming\Typora\typora-user-images\image-20191207124137167.png)



## Key Points and Additional Reading

### Key Points

- Transact-SQL is the language used to query data in Microsoft SQL Server and Azure SQL Database.
- Data is stored in tables, which may be related to one another through common key fields.
- Objects in a database are organized into schemas.
- The fully qualified naming syntax for an object is *server_name*.*database_name*.*schema_name*.*object_name*, but in most cases you can abbreviate this to *schema_name.object_name.*

### Additional Reading

Throughout this course, links to specific sections in the Transact-SQL Reference documentation will be provided to supplement the course materials. Take a look at the [overview page](https://msdn.microsoft.com/en-us/library/bb510741.aspx) for this reference.

# The SELECT Statement 

![image-20191207130004280](C:\Users\goto\AppData\Roaming\Typora\typora-user-images\image-20191207130004280.png)



### Basic SELECT Query Examples

- All columns

  > SELECT * FROM Production.Product;

- Specific columns

  > SELECT Name, ListPrice
  > FROM Production.Product;

- Expressions and Aliases

  > SELECT Name AS Product, ListPrice * 0.9 AS SalePrice
  > FROM Production.Product;

## Key Points and Additional Reading

### Key Points

- Use the SELECT statement to retrieve a rowset of data from tables and views in a database.
- SELECT statements are written with the following clauses: SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY. However, the query engine processes the clauses in this order: FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY.
- In the SELECT clause, you can use * to return all columns, but generally you should specify explicit columns.
- You can specify expressions in the SELECT clause to return the results of calculations.
- You can use the AS keyword to specify aliases for columns in the rowset returned by the SELECT statement.

### Additional Reading

Review the documentation for [SELECT](https://msdn.microsoft.com/en-us/library/ms189499.aspx) in the Transact-SQL Reference.



# Working with Data Types

![image-20191207130729115](C:\Users\goto\AppData\Roaming\Typora\typora-user-images\image-20191207130729115.png)

- Implicit Conversion
  - Compatible data types can be automatically converted
- Explicit Conversion
  - Requires an explicit conversion function
    - CAST / TRY_CAST
    - CONVERT / TRY_CONVERT
    - PARSE / TRY_PARSE
    - STR

## Key Points and Additional Reading

### Key Points

- Transact-SQL supports a wide range of data types, which can be broadly categorized as **exact numeric**, **approximate numeric**, **character**, **date/time**, **binary**, and **other** (which includes specialized data types for handling data such as XML and spatial data).
- Some data types are compatible, and values can be implicitly converted between them. Conversion between other data types requires the use of explicit conversion functions.

### Additional Reading

Review the documentation for [Data Types](https://msdn.microsoft.com/en-us/library/ms187752.aspx) and  [Conversion Functions](https://msdn.microsoft.com/en-us/library/hh231076.aspx) in the Transact-SQL Reference.



# Working with NULLs

**NULL represents a missing or unknown value**

**ANSI behavior for NULL values:**

- The result of any expression containing a NULL value is NULL
  - 2+NULL = NULL
  - "Mystring"+NULL = NULL
- Equality comparisons always return false for NULL values
  - NULL = NULL return *false*
  - NULL is NULL return *true* 

- ISNULL(column/variable, value)
  - Returns value if the column or variable is NULL

- NULLIF(column/variable, value)
  - Returns NULL if the column or variable is value
- COALESCE (columns/variable1, column/variable2,..)
  - Returns the value of the first non-null column or variable in the list

## Key Points and Additional Reading

### Key Points

- NULL is used to indicate an unknown or missing value. NULL is **not** equivalent to zero or an empty string.
- Arithmetic or string concatenation operations involving one or more NULL operands return NULL. For example, 12 + NULL = NULL.
- If you need to compare a value to NULL, use the **IS** operator instead of the **=** operator. 
- The **ISNULL** function returns a specified alternative value for NULL columns and variables.
- The **NULLIF** function returns NULL when a column or variable contains a specified value.
- The **COALESCE** function returns the first non-NULL value in a specified list of columns or variables).

### Additional Reading

Review the documentation for the [ISNULL](https://msdn.microsoft.com/en-us/library/ms184325.aspx) function and [Expressions](https://msdn.microsoft.com/en-us/library/ms190286.aspx) in the Transact-SQL Reference.