-- Skill 2.3: Group and pivot data by using queries

-- Writing grouped queries
-- You can use grouped queries to define groups in your data, and then you can perform data
-- analysis computations per group. You group the data by a set of expressions known as a
-- grouping set. Traditional T-SQL queries define a single grouping set; namely, they group the
-- data in only one way. T-SQL also supports defining multiple grouping sets in one query.

-- Using an explicit GROUP BY clause, you can group the rows based on a specified grouping set of expressions. For example, the following query groups the rows by shipper ID and
-- counts the number of rows (orders, in this case) per distinct group:

SELECT
    shipperid,
    COUNT(*) AS numorders
FROM
    Sales.Orders
GROUP BY
    shipperid;


-- If you need to filter entire groups, you need a filtering option that is evaluated at the
-- group level—unlike the WHERE clause, which is evaluated at the row level. For this, T-SQL
-- provides the HAVING clause. Like the WHERE clause, the HAVING clause uses a predicate but
-- evaluates the predicate per group as opposed to per row. This means that you can refer to
-- aggregate computations because the data has already been grouped

SELECT
    shipperid,
    YEAR(shippeddate) AS shippedyear,
    COUNT(*) AS numorders
FROM
    Sales.Orders
WHERE
    shippeddate IS NOT NULL
GROUP BY
    shipperid,
    YEAR(shippeddate)
HAVING
    COUNT(*) < 100;


-- T-SQL supports a number of aggregate functions. Those include COUNT(*) and a few general set functions (as they are categorized by standard SQL) like COUNT, SUM, AVG, MIN, and
-- MAX. General set functions are applied to an expression and ignore NULLs.

SELECT
    shipperid,
    COUNT(*) AS numorders,
    COUNT(shippeddate) AS shippedorders,
    MIN(shippeddate) AS firstshipdate,
    MAX(shippeddate) AS lastshipdate,
    SUM(val) AS totalvalue
FROM
    Sales.OrderValues
GROUP BY
    shipperid;


-- With aggregate functions, you can work with distinct occurrences by specifying a DISTINCT clause before the expression, as follows:

SELECT
    shipperid,
    COUNT(DISTINCT shippeddate) AS numshippingdates
FROM
    Sales.Orders
GROUP BY
    shipperid;

-- From a logical query processing perspective, the GROUP BY clause is evaluated after the
-- FROM and WHERE clauses, and before the HAVING, SELECT, and ORDER BY clauses. So the
-- last three clauses already work with a grouped table, and therefore the expressions that they
-- support are limited. 

SELECT
    S.shipperid,
    S.companyname,
    COUNT(*) AS numorders
FROM
    Sales.Shippers AS S
    INNER JOIN Sales.Orders AS O ON S.shipperid = O.shipperid
GROUP BY
    S.shipperid;
-- You can use a number of workarounds. One solution is to add the S.companyname column
-- to the GROUP BY list, as follows:

SELECT
    S.shipperid,
    S.companyname,
    COUNT(*) AS numorders
FROM
    Sales.Shippers AS S
    INNER JOIN Sales.Orders AS O ON S.shipperid = O.shipperid
GROUP BY
    S.shipperid,
    S.companyname;

'''
T-SQL supports two additional clauses called CUBE and ROLLUP, which you can consider as
abbreviations of the GROUPING SETS clause. The CUBE clause accepts a list of expressions as
inputs and defines all possible grouping sets that can be generated from the inputs—including the empty grouping set. For example, the following query is a logical equivalent of the
previous query that used the GROUPING SETS clause:
SELECT shipperid, YEAR(shippeddate) AS shipyear, COUNT(*) AS numorders
FROM Sales.Orders
WHERE shippeddate IS NOT NULL
GROUP BY CUBE( shipperid, YEAR(shippeddate) );
The CUBE clause defines all four possible grouping sets from the two inputs:
■ ( shipperid, YEAR(shippeddate) )
■ ( shipperid )
■ ( YEAR(shippeddate) )
■ ( )
'''

SELECT
    shipperid,
    YEAR(shippeddate) AS shipyear,
    COUNT(*) AS numorders
FROM
    Sales.Orders
WHERE
    shippeddate IS NOT NULL
GROUP BY
    CUBE(shipperid, YEAR(shippeddate));

'''
The ROLLUP clause is also an abbreviation of the GROUPING SETS clause, but you use it
when there’s a natural hierarchy formed by the input elements. In such a case, only a subset
of the possible grouping sets is really interesting. Consider, for example, a location hierarchy
made of the elements shipcountry, shipregion, and shipcity, in this order. It’s only interesting to roll up the data in one direction, computing aggregates for the following grouping
sets:
■ ( shipcountry, shipregion, shipcity )
■ ( shipcountry, shipregion )
■ ( shipcountry )
■ ( )
'''
SELECT
    shipcountry,
    shipregion,
    shipcity,
    COUNT(*) AS numorders
