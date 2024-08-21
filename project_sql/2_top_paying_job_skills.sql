/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
V - Why? It provides a detailed look at which high-paying jobs demand certain skills, 
helping job seekers understand which skills to develop that align with top salaries
*/
WITH top_paying_jobs AS
(
    SELECT
        job_id,
        job_title,
        name,
        salary_year_avg
    FROM job_postings_fact AS jpf
    LEFT JOIN company_dim AS cd
        ON jpf.company_id = cd.company_id
    WHERE 
        job_title_short = 'Data Analyst'
        AND job_work_from_home = TRUE
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT 
    tpj.*,
    skills
FROM top_paying_jobs tpj
JOIN skills_job_dim skd
    ON tpj.job_id = skd.job_id
JOIN skills_dim sd
    ON skd.skill_id = sd.skill_id
ORDER BY salary_year_avg DESC
