/*

	You can find the original version of exercises at:
	https://mode.com/sql-tutorial/sql-data-types/

	Below version of those questions is using StackOverflow Database. You can download this database at https://www.brentozar.com/archive/2015/10/how-to-download-the-stack-overflow-database-via-bittorrent/ in the exercises I used 50GB version of the database with SQL Server 2019 (https://www.microsoft.com/en-us/sql-server/sql-server-downloads) and Windows Server 2019 (https://www.microsoft.com/evalcenter/evaluate-windows-server-2019?filetype=ISO). 

	The goal of running the below exercises is to get to an advanced level in SQL.

*/


-- Convert the upvotes and downvotes columns in the dbo.Users table to strings (varchar format) using a different formatting function for each one.

SELECT CAST(u.UpVotes AS varchar), CONVERT(VARCHAR(50), u.DownVotes)
FROM dbo.Users as u

-- Write a query that counts the number of badges auired by users with accounts created for 3 years, 5 years, and 10 years from creation date to last activation time (in 3 separate columns). Include a column for total badges acquired as well. Group by badges and limit to only to users with any of the badges.

SELECT b.Name, 
	COUNT(CASE 
		WHEN DATEDIFF(YEAR,u.CreationDate, u.LastAccessDate) <= 1 THEN 1 ELSE NULL 
	END ) AS zero_to_one_YEARs
	, COUNT(CASE 
		WHEN DATEDIFF(YEAR,u.CreationDate, u.LastAccessDate) BETWEEN 2 AND 5 THEN 1 ELSE NULL 
	END ) AS two_to_five_YEARs
	, COUNT(CASE 
		WHEN DATEDIFF(YEAR,u.CreationDate, u.LastAccessDate) > 5 THEN 1 ELSE NULL 
	END ) AS more_than_five_YEARs, COUNT(b.Name) AS TotalBadges
FROM dbo.Users AS u
LEFT JOIN dbo.Badges AS b
ON b.UserId = u.Id
WHERE b.Name is not null 
GROUP BY b.Name
ORDER BY COUNT(b.Name) DESC
-- Write a query that separates the `location` field into separate fields for country, city.

SELECT Location, TRIM(Substring(u.Location,Charindex(',', Location)+1, LEN(Location))) as Country, TRIM(Substring(Location, 1,Charindex(',', Location))) as City
FROM dbo.Users as u
WHERE u.Location <> ''

-- Concatenate the lat and lon fields to form a field that is equivalent to the location field. (Note that the answer will have a different decimal precision.)

-- Create the same concatenated location field, but using the || syntax instead of CONCAT.

-- Write a query that creates a date column formatted YYYY-MM-DD.

-- Write a query that returns the `category` field, but with the first letter capitalized and the rest of the letters in lower-case.

-- Write a query that creates an accurate timestamp using the date and time columns in tutorial.sf_crime_incidents_2014_01. Include a field that is exactly 1 week later as well.

-- Write a query that counts the number of incidents reported by week. Cast the week as a date to get rid of the hours/minutes/seconds.

-- Write a query that shows exactly how long ago each indicent was reported. Assume that the dataset is in Pacific Standard Time (UTC - 8).

-- Write a query that selects all Warrant Arrests from the tutorial.sf_crime_incidents_2014_01 dataset, then wrap it in an outer query that only displays unresolved incidents.

-- Write a query that displays the average number of monthly incidents for each category. Hint: use tutorial.sf_crime_incidents_cleandate to make your life a little easier.

-- Write a query that displays all rows from the three categories with the fewest incidents reported.

-- Write a query that counts the number of companies founded and acquired by quarter starting in Q1 2012. Create the aggregations in two separate queries, then join them.

-- Write a query that ranks investors from the combined dataset above by the total number of investments they have made.

-- Write a query that does the same thing as in the previous problem, except only for companies that are still operating. Hint: operating status is in tutorial.crunchbase_companies.

-- Write a query modification of the above example query that shows the duration of each ride as a percentage of the total time accrued by riders from each start_terminal

-- Write a query that shows a running total of the duration of bike rides (similar to the last example), but grouped by end_terminal, and with ride duration sorted in descending order.

-- Write a query that shows the 5 longest rides from each starting terminal, ordered by terminal, and longest to shortest rides within each terminal. Limit to rides that occurred before Jan. 8, 2012.

-- Write a query that shows only the duration of the trip and the percentile into which that duration falls (across the entire dataset—not partitioned by terminal).  