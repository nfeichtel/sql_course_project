/*
Find job postings from the first quarter that have a salary greater than $70K
Combine job posting tables from the first quarter of 2023
(Jan-Mar)
Gets job postings with an average yearly salary > $70,000
*/

WITH Q1 AS
(
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
)
SELECT * 
FROM Q1
WHERE salary_year_avg > 70000