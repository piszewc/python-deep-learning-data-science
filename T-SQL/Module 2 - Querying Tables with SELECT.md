# Module 2: Querying Tables with SELECT 

## Removing Duplicates

### SELECT ALL

- Default behavior includes duplicates

  > SELECT Color
  >
  > FROM Production.Product;

  | Color  |
  | ------ |
  | Blue   |
  | Red    |
  | Yellow |
  | Blue   |
  | Black  |
  | Yellow |

### SELECT DISTINCT

- Removes duplicates

  > SELECT DISTINCT Color
  >
  > FROM Production.Product;

  | Color  |
  | ------ |
  | Blue   |
  | Red    |
  | Yellow |
  | Black  |



## Sorting Result

### Use ORDER BY to sort result by one or more columns

- Aliases created in SELECT clause are visible to ORDER BY

- You can order by columns in the source that are not included in the SELECT clause

- You can specify ASC or DESC (ASC are by default)

  > SELECT ProductCategory AS Category, ProductName
  >
  > FROM Production.Product
  >
  > ORDER BY Category, Price DESC;

## Limiting Sorted Results

TOP allows you to limit the number or percentage of rows returned by a query

Works with ORDER BY clause to limit rows by sort order

Added to SELECT clause:

- SELECT TOP (N) | TOP (N) Percent

  - with percent, umber of rows rounded up

- SELECT TOP (N) WITH TIES

  - Retrieve duplicates where applicable (nondeterministic)

  > SELECT TOP 10 ProductName, ListPrice
  >
  > FROM Production.Product
  >
  > ORDER BY ListPrice DESC;

### Paging Through Results 

OFFSET-FETCH is an extension to the ORDER BY clause:

- Allows filtering a requested range of rows
  - Dependent on ORDER BY clause
- Provides a mechanism for paging through results
- Specify number of rows to skip, number or rows to retrive:

> ORDER BY <order_by_list>
>
> OFFSET <offset_value> ROW(S)
>
> FETCH FIRST|NEXT <fetch_value> ROW(S) ONLY

## Key Points and Additional Reading

### Key Points

- By default, the SELECT statement returns all rows. If mulitple rows contain the same values for every column, they are duplicated in the results. Using the DISTINCT keyword eliminates duplicates, ensuring that only one row for each distinct combination of column values is returned.
- The order of rows in the result of a SELECT statement is not guaranteed unless you explicitly specify one or more columns in an ORDER BY clause. You can specify sort direction as ASC (the default) or DESC.
- You can combine the ORDER BY clause with the TOP keyword to retrict the results so that they include only the top *n* rows (where n is the number or percentage of rows you want to return).
- You can implement a query to retrieve a specified "page" of results by using the OFFSET and FETCH keywords with the ORDER BY clause.

### Additional Reading

Review the documentation for the [SELECT](http://msdn.microsoft.com/en-us/library/ms189499.aspx) and [ORDER BY](https://msdn.microsoft.com/en-us/library/ms188385.aspx) clauses in the Transact-SQL Reference.

### Filtering and Using Predicates

- Specify predicates in the WHERE clause

  ![image-20191217222120513](C:\Users\goto\AppData\Roaming\Typora\typora-user-images\image-20191217222120513.png)

## Key Points and Additional Reading

### Key Points

- Use the WHERE clause to filter the results returned by a SELECT query based on a search condition.
- A search condition is composed of one or more predicates.
- Predicates include conditional operators (such as =, >, and <), IN, LIKE, and NOT.
- You can use AND and OR to combine predicates based on Boolean logic.

### Additional Reading

Reviwe the documentation for [WHERE](https://msdn.microsoft.com/en-us/library/ms188047.aspx) and [Search Condition](https://msdn.microsoft.com/en-us/library/ms173545.aspx) in the Transact-SQL Reference.

## Summary

Querying Tables with SELECT

- Removing Duplicates
- Sorting Results
- Paging Sorted Results
- Filtering and Using Predicates

