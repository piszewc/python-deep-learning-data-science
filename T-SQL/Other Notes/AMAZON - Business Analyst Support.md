# AMAZON - Business Analyst Support

Base tables to be referred for the questions (6-10)

| Orders      |
| ----------- |
| order_id    |
| customer_id |
| order_date  |
| product_id  |

| Products         |
| ---------------- |
| product_id       |
| product_name     |
| product_category |
| product_price    |

| Customer         |
| ---------------- |
| customer_id      |
| customer_name    |
| customer_address |

### SQL Questions

1) How many type of JOINS are there is SQL? Please list their names and draw Venn diagrams for one one of them.

> There are four basic types of SQL joins: inner, left, right, and full. The easiest and most intuitive way to explain the difference between these four types is by using a Venn diagram, which shows all possible logical relations between data sets. 

| ![Select all records from Table A and Table B, where the join condition is met.](https://images.squarespace-cdn.com/content/v1/5732253c8a65e244fd589e4c/1464122775537-YVL7LO1L7DU54X1MC2CI/ke17ZwdGBToddI8pDm48kMjn7pTzw5xRQ4HUMBCurC5Zw-zPPgdn4jUwVcJE1ZvWMv8jMPmozsPbkt2JQVr8L3VwxMIOEK7mu3DMnwqv-Nsp2ryTI0HqTOaaUohrI8PIvqemgO4J3VrkuBnQHKRCXIkZ0MkTG3f7luW22zTUABU/image-asset.png?format=300w) | ![Select all records from Table A, along with records from Table B for which the join condition is met (if at all).](https://images.squarespace-cdn.com/content/v1/5732253c8a65e244fd589e4c/1464122797709-C2CDMVSK7P4V0FNNX60B/ke17ZwdGBToddI8pDm48kMjn7pTzw5xRQ4HUMBCurC5Zw-zPPgdn4jUwVcJE1ZvWEV3Z0iVQKU6nVSfbxuXl2c1HrCktJw7NiLqI-m1RSK4p2ryTI0HqTOaaUohrI8PIO5TUUNB3eG_Kh3ocGD53-KZS67ndDu8zKC7HnauYqqk/image-asset.png?format=300w) | ![Select all records from Table B, along with records from Table A for which the join condition is met (if at all).](https://images.squarespace-cdn.com/content/v1/5732253c8a65e244fd589e4c/1464122744888-MVIUN2P80PG0YE6H12WY/ke17ZwdGBToddI8pDm48kMjn7pTzw5xRQ4HUMBCurC5Zw-zPPgdn4jUwVcJE1ZvWlExFaJyQKE1IyFzXDMUmzc1HrCktJw7NiLqI-m1RSK4p2ryTI0HqTOaaUohrI8PI-FpwTc-ucFcXUDX7aq6Z4KQhQTkyXNMGg1Q_B1dqyTU/image-asset.png?format=300w) | ![Select all records from Table A and Table B, regardless of whether the join condition is met or not.](https://images.squarespace-cdn.com/content/v1/5732253c8a65e244fd589e4c/1464122981217-RIYH5VL2MF1XWTU2DKVQ/ke17ZwdGBToddI8pDm48kMjn7pTzw5xRQ4HUMBCurC5Zw-zPPgdn4jUwVcJE1ZvWEV3Z0iVQKU6nVSfbxuXl2c1HrCktJw7NiLqI-m1RSK4p2ryTI0HqTOaaUohrI8PIO5TUUNB3eG_Kh3ocGD53-KZS67ndDu8zKC7HnauYqqk/image-asset.png?format=300w) |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Select all records from Table A and Table B, where the join condition is met. | Select all records from Table A, along with records from Table B for which the join condition is met (if at all). | Select all records from Table B, along with records from Table A for which the join condition is met (if at all). | Select all records from Table A and Table B, regardless of whether the join condition is met or not. |

2) What is difference between UNION and UNION ALL?

> - UNION returns a result set of distinct rows combined from all statements
> - UNION removes duplicates during query processing (affects performance)
> - UNION ALL retains duplicates during query processing
> - You need to have same number of columns

3) What is the difference between WHERE and HAVING clauses?

> HAVING: is used to check conditions *after* the aggregation takes place.
> WHERE: is used to check conditions *before* the aggregation takes place.

4) What is PRIMARY KEY? Can it contain a NULL entry?

> The PRIMARY KEY constraint uniquely identifies each record in a table.
>
> Primary keys must contain UNIQUE values, and cannot contain NULL values.
>
> A table can have only ONE primary key; and in the table, this primary key can consist of single or multiple columns (fields).

5) Based on Sales value below, please fill in the values each functions give

| Cust ID | Sales | ROW_NUMBER | RANK | DENSE_RANK |
| ------- | ----- | ---------- | ---- | ---------- |
| C1      | 100   | 1          | 1    | 1          |
| C2      | 150   | 2          | 2    | 2          |
| C3      | 150   | 3          | 2    | 2          |
| C4      | 200   | 4          | 4    | 3          |

6) Write a query to get Top 3 customers with highest number of orders.

```sql
SELECT TOP (3) o.customer_id, Count(o.order_id) AS orders_number
FROM orders as o
GROUP BY customer_id
ORDER BY Count(order_id) DESC
```

7) Find new customers who joined in Jan-19

```sql
SELECT o.customer_id, MIN(o.order_date) as order_date
FROM orders as o
GROUP BY o.customer_id
HAVING YEAR(MIN(o.order_date)) = 2015 AND MONTH(MIN(o.order_date)) = 01
```

8) Get the list of products which have not had any sale in the last 90 days. 

```sql
SELECT p.product_id, p.prduct_name, MAX(o.order_date) as last_order, DATEDIFF(day,MAX(o.order_date),GETDATE()) AS days_since_last_order
FROM orders AS o
JOIN products AS p
	ON o.order_id = p.order_id
GROUP BY od.product_id
HAVING DATEDIFF(day,MAX(o.order_date),GETDATE()) > 90
```

9) Get the list of customer names who purchased the least once in 'Books' category in July'19

```sql
SELECT c.cust_id, c.customer_name
FROM customers AS c
WHERE c.cust_id IN 
	(SELECT DISTINCT o.cust_id FROM orders as o
	JOIN products AS p ON o.product_id = p.product_id
	WHERE p.product_category = 'Books' AND YEAR(o.order_date) = 2019 and MONTH(o.order_date) = 07
```



10) Names of customers who ordered more than 10 products between Apr'19 and June'19

```sql
SELECT c.cust_id, c.customer_name
FROM customers AS c
WHERE c.cust_id IN 
	(SELECT o.cust_id 
	FROM orders as o
	WHERE order_date => '20190401' AND < '20190701'
	GROUP BY cust_id
	HAVING COUNT(o.order_id) > 10 )
```

