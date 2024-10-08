/*
Find the count of the number of remote job postings per skill
- Display the top 5 skills by their demand in remote jobs
- Include skill ID, name, and count of postings requiring the
*/
WITH remote_job_skills AS 
(
    SELECT 
        skill_id,
        COUNT(*) AS skill_count
    FROM 
        skills_job_dim AS skills_to_job
    JOIN job_postings_fact AS job_posting
        ON job_posting.job_id = skills_to_job.job_id
    WHERE job_posting.job_work_from_home = TRUE
        AND job_title_short = 'Data Analyst'
    GROUP BY skill_id
)

SELECT 
    sd.skill_id AS skill_id,
    sd.skills AS skill_name,
    rjs.skill_count
FROM remote_job_skills AS rjs
JOIN skills_dim AS sd
    ON rjs.skill_id = sd.skill_id
ORDER BY 
    rjs.skill_count DESC