# Module 4: Using Set Operators



## UNION Queries

- UNION returns a result set of distinct rows combined from all statements

- UNION removes duplicates during query processing (affects performance)

- UNION ALL retains duplicates during query processing

  > -- only distinct rows from both queries are returned
  > SELECT countryregion, city FROM HR.Employees
  > UNION
  > SELECT countryregion, city FROM Sales.Customers;

