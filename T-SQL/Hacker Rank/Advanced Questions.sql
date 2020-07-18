/*
Interviews

Samantha interviews many candidates from different colleges using coding challenges and contests. Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are.

Note: A specific contest can be used to screen candidates at more than one college, but each college only holds  screening contest.

*/

WITH vsts AS (SELECT challenge_id, sum(total_views) as total_views, sum(total_unique_views) as total_unique_views
FROM View_Stats
GROUP BY challenge_id),

subs AS (SELECT challenge_id, sum(total_submissions) as total_submissions, sum(total_accepted_submissions) as total_accepted_submissions
FROM Submission_Stats
GROUP BY challenge_id),

total_views AS (
SELECT con.contest_id, con.hacker_id, con.name, SUM(vsts.total_views) as total_views, SUM(vsts.total_unique_views) as total_unique_views
FROM Contests AS con
JOIN Colleges ON con.contest_id = Colleges.contest_id
JOIN Challenges ON Colleges.college_id = Challenges.college_id
LEFT JOIN vsts ON vsts.challenge_id = Challenges.challenge_id
GROUP BY con.contest_id, con.hacker_id, con.name
),

total_subs AS (
SELECT con.contest_id, con.hacker_id, con.name, SUM(subs.total_submissions) as total_submissions, SUM(subs.total_accepted_submissions) as total_accepted_submissions
FROM Contests AS con
JOIN Colleges ON con.contest_id = Colleges.contest_id
JOIN Challenges ON Colleges.college_id = Challenges.college_id
LEFT JOIN subs ON subs.challenge_id = Challenges.challenge_id
GROUP BY con.contest_id, con.hacker_id, con.name
)

SELECT ts.contest_id, ts.hacker_id, ts.name, ts.total_submissions, ts.total_accepted_submissions, tv.total_views, tv.total_unique_views
FROM total_subs AS ts
JOIN total_views as tv ON ts.contest_id = tv.contest_id AND ts.hacker_id = tv.hacker_id;

/*

15 Days of Learning SQL

Julia conducted a  days of learning SQL contest. The start date of the contest was March 01, 2016 and the end date was March 15, 2016.

Write a query to print total number of unique hackers who made at least  submission each day (starting on the first day of the contest), and find the hacker_id and name of the hacker who made maximum number of submissions each day. If more than one such hacker has a maximum number of submissions, print the lowest hacker_id. The query should print this information for each day of the contest, sorted by the date.



*/


/*
New Companies

Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy: 

Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

Note:

The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.
*/

WITH cnt_emp AS (
SELECT company_code, COUNT(DISTINCT employee_code) as cnt_emp
FROM Employee
GROUP BY company_code), 

cnt_m AS (
SELECT company_code, COUNT(DISTINCT manager_code) as cnt_m
FROM Manager
GROUP BY company_code),

cnt_sm AS (
SELECT company_code, COUNT(DISTINCT senior_manager_code) as cnt_sm
FROM Senior_Manager
GROUP BY company_code),

cnt_lm AS (
SELECT company_code, COUNT(DISTINCT Lead_Manager_code) as cnt_lm
FROM Lead_Manager
GROUP BY company_code)



SELECT c.company_code, c.founder, cnt_lm.cnt_lm, cnt_sm.cnt_sm, cnt_m.cnt_m, cnt_emp.cnt_emp
FROM Company AS c
JOIN cnt_lm ON c.company_code = cnt_lm.company_code
JOIN cnt_sm ON c.company_code = cnt_sm.company_code
JOIN cnt_m ON c.company_code = cnt_m.company_code
JOIN cnt_emp ON c.company_code = cnt_emp.company_code

ORDER BY c.company_code ASC

/*
Occupations

Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.

*/

WITH cte AS (SELECT row_number() OVER (PARTITION BY occupation ORDER BY name) AS rn, name as name, occupation as occupation 
FROM occupations)

SELECT d.name, p.name, s.name, a.name
FROM (SELECT rn, name FROM cte WHERE occupation = 'Doctor') AS d
FULL OUTER JOIN (SELECT rn, name FROM cte WHERE occupation = 'Professor') AS p ON p.rn = d.rn
FULL OUTER JOIN (SELECT rn, name FROM cte WHERE occupation = 'Singer') AS s ON s.rn = p.rn
FULL OUTER JOIN (SELECT rn, name FROM cte WHERE occupation = 'Actor') AS a ON a.rn = p.rn



/*
The Report

You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.
Grades contains the following data:
Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.

Write a query to help Eve.
*/

SELECT CASE WHEN g.Grade > 7 THEN s.Name ELSE NULL END, g.Grade, s.Marks
FROM Students as s
LEFT JOIN Grades as g ON s.Marks between g.min_mark and g.max_mark
ORDER BY g.Grade DESC, s.Name

/*
New Companies

Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy: 
Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.
Note:
The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.
Input Format
The following tables contain company data:
Company: The company_code is the code of the company and founder is the founder of the company. 
Lead_Manager: The lead_manager_code is the code of the lead manager, and the company_code is the code of the working company. 
Senior_Manager: The senior_manager_code is the code of the senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company. 
Manager: The manager_code is the code of the manager, the senior_manager_code is the code of its senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company.


*/



WITH cnt_emp AS (
SELECT company_code, COUNT(DISTINCT employee_code) as cnt_emp
FROM Employee
GROUP BY company_code), 

cnt_m AS (
SELECT company_code, COUNT(DISTINCT manager_code) as cnt_m
FROM Manager
GROUP BY company_code),

cnt_sm AS (
SELECT company_code, COUNT(DISTINCT senior_manager_code) as cnt_sm
FROM Senior_Manager
GROUP BY company_code),

cnt_lm AS (
SELECT company_code, COUNT(DISTINCT Lead_Manager_code) as cnt_lm
FROM Lead_Manager
GROUP BY company_code)



SELECT c.company_code, c.founder, cnt_lm.cnt_lm, cnt_sm.cnt_sm, cnt_m.cnt_m, cnt_emp.cnt_emp
FROM Company AS c
JOIN cnt_lm ON c.company_code = cnt_lm.company_code
JOIN cnt_sm ON c.company_code = cnt_sm.company_code
JOIN cnt_m ON c.company_code = cnt_m.company_code
JOIN cnt_emp ON c.company_code = cnt_emp.company_code

ORDER BY c.company_code ASC


