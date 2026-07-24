/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specific salaries, regardless of location
- Why? It reveales how different skills impact salary levels for Data Analysts and
   helps identified the most finacially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_Salary
FROM  job_postings_fact     a
INNER JOIN  skills_job_dim  b   ON  a.job_id = b.job_id
INNER JOIN  skills_dim      c   ON  b.skill_id = c.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY avg_Salary DESC
LIMIT 25
 