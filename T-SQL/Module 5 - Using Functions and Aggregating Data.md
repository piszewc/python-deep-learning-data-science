# Module 5: Using Functions and Aggregating Data



## Introduction to Functions

## Module Overview

- Introduction to Built-In Functions

- Scalar Functions 
- Aggregate Functions
- Logical Functions
- Windows Functions
- Grouping with GROUP BY 
- Filtering with HAVING

Introduction to Built-In Functions

![image-20191219224107964](C:\Users\piotr\AppData\Roaming\Typora\typora-user-images\image-20191219224107964.png)

## Scalar Functions

- Operate on elements from single row as inputs, return a single value as outpu
- Return a single (scalar) value
- Can be used like an express queries
- May be deterministic or non-deterministic

![image-20191219225240193](C:\Users\piotr\AppData\Roaming\Typora\typora-user-images\image-20191219225240193.png)



## Logical Functions

Output is determined by comparative logic

- ISNUMERIC

  > SELECT ISNUMERIC('101.99') AS Is_a_Number;

- IIF

  > SELECT productid, listprice, IIF(listprice > 50, 'high','low') AS PricePoint FROM Production.Product;

- CHOOSE

  > SELECT ProductName, Color, Size,
  > 	CHOOSE (ProductCategoryID, 'Bikers','Components', 'Clothing', 'Accessories') AS Category
  > FROM Production.Product;

## Window Functions

- Functions applied to a window, or set or rows

- Include ranking, offset, aggregate and distribution functions

  > SELECT TOP(3) ProductID, Name, ListPrice, Rank() OVER(ORDER BY ListPrice DESC) AS RankByPrice
  > FROM Production.Product
  > ORDER BY RankByPrice; 

![image-20191219225540467](C:\Users\piotr\AppData\Roaming\Typora\typora-user-images\image-20191219225540467.png)

## Aggregate Functions

- Functions that operate on sets, or rows of data

- Summarize input rows

- Without GROUP BY clause, all rows are arranged as one group

  > SELECT COUNT() AS OrderLines, SUM(OrderQtyUnitPrice) AS TotalSales
  > FROM Sales.OrderDetail;

  ![image-20191219225811683](C:\Users\piotr\AppData\Roaming\Typora\typora-user-images\image-20191219225811683.png)

## Key Points and Additional Reading

### Key Points

- Scalar functions return a single value based on zero or more input parameters.
- Logical functions return Boolean values (true or false) based on an expression or column value.
- Window functions are used to rank rows across partitions or "windows". Window functions include RANK, DENSE_RANK, NTILE, and ROW_NUMBER.
- Aggregate functions are used to provide summary values for mulitple rows - for example, the total cost of products or the maximum number of items in an order. Commonly used aggregate functions include SUM, COUNT, MIN, MAX, and AVG.

### Additional Reading

Review the documentation on [Built-In Functions](https://msdn.microsoft.com/en-us/library/ms174318.aspx) in the Transact-SQL Reference.

## Grouping with GROUP BY

- GROUP BY creates groups for output rows, according to a unique combination of values specified in the GROUP BY clause

- GROUP BY calculates a summary value for aggregate functions in subsequent phases

- Details rows are 'lost' after GROUP BY clause is processes

  > SELECT CustomerID, COUNT(*) AS Order
  > FROM Sales.SalesOrderHeader
  > GROUP BY CustomerID;

### Filtering with HAVING

- HAVING clause provides a search condition that each group must satisfy

- WHERE clause is processes before GROUP BY, HAVING clause is processes after GROUP BY

  > SELECT CustomerID, COUNT(*) AS Orders 
  > FROM Sales.SalesOrderHeader
  > GROUP BY CustomerID
  > GAVING COUNT() > 10;

## Key Points and Additional Reading

### Key Points

- You can use GROUP BY with aggregate functions to return aggregations grouped by one or more columns or expressions.
- All columns in the SELECT clause that are not aggregate function expressions must be included in a GROUP BY clause.
- The order in which columns or expressions are listed in the GROUP BY clause determines the grouping hierarchy.
- You can filter the groups that are included in the query results by specifying a HAVING clause.

### Additional Reading

Review the documentation on [GROUP BY](https://msdn.microsoft.com/en-us/library/ms177673.aspx) and [HAVING](https://msdn.microsoft.com/en-us/library/ms180199.aspx) in the Transact-SQL Reference

*Note that this module has discussed only simple GROUP BY queries. General GROUP BY clauses that include grouping sets, ROLLUP, or CUBE operators are covered later in the course.*