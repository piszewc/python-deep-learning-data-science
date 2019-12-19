# Module 4: Using Set Operators



## UNION Queries

- UNION returns a result set of distinct rows combined from all statements

- UNION removes duplicates during query processing (affects performance)

- UNION ALL retains duplicates during query processing

  > -- only distinct rows from both queries are returned
  > SELECT countryregion, city FROM HR.Employees
  > UNION
  > SELECT countryregion, city FROM Sales.Customers;

![image-20191219215405251](C:\Users\piotr\AppData\Roaming\Typora\typora-user-images\image-20191219215405251.png)

UNION Guidelines 

- Column aliases
  - Must be expresses in first query
- Number of columns
  - Must be the same 

## Key Points and Additional Reading

### Key Points

- Use UNION to combine the rowsets returned by mulitple queries.
- Each unioned query must return the same number of columns with compatible data types.
- By default, UNION eliminates duplicate rows. Specify the ALL option to include duplicates (or to avoid the overhead of checking for duplicates when you know in advance that there are none). 

### Additional Reading

Review the documentation on [UNION](https://msdn.microsoft.com/en-us/library/ms180026.aspx) in the Transact-SQL Reference.



## INTERSECT and EXCEPT Queries

What are INTERSECT Queries?

- INTERSECT returns only distinct rows that appear in both results sets

  > -- only rows that exist in both queries will be returned
  > SELECT countryregion, city FROM HR.Employees
  > INTERSECT
  > SELECT countryregion, city FROM  Sales.Customers;

![image-20191219223009111](C:\Users\piotr\AppData\Roaming\Typora\typora-user-images\image-20191219223009111.png)

What are EXCEPT Queries?

- EXCEPT returns only distinct rows that appear in the first set but not the second

  - Order in which sets are specified matters

    > -- only rows from Employees will be returned
    > SELECT countryregion, city FROM HR.Employees 
    > EXCEPT 
    > SELECT countryregion, city FROM Sales.Customers;

![image-20191219223253973](C:\Users\piotr\AppData\Roaming\Typora\typora-user-images\image-20191219223253973.png)

## Key Points and Additional Reading

### Key Points

- Use INTERSECT to return only rows that are returned by both queries.
- Use EXCEPT to return rows from the first query that are not returned by the second query.

### Additional Reading

Review the documentation on [EXCEPT and INTERSECT](https://msdn.microsoft.com/en-us/library/ms188055.aspx) in the Transact-SQL Reference.