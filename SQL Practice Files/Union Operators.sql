-- Get jobs and companies from January
SELECT 
	job_title_short,
	company_id,
	job_location
FROM
	january_jobs

UNION ALL

-- Get jobs and companies from February 
SELECT 
	job_title_short,
	company_id,
	job_location
FROM
	february_jobs

UNION ALL -- combine another table

-- Get jobs and companies from March
SELECT 
	job_title_short,
	company_id,
	job_location
FROM
	march_jobs


###############################


 select 
    job_location
   job_title_short,
   company_id
from january_jobs

UNION all

 select 
    job_location
   job_title_short,
   company_id
from february_jobs

UNION all

 select 
    job_location
   job_title_short,
   company_id
from march_jobs

###############################

select 
    quarter_one_job_postings.job_title_short,
    quarter_one_job_postings.job_location,
    quarter_one_job_postings.job_via,
    quarter_one_job_postings.job_posted_date::date,
    quarter_one_job_postings.salary_year_avg
from (

select * 
from january_jobs
union ALL
select *
from february_jobs
union ALL
select *
from march_jobs

) as quarter_one_job_postings

where quarter_one_job_postings.salary_year_avg > 70000 AND
        quarter_one_job_postings.job_title_short = 'Data Scientist'