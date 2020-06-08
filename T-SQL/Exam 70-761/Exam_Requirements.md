# Exam 70-461

**Querying Microsoft SQL Server 2012/2014**

Price: 110 -160$

## Skills measured

### Create Database objects 

- Create and alter tables using T-SQL syntax (simple statements)
  - Create tables without using the built in tools; ALTER; DROP; ALTER COLUMN; CREATE
- Create and alter views (simple statements)
  - Create indexed views; create views without using the built in tools; CREATE, ALTER, DROP
- Design views
  - Ensure code non regression by keeping consistent signature for procedure, views and function (interfaces); security implications
- Create and modify constraints (simple statements)
  - Create constraints on tables; define constraints; unique constraints; default constraints; primary and foreign key constraints
- Create and alter DML triggers
  - Inserted and deleted tables; nested triggers; types of triggers; update functions; handle multiple rows in a session; performance implications of triggers

**Preparation resources**

- [Tables](http://msdn.microsoft.com/library/ms189084.aspx)
- [Views](http://msdn.microsoft.com/library/ms190174.aspx)
- [table_constraint (Transact-SQL)](http://msdn.microsoft.com/library/ms188066(v=sql.110).aspx)

### Work with data

- Query data by using SELECT statements
  - Use the ranking function to select top(X) rows for multiple categories in a single query; write and perform queries efficiently using the new (SQL 2005/8->) code items such as synonyms, and joins (except, intersect); implement logic which uses dynamic SQL and system metadata; write efficient, technically complex SQL queries, including all types of joins versus the use of derived tables; determine what code may or may not execute based on the tables provided; given a table with constraints, determine which statement set would load a table; use and understand different data access technologies; case versus isnull versus coalesce
- Implement sub-queries
  - Identify problematic elements in query plans; pivot and unpivot; apply operator; cte statement; with statement
- Implement data types
  - Use appropriate data; understand the uses and limitations of each data type; impact of GUID (newid, newsequentialid) on database performance, when to use what data type for columns
- Implement aggregate queries
  - New analytic functions; grouping sets; spatial aggregates; apply ranking functions
- Query and manage XML data
  - Understand XML datatypes and their schemas and interop w/, limitations and restrictions; implement XML schemas and handling of XML data; XML data: how to handle it in SQL Server and when and when not to use it, including XML namespaces; import and export XML; XML indexing

**Preparation resources**

- [SELECT (Transact-SQL)](http://msdn.microsoft.com/library/ms189499.aspx)
- [INTO clause (Transact-SQL)](http://msdn.microsoft.com/library/ms188029.aspx)
- [FROM (Transact-SQL)](http://msdn.microsoft.com/library/ms177634.aspx)

### Modify Data

- Create and alter stored procedures (simple statements)
  - Write a stored procedure to meet a given set of requirements; branching logic; create stored procedures and other programmatic objects; techniques for developing stored procedures; different types of storeproc result; create stored procedure for data access layer; program stored procedures, triggers, functions with T-SQL
- Modify data by using INSERT, UPDATE, and DELETE statements
  - Given a set of code with defaults, constraints, and triggers, determine the output of a set of DDL; know which SQL statements are best to solve common requirements; use output statement
- Combine datasets
  - Difference between UNION and UNION all; case versus isnull versus coalesce; modify data by using MERGE statements
- Work with functions
  - Understand deterministic, non-deterministic functions; scalar and table values; apply built-in scalar functions; create and alter user-defined functions (UDFs)

**Preparation resources**

- [CREATE PROCEDURE (Transact-SQL)](http://msdn.microsoft.com/library/ms187926.aspx)
- [ALTER PROCEDURE (Transact-SQL)](http://msdn.microsoft.com/library/ms189762.aspx)
- [INSERT (Transact-SQL)](http://msdn.microsoft.com/library/ms174335.aspx)

### Troubleshoot and optimize

- Optimize queries
  - Understand statistics; read query plans; plan guides; DMVs; hints; statistics IO; dynamic vs. parameterized queries; describe the different join types (HASH, MERGE, LOOP) and describe the scenarios they would be used in
- Manage transactions
  - Mark a transaction; understand begin tran, commit, and rollback; implicit vs explicit transactions; isolation levels; scope and type of locks; trancount
- Evaluate the use of row-based operations vs. set-based operations
  - When to use cursors; impact of scalar UDFs; combine multiple DML operations
- Implement error handling
  - Implement try/catch/throw; use set based rather than row based logic; transaction management

**Preparation resources**

- [Transaction statements (Transact-SQL)](http://msdn.microsoft.com/library/ms174377.aspx)
- [SET TRANSACTION ISOLATION LEVEL (Transact-SQL)](http://msdn.microsoft.com/library/ms173763.aspx)
- [Cursors](http://msdn.microsoft.com/library/ms191179.aspx)