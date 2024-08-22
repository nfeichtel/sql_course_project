/*
Answer: What are the top skills based on salary?
Lookat the average salary associated with each skill for Data Analyst positions
Focuses on roles with specified salaries, regardless of location
Why? It reveals how different skills impact salary levels for Data Analysts
and helps identify the most financially rewarding skills to acquire or imporve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM job_postings_fact jpf
JOIN skills_job_dim sjd
    ON jpf.job_id = sjd.job_id
JOIN skills_dim sd
    ON sjd.skill_id = sd.skill_id
WHERE 
    job_title_short = 'Data Analyst'
    --AND job_work_from_home = TRUE
    AND salary_year_avg IS NOT NULL
GROUP BY skills

ORDER BY average_salary DESC
LIMIT 25