# Introduction
Dive into data job market! Focusing on Data Analyst roles, this project explores top_paying jobs, in-demand skills, and where high demand meets high salary in data analytics.

SQL Queries? Check them out here: [project_sql folder](/project_sql/)

# Background
Driven by a quest to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others work to find optimal jobs.

### The question I wanted to answer through my SQL queries were:

1. What are the top paying Data Analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I used
For my deep dive into data analyst job market, I harnesed the power of several key tools:

- **SQL:** The back bone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL:** The chosen data management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management and executing sql-queries.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking. 

# The Analysis
Each query for the project aimed at investing specific aspects of the data analyst job market. Here's how I approeched each question:

### 1. Top Paying Data Anakyst Jobs
To identify the highest-paying roles, I filtered Data Analyst posistion by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.
```sql
SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM job_postings_fact 
LEFT JOIN company_dim 
    ON company_dim.company_id = job_postings_fact.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
LIMIT 10
```
Here's the breakdown, of the top data analyst jobs in 2023:

- **Wide Salary Range:** Top paying data analyst roles span from $184,000 to $650,000 indicating significant salary potential in the field
- **Diverse Employers:** Companies like SmartAsset, Meta, and AT&T are among those offering high salaries, showing a broad interest accross different industries.
- **Job Title Variety:** There is a high diversity in job titles, from the Data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics. 

![Top paying roles](assets\aaa.png)

*Bar graph visualizing the salary for the top 10 salaries for data analyst; ChatGPT generated this grapgh from my SQL query results*

# What I learned

Throughout this adventure, I have turbocharged my SQL toolkit with some serious firepower.

- **Complex Qury Crafting:** Mastered the art of advanced SQL, merging tables like a pro and wielding WITH clauses for ninja-level temp table maneuvers.
- **Data Agregation:** Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data summarizing sidekicks. 
- **Analytical Wizardry:** Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries. 

# Conclusions

### Insights
1. **Top-Paying Data Analyst Jobs**: The highest-paying jobs for Data Analyst that allow remote work offer a wide range of salaries, the highest at $650,000!
2. **Skills or Top-Paying Jobs**: High-paying data analyst jobs require advanced proficiency in SQL, suggesting it is a critical skill for earning a top  salary.
3. **Most In-Demand Skills**: SQL is also the most demanded skill in the data analyst job market, thus making it essential for job seekers.
4. **Skills For Higher Salaries**: Spesialized skills, such as SVN and Solidity, are associated with highest average salaries, indicating a premium on niche expertise.
5. **Optimal Skills for Job Market Value**: SQL leads in demand and offers for a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize there market value. 

### Closing Thoughts
This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings of the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data anlysts can better posistion themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics.
