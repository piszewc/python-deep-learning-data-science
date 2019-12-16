# Module 2: Querying Tables with SELECT 

## Removing Duplicates

- SELECT ALL

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

- SELECT DISTINCT

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

- Use ORDER BY to sort result by one or more columns

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

## Paging Through Results 

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