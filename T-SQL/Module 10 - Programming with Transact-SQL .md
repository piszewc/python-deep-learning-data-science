# Module 10: Programming with Transact-SQL 

Module Overview

- Batches 
- Comments
- Variables
- Conditional Branching
- Loops
- Stored Procedures



### Batches

- Batches are sets of commands send to SQL Server as a unit.

- Batches determine variable scope, name resolution

- To seperate statements into batches, use separator:

  - SQL Server tools use the GO keyword
  - GO is not a T-SQL command!
  - GO [count] executes the batch the specified number of times

  > SELECT * FROM Production.Product;
  > SELECT * FROM Sales.Customer;
  > GO

### Comments

- Mark T-SQL code as comment:
  - For a block, enclose it between /* and */ characters

![image-20191225134547029](C:\Users\goto\AppData\Roaming\Typora\typora-user-images\image-20191225134547029.png)

- For inline text, precede the comments with -- 

![image-20191225134650057](C:\Users\goto\AppData\Roaming\Typora\typora-user-images\image-20191225134650057.png)

### Variables

- Variables are ojects that allow storage of a value for use later in the same batch

- Variables are defined with the DECLARE keyword

  - Variables can be declared and initialized in the same statement

    > -- Declare and initialize variables
    > DECLARE @color nvarchar(15) ='Black', @size nvarchar(5) = 'L';
    >
    > -- Use variables in statements 
    > SELECT *
    > 	FROM Production.Product
    > 	WHERE Color=@color and Size = @size;
    > GO

## Key Points and Additional Reading

### Key Points

- A batch defines a group of Transact-SQL command submitted by a client application for execution. Some commands can only be executed at the start of a new batch, and variable values cannot span batches.
- Use comments to document your Transact-SQL code. Inline comments are prefixed by --, and multi-line comment blocks are enclosed in /* and */.
- Declare variables by using the DECLARE keyword, specifying a name (prefixed with @) and a data type. You can optionally assign an initial value.
- Assign values to variables by using the SET keyword or in a SELECT statement.

### Additional Reading

Review the documentation on [--](https://msdn.microsoft.com/en-us/library/ms181627.aspx), [/*..*/](https://msdn.microsoft.com/en-us/library/ms178623.aspx), and [Variables](https://msdn.microsoft.com/en-us/library/ff848809.aspx) in the Transact-SQL Language Reference.

### Conditional Branching

- IF ... ELSE uses a predicate to determine the flow of the code

  - The code in the IF block is execured if the predicate evalues to TRUE

  - The code in the ELSE block is executed if the predicate evaluates to FALSE or UNKNOWN

    > IF @color is NULL
    >
    > ​		SELECT * FROM Production.Product;
    > ELSE 
    >
    > ​		SELECT * FROM Production.Product
    > ​		WHERE Color = @color;

## Key Points and Additional Reading

### Key Points

- Use the IF keyword to execute a task based on the results of a conditional test.
- Use an ELSE clause if you need to execute an alternative task if the conditional test returns false.
- Enclose mulitple statements in an IF or ELSE clause between BEGIN and END keywords.

### Additional Reading

Review the documentation on I[F...ELSE](https://msdn.microsoft.com/en-us/library/ms182717.aspx) and [BEGIN...END](https://msdn.microsoft.com/en-us/library/ms190487.aspx) in the Transact-SQL Language Reference.

## Looping

- WHILE enables code to execute in a loop

- Statements in the WHILE block repeat as the predicate evaluates to TRUE

- The loop ends when the predicate evaluates to FALSE or UNKNOWN

- Execution can be altered by BREAK or CONTINUE

  > DECLARE @custid AS INT = 1 , @IName as NVARCHAR(20);
  > WHILE @custid <=5 
  > 	BEGIN
  >
  > ​		SELECT @Iname = lastname FROM Sales.Customer
  > ​		WHERE customerid = @cutid;
  > ​		PRINT @Iname;
  > ​		SET @custid +=1;
  >
  > ​	END

## Key Points and Additional Reading

### Key Points

- Use a WHILE loop if you need to repeat one or more statements until a specified condition is true.
- Use BREAK and CONTINUE to exit or restart the loop.
- Avoid using loops to iteratively update or retrieve single records - in most cases, you should use set-based operations to retrieve and modify data.

### Additional Reading

Review the documentation on [WHILE](https://msdn.microsoft.com/en-us/library/ms178642.aspx), [BREAK](https://msdn.microsoft.com/en-us/library/ms181271.aspx), and [CONTINUE](https://msdn.microsoft.com/en-us/library/ms174366.aspx) in the Transact-SQL Language Reference.

## Stored Procedures

Stored Procedures

- Database objects that encapsulate Transact-SQL code

- Can be parameterized

  - Input parameters

  - Output parameters

    > CREATE PROCEDURE SalesLT.GetProductsByCategory (@Category INT = NULL)
    >
    > AS
    >
    > IF @CategoryID IS NULL
    > 	SELECT ProductID, Name, Color,Size, ListPrice
    > 	FROM SalesLT.Product
    > ELSE
    >
    > ​	SELECT ProductID, Name, Color, Size, ListPrice
    > ​	FROM SalesLT.Product
    > ​	WHERE ProductCategoryID = @CategoryID;

- Executed with the EXECURE command

  > EXECURE SalesLT.GetProductsByCategory 6;

## Key Points and Additional Reading

### Key Points

- Use stored procedures to encapsulate Transact-SQL code in a reusable database objects.
- You can define parameters for a stored procedure, and use them as variables in the Transact-SQL code it contains.
- Stored procedures can return rowsets (usually the results of a SELECT statement). They can also return output parameters, and they always return a *return value*, which is used to indicate status.

### Additional Reading

Review the documentation on [Stored Procedures](https://msdn.microsoft.com/en-us/library/ms190782.aspx) in SQL Server Books Online.