FROM
    Sales.Orders
GROUP BY
    ROLLUP(shipcountry, shipregion, shipcity);

'''

Pivoting and Unpivoting Data
Pivoting is a specialized case of grouping and aggregating of data. Unpivoting is, in a sense,
the inverse of pivoting. T-SQL supports native operators for both. Let’s first describe the
PIVOT operator and then the UNPIVOT operator.
Pivoting Data
Pivoting is a technique that groups and aggregates data, transitioning it from a state of rows
to a state of columns. In all pivot queries, you need to identify three elements:
1. What do you want to see on rows? This element is known as the on rows, or grouping
element.
2. What do you want to see on columns? This element is known as the on cols, or spreading element.
3. What do you want to see in the intersection of each distinct row and column value?
This element is known as the data, or aggregation element.
As an example of a pivot request, suppose that you want to query the Sales.Orders table.
You want to return a row for each distinct customer ID (the grouping element), a column for
each distinct shipper ID (the spreading element), and in the intersection of each customer and
shipper you want to see the sum of freight values (the aggregation element). With T-SQL, you
can achieve such a pivoting task by using the PIVOT table operator. The recommended form
for a pivot query (more on why it’s the recommended form later) is generally like the following
'''

WITH PivotData AS (
    SELECT
        < grouping column >,
        < spreading column >,
        < aggregation column >
    FROM
        < source table >
)
SELECT
    <
select
    list >
FROM
    PivotData PIVOT(
        < aggregate function >(< aggregation column >) FOR < spreading column > IN (
            < distinct spreading
            values
                >
        )
    ) AS P;

'''
This recommended general form is made of the following elements:
■ You define a table expression (like the one named PivotData) that returns the three
elements that are involved in pivoting, which in this example are custid, shipperid
and freight from Sales.Orders. It is not recommended to query the underlying source
table directly; the reason for this is explained shortly.
■ You issue the outer query against the table expression and apply the PIVOT operator
to that table expression. The PIVOT operator returns a table result. You need to assign
an alias to that table, for example, P.
■ The specification for the PIVOT operator starts by indicating an aggregate function applied to the aggregation element—in this example, SUM(freight).
■ Then you specify the FOR clause followed by the spreading column, which in this example is shipperid.
■ Then you specify the IN clause followed by the list of distinct values that appear in the
spreading element, separated by commas. What used to be values in the spreading
column (in this example, shipper IDs) become column names in the result table. Therefore, the items in the list should be expressed as column identifiers. Remember that if
a column identifier is irregular, it has to be delimited. Because shipper IDs are integers,
they have to be delimited: [1],[2],[3]

'''

WITH PivotData AS (
    SELECT
        custid,
        -- grouping column
        shipperid,
        -- spreading column
        freight -- aggregation column
    FROM
        Sales.Orders
)
SELECT
    custid,
    [1],
    [2],
    [3]
FROM
    PivotData PIVOT(SUM(freight) FOR shipperid IN ([1], [2], [3])) AS P;


-- without nulls

WITH PivotData AS (
    SELECT
        custid,
        shipperid,
        freight
    FROM
        Sales.Orders
)
SELECT
    custid,
    ISNULL([1], 0.00) AS [1],
    ISNULL([2], 0.00) AS [2],
    ISNULL([3], 0.00) AS [3]
FROM
    PivotData PIVOT(SUM(freight) FOR shipperid IN ([1], [2], [3])) AS P;

'''
Limitations:
The aggregation and spreading elements cannot directly be results of expressions;
instead, they must be column names from the queried table. You can, however, apply
expressions in the query defining the table expression, assign aliases to those expressions, and then use the aliases in the PIVOT operator.
■ The COUNT(*) function isn’t allowed as the aggregate function used by the PIVOT
operator. If you need a count, you have to use the general COUNT(<col name>) aggregate function. A simple workaround is to define a dummy column in the table expression made of a constant, as in 1 AS agg_col, and then in the PIVOT operator apply
the aggregate function to that column: COUNT(agg_col). In this case you can also use
SUM(agg_col) as an alternative.
■ A PIVOT operator is limited to using only one aggregate function.
■ The IN clause of the PIVOT operator accepts a static list of spreading values. It doesn’t
support a subquery as input. You need to know ahead what the distinct values are in
the spreading column and specify those in the IN clause. When the list isn’t known
ahead, you can use dynamic SQL to construct and execute the query string after
querying the distinct values from the data. You can find an example for building and
executing a pivot query dynamically at http://sqlmag.com/sql-server/logical-queryprocessing-clause-and-pivot.

'''