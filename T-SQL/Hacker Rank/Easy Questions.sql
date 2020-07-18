--Revising the Select Query I
-- Query all columns for all American cities in CITY with populations larger than 100000. The CountryCode for America is USA.

SELECT * 
FROM City
WHERE population > 100000 and countrycode = 'USA'

--Revising the Select Query II
-- Query the names of all American cities in CITY with populations larger than 120000. The CountryCode for America is USA.

SELECT Name
FROM City 
WHERE population > 120000 and countrycode = 'USA'

--Select All 
--Query all columns (attributes) for every row in the CITY table.

SELECT * 
FROM City

--Select By ID
--Query all columns for a city in CITY with the ID 1661.

SELECT *
FROM city 
WHERE id = 1661

--Japanese Cities' Attributes
--Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

SELECT * 
FROM city
where countrycode = 'JPN'

--Japanese Cities' Names
--Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

SELECT name 
FROM City WHERE countrycode = 'JPN'

--Weather Observation Station 1
--Query a list of CITY and STATE from the STATION table.

SELECT City, State
FROM Station

--Weather Observation Station 3
--Query a list of CITY names from STATION with even ID numbers only. You may print the results in any order, but must exclude duplicates from your answer.

SELECT distinct city
from Station
WHERE id%2 = 0

--Weather Observation Station 4
--Let  be the number of CITY entries in STATION, and let  be the number of distinct CITY names in STATION; query the value of  from STATION. In other words, find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
SELECT (COUNT(city) -  count(DISTINCT city))
FROM station

--Employee Names
--Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
--The Employee table containing employee data for a company is described as follows:
--where employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is their monthly salary.

SELECT name
FROM Employee
ORDER BY name