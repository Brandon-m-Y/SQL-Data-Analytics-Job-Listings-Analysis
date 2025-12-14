

Alter TABLE job_applied
ADD contact varchar(50);

update job_applied
set contact = 'Brandon Ytuarte'
where job_id = 101;

update job_applied
set contact = 'Erlich Bachman'
where job_id = 102;

update job_applied
set contact = 'Marie Curie'
where job_id = 103;

update job_applied
set contact = 'Nikola Tesla'
where job_id = 104;


select * from job_applied;

Alter TABLE job_applied
Rename COLUMN contact TO contact_name;

select * from job_applied;

Alter TABLE job_applied
Alter COLUMN contact_name type text

alter TABLE job_applied
drop column contact_name;

drop TABLE job_applied;