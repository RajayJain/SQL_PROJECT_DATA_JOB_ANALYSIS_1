/*
Questions: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions 
- Focuses on roles with specified salaries, regardless of location 
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills, ROUND(AVG(salary_year_avg), 3) AS Average_Salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    --AND job_work_from_home = 'True'
GROUP BY
    skills
ORDER BY
    Average_Salary DESC
LIMIT 25

/*
This dataset shows that to break into the $130k–$180k+ salary tiers, you need to specialize. 
The biggest premiums are paid to analysts who expand their skill sets into Deep Learning (PyTorch/TensorFlow), 
Data Engineering/DevOps (Kafka/Terraform/Airflow), or niche domains like Blockchain (Solidity).

[
  {
    "skills": "svn",
    "average_salary": "400000.000"
  },
  {
    "skills": "solidity",
    "average_salary": "179000.000"
  },
  {
    "skills": "couchbase",
    "average_salary": "160515.000"
  },
  {
    "skills": "datarobot",
    "average_salary": "155485.500"
  },
  {
    "skills": "golang",
    "average_salary": "155000.000"
  },
  {
    "skills": "mxnet",
    "average_salary": "149000.000"
  },
  {
    "skills": "dplyr",
    "average_salary": "147633.333"
  },
  {
    "skills": "vmware",
    "average_salary": "147500.000"
  },
  {
    "skills": "terraform",
    "average_salary": "146733.833"
  },
  {
    "skills": "twilio",
    "average_salary": "138500.000"
  },
  {
    "skills": "gitlab",
    "average_salary": "134126.000"
  },
  {
    "skills": "kafka",
    "average_salary": "129999.163"
  },
  {
    "skills": "puppet",
    "average_salary": "129820.000"
  },
  {
    "skills": "keras",
    "average_salary": "127013.333"
  },
  {
    "skills": "pytorch",
    "average_salary": "125226.200"
  },
  {
    "skills": "perl",
    "average_salary": "124685.750"
  },
  {
    "skills": "ansible",
    "average_salary": "124370.000"
  },
  {
    "skills": "hugging face",
    "average_salary": "123950.000"
  },
  {
    "skills": "tensorflow",
    "average_salary": "120646.833"
  },
  {
    "skills": "cassandra",
    "average_salary": "118406.682"
  },
  {
    "skills": "notion",
    "average_salary": "118091.667"
  },
  {
    "skills": "atlassian",
    "average_salary": "117965.600"
  },
  {
    "skills": "bitbucket",
    "average_salary": "116711.750"
  },
  {
    "skills": "airflow",
    "average_salary": "116387.261"
  },
  {
    "skills": "scala",
    "average_salary": "115479.534"
  }
]
*/