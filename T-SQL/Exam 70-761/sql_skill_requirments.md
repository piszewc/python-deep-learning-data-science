## Basics

1. `SELECT`ing columns from a table
2. Aggregates Part 1: `COUNT`, `SUM`, `MAX`/`MIN`
3. Aggregates Part 2: `DISTINCT`, `GROUP BY`, `HAVING`

## Intermediate

1. JOIN`s, ANSI-89 and ANSI-92 syntax
2. `UNION` vs `UNION ALL`
3. `NULL` handling: `COALESCE` & Native NULL handling
4. Subqueries: `IN`, `EXISTS`, and inline views
5. Subqueries: Correlated
6. `WITH` syntax: Subquery Factoring/CTE
7. Views

## Advanced Topics

- Functions, Stored Procedures, Packages
- Pivoting data: CASE & PIVOT syntax
- Hierarchical Queries
- Cursors: Implicit and Explicit
- Triggers
- Dynamic SQL
- Materialized Views
- Query Optimization: Indexes
- Query Optimization: Explain Plans
- Query Optimization: Profiling
- Data Modelling: Normal Forms, 1 through 3
- Data Modelling: Primary & Foreign Keys
- Data Modelling: Table Constraints
- Data Modelling: Link/Corrollary Tables
- Full Text Searching
- XML
- Isolation Levels
- Entity Relationship Diagrams (ERDs), Logical and Physical
- Transactions: `COMMIT`, `ROLLBACK`, Error Handling



# SQL Practices

## 1. Define business requirements first

We’ve covered best practices to define business requirements for BI elsewhere. Definitely make sure you’re applying those practices when optimizing SQL queries, including:

- **Identify relevant stakeholders.** Make sure all necessary parties are in the discussion to develop your query. When querying production databases, make sure the DBA team is included.
- **Focus on business outcomes.** Give the query a definite and unique purpose. Taxing the production database for exploratory or duplicative reports is an unnecessary risk.
- **Frame the discussion for optimal requirements.** Define the function and scope of the report by identifying its intended audience. This will focus the query on the tables with the correct level of detail.
- **Ask great questions.** Follow the 5 W’s: Who? What? Where? When? Why?
- **Write very specific requirements and confirm them with stakeholders.** The performance of the production database is too critical to have unclear or ambiguous requirements. Make sure the requirements are as specific as possible and confirm the requirements with all stakeholders before running the query.

## 2. SELECT fields instead of using SELECT *

When running exploratory queries, many SQL developers use **SELECT \*** (read as “select all”) as a shorthand to query all available data from a table. However, if a table has many fields and many rows, this taxes database resources by querying a lot of unnecessary data.

Using the **SELECT** statement will point the database to querying only the data you need to meet the business requirements. Here’s an example where the business requirements request mailing addresses for customers.

**Inefficient:**

```
SELECT *
FROM Customers
```

This query may pull in other data also stored in the customer table, such as phone numbers, activity dates, and notes from sales and customer service.

**Efficient:**

```
SELECT FirstName, LastName, Address, City, State, Zip
FROM Customers
```

This query is much cleaner and only pulls the required information for mailing addresses.

To keep an index of all tables and field names, run a query from a system table such as INFORMATION_SCHEMA or ALL_TAB_COLUMNS (for MS SQL Server,

## 3. Avoid SELECT DISTINCT

**SELECT DISTINCT** is a handy way to remove duplicates from a query. **SELECT DISTINCT** works by **GROUP**ing all fields in the query to create distinct results. To accomplish this goal however, a large amount of processing power is required. Additionally, data may be grouped to the point of being inaccurate. To avoid using **SELECT DISTINCT**, select more fields to create unique results.

**Inefficient and inaccurate:**

```
SELECT DISTINCT FirstName, LastName, StateFROM Customers
```

This query doesn’t account for multiple people in the same state having the same first and last name. Popular names such as David Smith or Diane Johnson will be grouped together, causing an inaccurate number of records. In larger databases, a large number of David Smiths and Diane Johnsons will cause this query to run slowly.

**Efficient and accurate:**

```
SELECT FirstName, LastName, Address, City, State, ZipFROM Customers
```

By adding more fields, unduplicated records were returned without using SELECT DISTINCT. The database does not have to group any fields, and the number of records is accurate.

## 4. Create joins with INNER JOIN (not WHERE)

Some SQL developers prefer to make joins with **WHERE** clauses, such as the following:

```
SELECT Customers.CustomerID, Customers.Name, Sales.LastSaleDate
FROM Customers, Sales
WHERE Customers.CustomerID = Sales.CustomerID
```

This type of join creates a Cartesian Join, also called a Cartesian Product or **CROSS JOIN**.

In a Cartesian Join, all possible combinations of the variables are created. In this example, if we had 1,000 customers with 1,000 total sales, the query would first generate 1,000,000 results, then filter for the 1,000 records where CustomerID is correctly joined. This is an inefficient use of database resources, as the database has done 100x more work than required. Cartesian Joins are especially problematic in large-scale databases, because a Cartesian Join of two large tables could create billions or trillions of results.

To prevent creating a Cartesian Join, use **INNER JOIN** instead:

```
SELECT Customers.CustomerID, Customers.Name, Sales.LastSaleDateFROM Customers  INNER JOIN Sales  ON Customers.CustomerID = Sales.CustomerID
```

The database would only generate the 1,000 desired records where CustomerID is equal.

Some DBMS systems are able to recognize **WHERE** joins and automatically run them as **INNER JOIN**s instead. In those DBMS systems, there will be no difference in performance between a **WHERE** join and **INNER JOIN**. However, **INNER JOIN** is recognized by all DBMS systems. Your [DBA](https://www.sisense.com/blog/the-6-functions-of-a-data-team/) will advise you as to which is best in your environment.

## 5. Use WHERE instead of HAVING to define filters

The goal of an efficient query is to pull only the required records from the database. Per the SQL Order of Operations, **HAVING** statements are calculated after WHERE statements. If the intent is to filter a query based on conditions, a WHERE statement is more efficient.

For example, let’s assume 200 sales have been made in the year 2016, and we want to query for the number of sales per customer in 2016.

```
SELECT Customers.CustomerID, Customers.Name, Count(Sales.SalesID)
FROM Customers  
INNER JOIN Sales 
ON Customers.CustomerID = Sales.CustomerID
GROUP BY Customers.CustomerID, Customers.Name
HAVING Sales.LastSaleDate BETWEEN #1/1/2016# AND #12/31/2016#
```

This query would pull 1,000 sales records from the Sales table, then filter for the 200 records generated in the year 2016, and finally count the records in the dataset.

In comparison, **WHERE** clauses limit the number of records pulled:

```
SELECT Customers.CustomerID, Customers.Name, Count(Sales.SalesID)
FROM Customers 
INNER JOIN Sales 
ON Customers.CustomerID = Sales.CustomerID
WHERE Sales.LastSaleDate BETWEEN #1/1/2016# AND #12/31/2016#
GROUP BY Customers.CustomerID, Customers.Name
```

This query would pull the 200 records from the year 2016, and then count the records in the dataset. The first step in the **HAVING** clause has been completely eliminated.

**HAVING** should only be used when filtering on an aggregated field. In the query above, we could additionally filter for customers with greater than 5 sales using a HAVING statement.

```
SELECT Customers.CustomerID, Customers.Name, Count(Sales.SalesID)
FROM Customers  
INNER JOIN Sales  
ON Customers.CustomerID = Sales.CustomerID
WHERE Sales.LastSaleDate BETWEEN #1/1/2016# AND #12/31/2016#
GROUP BY Customers.CustomerID, Customers.Name
HAVING Count(Sales.SalesID) > 5
```

## 6. Use wildcards at the end of a phrase only

When searching plaintext data, such as cities or names, wildcards create the widest search possible. However, the widest search is also the most inefficient search.

When a leading wildcard is used, especially in combination with an ending wildcard, the database is tasked with searching all records for a match anywhere within the selected field.

Consider this query to pull cities beginning with ‘Char’:

```
SELECT City FROM CustomersWHERE City LIKE ‘%Char%’
```

This query will pull the expected results of **Char**leston, **Char**lotte, and **Char**lton. However, it will also pull unexpected results, such as Cape **Char**les, Crab Or**char**d, and **Rich**ardson.

A more efficient query would be:

```
SELECT City FROM CustomersWHERE City LIKE ‘Char%’
```

This query will pull only the expected results of **Char**leston, **Char**lotte, and **Char**lton.

## 7. Use LIMIT to sample query results

Before running a query for the first time, ensure the results will be desirable and meaningful by using a **LIMIT** statement. (In some DBMS systems, the word TOP is used interchangeably with LIMIT.) The LIMIT statement returns only the number of records specified. Using a **LIMIT** statement prevents taxing the production database with a large query, only to find out the query needs editing or refinement.

In the 2016 sales query from above, we will examine a limit of 10 records:

```
SELECT Customers.CustomerID, Customers.Name, Count(Sales.SalesID)
FROM Customers 
INNER JOIN Sales 
ON Customers.CustomerID = Sales.CustomerID
WHERE Sales.LastSaleDate BETWEEN #1/1/2016# AND #12/31/2016#
GROUP BY Customers.CustomerID, Customers.Name
LIMIT 10
```

We can see by the sample whether we have a useable data set or not.

## 8. Run your query during off-peak hours

In order to minimize the impact of your analytical queries on the production database, talk to a DBA about scheduling the query to run at an off-peak time. The query should run when concurrent users are at their lowest number, which is typically the middle of the night (3 – 5 a.m.).

The more of the following criteria your query has, the more likely of a candidate it should be to run at night:

- Selecting from large tables (>1,000,000 records)
- Cartesian Joins or CROSS JOINs
- Looping statements
- SELECT DISTINCT statements
- Nested subqueries
- Wildcard searches in long text or memo fields
- Multiple schema queries