SELECT
    job_title AS Title,
    job_location AS Location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'IST' AS Date_Time,
    EXTRACT (MONTH FROM job_posted_date) AS Date_Month,
    EXTRACT (YEAR FROM job_posted_date) AS Date_Year
FROM
job_postings_fact
LIMIT 10;


/*SELECT
    job_id,
    EXTRACT (MONTH FROM job_posted_date) AS MONTH
FROM
job_postings_fact
LIMIT 10;*/


/*SELECT
    COUNT(job_id) AS Job_Posted_Count,
    EXTRACT (MONTH FROM job_posted_date) AS MONTH
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    MONTH
ORDER BY
    Job_Posted_Count DESC;*/

--January Jobs
/*CREATE TABLE january_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 1;

-- February Jobs
CREATE TABLE february_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March Jobs
CREATE TABLE march_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;*/


/*SELECT job_posted_date
FROM march_jobs;*/


/*SELECT 
    job_title_short,
    job_location
FROM
    job_postings_fact;*/
/*
Label new column as follows:
'Anywhere' jobs AS 'Remote'
'New York, NY' jobs AS Local
Otherwise 'Onsite'
*/

/*SELECT
    COUNT(job_id) AS Number_Of_Jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS Location_Category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    Location_Category;*/


/*SELECT *
FROM  (--Subquery starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS January_Jobs; --Subquery ends here*/


/*WITH company_job_count AS (
    SELECT
            company_id,
            COUNT(*) AS Total_Jobs
    FROM 
            job_postings_fact
    GROUP BY
            company_id
)

SELECT company_dim.name AS Company_Name, company_job_count.Total_Jobs
FROM company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY 
    Total_Jobs DESC*/


/*Find the count of the number of remote job postings per skill
Display the top 5 skilss by their demand in remote jobs
Include skill ID, name, & count of posts requiring the skill*/


/* Find the count of the number of remote job postingsn per skill
Display the top 5 skills by their demand in remote jobs
Include skill_id, name, count of postings requiring the skill*/


/*WITH remote_job_skills AS (
    SELECT
        skill_id, COUNT (*) AS Skill_Count
    FROM skills_job_dim AS Skills_To_Job
    INNER JOIN job_postings_fact AS Job_Postings ON Job_Postings.job_id = Skills_To_Job.job_id 
    WHERE
        job_postings.job_work_from_home = TRUE AND
        job_postings.job_title_short = 'Data Aalyst'
    GROUP BY
        skill_id
)

SELECT
    skills.skill_id,
    skills AS skill_name, Skill_Count
FROM remote_job_skills
INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id
ORDER BY 
    Skill_Count DESC
LIMIT 10;*/