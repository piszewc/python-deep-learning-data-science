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
JOIN total_views as tv ON ts.contest_id = tv.contest_id AND ts.hacker_id = tv.hacker_id



;