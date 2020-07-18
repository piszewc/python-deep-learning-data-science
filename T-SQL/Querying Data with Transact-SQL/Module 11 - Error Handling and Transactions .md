# Module 11: Error Handling and Transactions 

Module Overview

- Error and Errors Messages
- Raising Errors
- Catching and Handling Errors
- Introduction to Transactions 
- Implementing Explicit Transactions

## Errors and Errors Messages

![image-20191225193713767](C:\Users\goto\AppData\Roaming\Typora\typora-user-images\image-20191225193713767.png)

In SQL Server (not Azure SQL Database):

- Errors messages are in sys.messages
- You can add customer messgaes using sp_addmessage

## Raising Errors

- The RAISERROR Command

  - Reise a user-defined errorin sys.messages (SQL Srver only)

  - Reise an explicit error message, severity, and state (SQL Server and Azure SQL Database)

    > RAISERROR('An Error Occurred', 16, 0);

- The THROW Command

  - Replacement for RAISERROR
  - Throw explicit error number, message, and state (severity is 16)
  - Re-throw existing error

  > THROW 50001, 'An Error Occurred',0;

## Key Points and Additional Reading

### Key Points

- System errors have pre-defined numbers, messages, severity levels, and other characteristics that you can use to troubleshoot issues.
- You can use RAISERROR and THROW to raise custom errors.

### Additional Reading

Review the documentation on [RAISERROR](https://msdn.microsoft.com/en-us/library/ms178592.aspx) and [THROW](https://msdn.microsoft.com/en-us/library/ee677615.aspx) in the Transact-SQL Language Reference.

## Catching and Handling Errors

- Use a TRY ... CATCH Block
- Handle errors in the CATCH block 
  - Get error information:
    - @@ERROR
    - ERROR_NUMBER()
    - ERROR_MESSAGE()
    - ERROR_SEVERITY()
    - ERROR_STATE()
    - ERROR_PROCEDURE()
    - ERROR_LINE()
  - Execute custom correction or logging code
  - Re-throw the orginal error, or throw a custom error

> DECLARE @Discount INT = 0;
> BEGIN TRY
>
> ​	UPDATE Production.Product
> ​	SET Price = Price /@Discount
>
> END TRY
> BEFIN CATCH
> 	PRINT ERROR_MESSAGE();
> 	THROW 50001, 'An error occurred', 0;
> END CATCH;

## Key Points and Additional Reading

### Key Points

- Use TRY...CATCH blocks in your Transact-SQL code to catch and handle exceptions.
- A common exception handling pattern is to log the error, and then if the operation cannot be completed successfully, throw it (or a new custom error) to the calling application.

### Additional Reading

Review the documentation on [TRY...CATCH](https://msdn.microsoft.com/en-us/library/ms175976.aspx) in the Transact-SQL Language Reference.

## Transactions

Introduction to Transactions

- A transaction is a group of tasks defining a unit of work

- The entire unit must succeed of fail together - no partial completion is permitted

  > --Two tasks that make up a unit of work
  > INSERT INTO Sales.Order ...
  > INSERT INTO Sales.OrderDetail ...

- Individual data modification statements are automatically treated as standalone transactions

- SQL Server uses locking mechanisms and the transaction log to support transactions

Implementing Explicit Transactions

- Use BEGIN TRANSACTION to start a transaction

- USE COMMIT TRANSATION to complete a transaction

- USE ROLLBACK TRANSACTION to cancel a transaction

  - Or enable XACT_ABORT to automatically rollback on error

    > BEGIN TRY
    >
    > ​	BEGIN TRANSACTION
    > ​		INSERT INTO Sales.Order...
    > ​		INSERT INTO Sales.OrderDetail...
    > ​	COMMIT TRANSACTION
    > END TRY
    >
    > BEGIN CATCH
    > 	IF @@TRANCOUNT > 0 
    > 	BEGIN
    > 		ROLLBACK TRANSACTION
    > 	END
    > 	PRINT ERROR_MESSAGE();
    > 	THROW 50001, 'An error occurred', 0;
    > END

## Key Points and Additional Reading

### Key Points

- Transactions are used to protect data integrity by ensuring that all data changes within a transaction succeed or fail as a unit.
- Individual Transact-SQL statements are inherently treated as transactions, and you can define explicit transactions that encompass mulitple statements.
- Use the BEGIN TRANSACTION, COMMIT TRANSACTION, and ROLLBACK TRANSACTION statements to manage transactions.
- Enable the XACT_ABORT option to automatically rollback all transactions if an exception occurs.
- Use the @@TRANCOUNT system variable and XACT_STATE system function to determine transaction status.

### Additional Reading

Review the documentation on [Transaction Statements](https://msdn.microsoft.com/en-us/library/ms174377.aspx), [@@TRANCOUNT](https://msdn.microsoft.com/en-us/library/ms187967.aspx), and [XACT_STATE](https://msdn.microsoft.com/en-us/library/ms189797.aspx) in the Transact-SQL Language Reference.

For a detailed explanation of how the transaction log is used for data updates and recovery, see the Technet Magazine article [Understanding Logging and Recovery in SQL Server](https://technet.microsoft.com/en-us/magazine/2009.02.logging.aspx) by Paul S. Randall.