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

2) What is difference between UNION and UNION ALL?

3) What is the difference between WHERE and HAVING clauses?

4) What is PRIMARY KEY? Can it contain a NULL entry?

5) Based on Sales value below, please fill in the values each functions give

| Cust ID | Sales | ROW_NUMBER | RANK | DENSE_RANK |
| ------- | ----- | ---------- | ---- | ---------- |
| C1      | 100   |            |      |            |
| C2      | 150   |            |      |            |
| C3      | 150   |            |      |            |
| C4      | 200   |            |      |            |

6) Write a query to get Top 3 customers with highest number of orders.

7) Find new customers who joined in Jan-19

8) Get the list of products which have not had any sale in the last 90 days. 

9) Get the list of customer names who purchased the least once in 'Books' category in July'19

10) Names of customers who ordered more than 10 products between Apr'19 and June'19