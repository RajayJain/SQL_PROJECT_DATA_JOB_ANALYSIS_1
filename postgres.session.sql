WITH remote_job_skills AS (
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
LIMIT 10;