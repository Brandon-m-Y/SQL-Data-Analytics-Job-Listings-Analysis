/*
-- What are the most optimal skills to learn?
-- Identify skills in high demand and associated with high avg salaries for Data Analysts.
-- Concentrated on remote salaries with specified salaries
-- Why? Tagrgets skills that offer job security (high demand) and financial benefits (high salary),
   offfering strategic guidance for skill development in data analytics.
*/

WITH skills_demand AS
(
    SELECT
        skills_dim.skill_id, 
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst'
        AND job_work_from_home = TRUE
        AND salary_year_avg IS NOT NULL
    GROUP BY 
        skills_dim.skill_id

), average_salary AS
(
    SELECT
        skills_dim.skill_id, 
        skills,
        ROUND(AVG(salary_year_avg), 2) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst'
            AND salary_year_avg IS NOT NULL
            AND job_work_from_home = TRUE
    GROUP BY 
        skills_dim.skill_id

)

SELECT skills_demand.skill_id,
       skills_demand.skills,
       skills_demand.demand_count,
       average_salary.avg_salary
FROM skills_demand
INNER JOIN average_salary 
    ON skills_demand.skill_id = average_salary.skill_id
WHERE demand_count >= 20
      AND avg_salary >= 70000
ORDER BY 
    avg_salary DESC,
    demand_count DESC
         
LIMIT 25;

-- Result: Identified top skills for Data Analysts that are in high demand and offer competitive salaries.

-- Rewriting the same query more concisely.

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst'
    AND job_work_from_home = TRUE
    AND salary_year_avg IS NOT NULL
GROUP BY 
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) >= 20
    AND AVG(salary_year_avg) >= 70000
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;

-- Result: Same as above, but with a more concise query structure.
