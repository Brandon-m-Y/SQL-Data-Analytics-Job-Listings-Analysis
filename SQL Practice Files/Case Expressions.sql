select 
count(job_id) as number_of_jobs,
    job_title_short,
    job_location,
    case
        when job_location = 'Anywhere' then 'Remote'
        when job_location = 'New York, NY' then 'Local'
        else 'On Site'
    end as location_category

from job_postings_fact

where job_title_short = 'Data Scientist'
GROUP BY location_category, job_location, job_title_short;


/* 
Label new column as follows based on job_location:
- 'Anywhere' jobs as 'Remote'
- 'New York, NY' jobs as  'Local'
- Otherwise 'Onsite'
*/

SELECT 
	COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category
ORDER BY    
    number_of_jobs DESC;
