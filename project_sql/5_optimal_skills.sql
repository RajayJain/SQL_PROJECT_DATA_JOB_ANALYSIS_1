/*
Questions:
-What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)? 
-Identify skills in high demand and associated with high average salaries for Data Analyst roles 
-Concentrates on remote positions with specified salaries
-Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
    offering strategic insights for career development in data analysis
*/

WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS Demand_Count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = 'True'
    GROUP BY
        skills_dim.skill_id
), average_salary AS (
    SELECT
        skills_job_dim.skill_id, ROUND(AVG(salary_year_avg), 3) AS Average_Salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        --AND job_work_from_home = 'True'
    GROUP BY
        skills_job_dim.skill_id
)
SELECT skills_demand.skill_id, skills_demand.skills, Demand_Count, Average_Salary
FROM skills_demand
INNER JOIN Average_Salary ON skills_demand.skill_id = Average_Salary.skill_id
ORDER BY Demand_Count DESC, Average_Salary DESC
LIMIT 25

/*
To become an "optimal" earner, you should start with the core skills (SQL, Python, Tableau) 
but immediately branch into one of these specialized paths. 
The data strongly suggests that the easiest bridge from a standard Data Analyst to a $130k+ earner is to learn 
Data Engineering (Airflow, Kafka) or Machine Learning (PyTorch, Hugging Face).

[
  {
    "skill_id": 224,
    "skills": "svn",
    "demand_count": "2502",
    "average_salary": "400000.000"
  },
  {
    "skill_id": 38,
    "skills": "solidity",
    "demand_count": "2502",
    "average_salary": "179000.000"
  },
  {
    "skill_id": 65,
    "skills": "couchbase",
    "demand_count": "2502",
    "average_salary": "160515.000"
  },
  {
    "skill_id": 206,
    "skills": "datarobot",
    "demand_count": "2502",
    "average_salary": "155485.500"
  },
  {
    "skill_id": 27,
    "skills": "golang",
    "demand_count": "2502",
    "average_salary": "155000.000"
  },
  {
    "skill_id": 109,
    "skills": "mxnet",
    "demand_count": "2502",
    "average_salary": "149000.000"
  },
  {
    "skill_id": 119,
    "skills": "dplyr",
    "demand_count": "2502",
    "average_salary": "147633.333"
  },
  {
    "skill_id": 73,
    "skills": "vmware",
    "demand_count": "2502",
    "average_salary": "147500.000"
  },
  {
    "skill_id": 212,
    "skills": "terraform",
    "demand_count": "2502",
    "average_salary": "146733.833"
  },
  {
    "skill_id": 250,
    "skills": "twilio",
    "demand_count": "2502",
    "average_salary": "138500.000"
  },
  {
    "skill_id": 220,
    "skills": "gitlab",
    "demand_count": "2502",
    "average_salary": "134126.000"
  },
  {
    "skill_id": 98,
    "skills": "kafka",
    "demand_count": "2502",
    "average_salary": "129999.163"
  },
  {
    "skill_id": 222,
    "skills": "puppet",
    "demand_count": "2502",
    "average_salary": "129820.000"
  },
  {
    "skill_id": 100,
    "skills": "keras",
    "demand_count": "2502",
    "average_salary": "127013.333"
  },
  {
    "skill_id": 101,
    "skills": "pytorch",
    "demand_count": "2502",
    "average_salary": "125226.200"
  },
  {
    "skill_id": 31,
    "skills": "perl",
    "demand_count": "2502",
    "average_salary": "124685.750"
  },
  {
    "skill_id": 223,
    "skills": "ansible",
    "demand_count": "2502",
    "average_salary": "124370.000"
  },
  {
    "skill_id": 121,
    "skills": "hugging face",
    "demand_count": "2502",
    "average_salary": "123950.000"
  },
  {
    "skill_id": 99,
    "skills": "tensorflow",
    "demand_count": "2502",
    "average_salary": "120646.833"
  },
  {
    "skill_id": 63,
    "skills": "cassandra",
    "demand_count": "2502",
    "average_salary": "118406.682"
  },
  {
    "skill_id": 238,
    "skills": "notion",
    "demand_count": "2502",
    "average_salary": "118091.667"
  },
  {
    "skill_id": 219,
    "skills": "atlassian",
    "demand_count": "2502",
    "average_salary": "117965.600"
  },
  {
    "skill_id": 218,
    "skills": "bitbucket",
    "demand_count": "2502",
    "average_salary": "116711.750"
  },
  {
    "skill_id": 96,
    "skills": "airflow",
    "demand_count": "2502",
    "average_salary": "116387.261"
  },
  {
    "skill_id": 3,
    "skills": "scala",
    "demand_count": "2502",
    "average_salary": "115479.534"
  }
]
*/