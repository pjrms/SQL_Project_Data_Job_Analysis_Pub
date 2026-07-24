/*
Question: What skills are required for the top paying Data Analyst jobs?
- Use the top 10 highest paying Data Analyst jobs from first query.
- Add the specific skills required for these roles.
- Why? It provides a detailed look at which high-paying jobs demands certain skills
     helping job seekers understand which skills to develop that alignwith top salaries 
*/
WITH Top_Paying_job AS
(
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM job_postings_fact 
    LEFT JOIN company_dim 
        ON company_dim.company_id = job_postings_fact.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    LIMIT 10
)
SELECT 
    a.*,
    c.skills
FROM  Top_Paying_job a
INNER JOIN  skills_job_dim b ON a.job_id = b.job_id
INNER JOIN  skills_dim c ON b.skill_id = c.skill_id
    ORDER BY salary_year_avg DESC