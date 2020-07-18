## Overview of Grouping Sets and Pivoting Data

## Module Overview

- Grouping Sets
- ROLLUP and CUBE
- Identifying Groupings in Results
- Pivoting Data
- Using PIVOT and UNPIVOT 

## Grouping Sets

#### Syntax

- GROUPING SETS subclause builds on GROUPING BY clause

- Allows multiple groupings to be defined in same query

  > SELECT <column list with aggregate(s)>
  > FROM <source>
  > GROUP BY 
  > GROUPING SETS
  > (
  >
  > <column_name>, --one or more columns
  >
  > <column_name>, --one or more columns
  >
  > () -- empty parantheses if aggregating all rows
  > );

#### Grouping Sets
Example

> SELECT EmployeeID, CustomerID, SUM(Amount) AS TotalAmount
> FROM Sales.SalesOrder
> GROUP BY 
> GROUPING SETS(EmployeeID, CustomerID, ());

![image-20191221222206252](C:\Users\goto\AppData\Roaming\Typora\typora-user-images\image-20191221222206252.png)

### ROLLUP and CUBE 

- ROLLUP provides shortcut for defining grouping sets with combinations that assume input columns form a hierarchy

  > SELECT StateProvince, City, COUNT(CustomerID) AS Customers
  > FROM Sales.vCustomerDetails
  > GROUP BY ROLLUP(StateProvince, City)
  > ORDER BY StateProvince, City;

- CUBE provides shortcut for defining grouping sets in which all possible combinations of grouping sets created

  > SELECT SalesPersonName, CustomerName, SUM(Amount) AS TotalAmount
  > FROM Sales.vSalesOrders
  > GROUP BY CUBE(SalesPersonName, CustomerName)
  > ORDER BY SalesPersonName, CustomerName;

**Identifying Groups in Results**

- Multiple grouping sets present a problem in identifying the source of each row in the result set

- NULL could come from the source data or could be a pleaceholder in the grouping sets

- The GROUPING_ID function provides method to mark a row with a 1 or 0 to identify which grouping set for the row

  > SELECT GROUPING_ID(SalesPersonName) AS SalesPersonGroup, 
  > 	GROUPING_ID(CustomerName) AS CustomerGroup,
  > 	SalesPersonName, CustomerName, SUM(Amounth) AS TotalAmount
  > FROM Sales.vSalesOrders
  > GROUP BY CUBE(SalesPersonName, CustomerName)
  > ORDER BY SalesPersonName, CustomerName;

## Key Points and Additional Reading

### Key Points

- Use GROUPING SETS to define custom groupings.
- Use ROLLUP to include subtotals and a grand total for hierarchical groupings.
- Use CUBE to include all possible groupings.

### Additional Reading

Review the documentation on [GROUP BY](https://msdn.microsoft.com/en-us/library/ms177673.aspx) in the Transact-SQL Language Reference.



## Unpivoting Data

- Unpivoting data is rotating data from a columns-based orientation to a rows-based orientation
- Spreads or splits value from one source row into one or more targets rows
- Each source row becomes one or more rows in result set based on number of columns being pivoted

![image-20191221223658640](C:\Users\goto\AppData\Roaming\Typora\typora-user-images\image-20191221223658640.png)

## Pivoting Data

- Pivoting data is rotating data from a rows-based orientation to a columns-based orientation 
- Distinct values from a single column are projected across as headings for other columns - may included aggregation

![image-20191221223908954](C:\Users\goto\AppData\Roaming\Typora\typora-user-images\image-20191221223908954.png)

## Key Points and Additional Reading

### Key Points

- Use PIVOT to re-orient a rowset by generating multiple columns from values in a single column.
- Use UNPIVOT to re-orient multiple columns in a an existing row set into a single column.

### Additional Reading

Review the documentation on [Using PIVOT and UNPIVOT](https://technet.microsoft.com/en-us/library/ms177410(v=sql.105).aspx) in SQL Server 2008 R2 Books Online