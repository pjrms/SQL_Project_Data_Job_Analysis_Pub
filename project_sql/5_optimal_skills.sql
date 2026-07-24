/*
Question: What are the most optimal skills to learn (aka it's in high demand and a high paying skill?)
- Identify skills in high demand and associated with high average salaries for Data Anlyst roles.
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benifits (high salaries),
    offering strategic insights for career development in Data Analysis.
*/

WITH   skills_demand AS
(
    SELECT 
        c.skill_id
        ,c.skills
        ,COUNT(b.job_id) AS demand_count
    FROM  job_postings_fact     a
    INNER JOIN  skills_job_dim  b   ON  a.job_id = b.job_id
    INNER JOIN  skills_dim      c   ON  b.skill_id = c.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE
    GROUP BY
        c.skill_id
)

, average_salary AS
(
    SELECT 
        c.skill_id
        ,ROUND(AVG(salary_year_avg),0) AS avg_Salary
    FROM  job_postings_fact     a
    INNER JOIN  skills_job_dim  b   ON  a.job_id = b.job_id
    INNER JOIN  skills_dim      c   ON  b.skill_id = c.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        job_work_from_home = TRUE AND
        salary_year_avg IS NOT NULL
    GROUP BY
        c.skill_id
)
SELECT 
    d.skill_id
    ,d.skills
    ,d.demand_count
    ,e.avg_Salary
FROM skills_demand d
INNER JOIN average_salary e ON d.skill_id = e.skill_id
WHERE 
    demand_count > 10
ORDER BY 
    avg_Salary DESC
    ,demand_count DESC

--rewriting this same query more concisely
SELECT 
     c.skill_id
    ,c.skills
    ,COUNT(b.job_id) AS demand_count
    ,ROUND(AVG(salary_year_avg),0) AS avg_Salary
FROM job_postings_fact a 
INNER JOIN skills_job_dim b ON a.job_id = b.job_id
INNER JOIN skills_dim c ON b.skill_id = c.skill_id
WHERE 
    job_title_short = 'Data Analyst'
  AND salary_year_avg IS NOT NULL
  AND job_work_from_home = TRUE
GROUP BY 
    c.skill_id
HAVING 
    COUNT(b.job_id) > 10
ORDER BY
    avg_Salary DESC
    ,demand_count DESC