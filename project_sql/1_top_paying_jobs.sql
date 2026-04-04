/*
Questions:
1. Identify top 10 highest-paying DATA ANALYST roles that are available remotely.
2. Focus on job postings with specified salaries (remove nulls)
3. Highlight the top-paying oppurtunities for DATA ANALYSTS*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS Company_Name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10