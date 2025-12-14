SELECT job_posted_date
from job_postings_fact
limit 10;

SELECT 
    job_title_short as job_title,
    job_posted_date as date,
    job_location as location
FROM job_postings_fact

SELECT 
    job_title_short as job_title,
    job_posted_date::date as date,
    job_location as location
FROM job_postings_fact


SELECT 
    job_title_short as job_title,
    job_posted_date at time zone 'UTC' at time zone 'EST'as date,
    job_location as location
FROM job_postings_fact
limit 10;

SELECT 
    job_title_short as job_title,
    job_posted_date at time zone 'UTC' at time zone 'EST'as date,
    job_location as location,
    extract (month from job_posted_date) as month
FROM job_postings_fact
limit 10;

SELECT 
    job_title_short as job_title,
    job_posted_date at time zone 'UTC' at time zone 'EST'as date,
    job_location as location,
    extract (month from job_posted_date) as month,
    extract (year from job_posted_date) as year
FROM job_postings_fact
limit 10;


SELECT
    job_id,
    extract(month from job_posted_date) as month
FROM job_postings_fact
LIMIT 10;

SELECT
    count(job_id),
    extract(month from job_posted_date) as month
FROM job_postings_fact
GROUP BY month
LIMIT 10;


SELECT
    count(job_id) as job_posted_count,
    extract(month from job_posted_date) as month
FROM job_postings_fact
where job_title_short = 'Data Scientist'
GROUP BY month
ORDER BY job_posted_count DESC;


SELECT * 
FROM job_postings_fact
WHERE extract(month from job_posted_date) = 1
limit 10;


-- January
CREATE TABLE january_jobs AS 
SELECT * 
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- February
CREATE TABLE february_jobs AS 
SELECT * 
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March
CREATE TABLE march_jobs AS 
SELECT * 
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

-- April
CREATE TABLE april_jobs AS 
SELECT * 
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 4;

-- May
CREATE TABLE may_jobs AS 
SELECT * 
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 5;

-- June
CREATE TABLE june_jobs AS 
SELECT * 
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 6;

-- July
CREATE TABLE july_jobs AS 
SELECT * 
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 7;

-- August
CREATE TABLE august_jobs AS 
SELECT * 
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 8;

-- September
CREATE TABLE september_jobs AS 
SELECT * 
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 9;

-- October
CREATE TABLE october_jobs AS 
SELECT * 
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 10;

-- November
CREATE TABLE november_jobs AS 
SELECT * 
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 11;

-- December
CREATE TABLE december_jobs AS 
SELECT * 
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 12;


