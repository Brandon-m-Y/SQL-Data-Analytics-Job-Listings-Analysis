-- @conn sql_course

INSERT INTO job_applied(
    job_id,
    application_sent_date,
    custome_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
    status

)
VALUES (
    101,
    '2024-06-15',
    TRUE,
    'john_doe_resume.pdf',
    TRUE,
    'john_doe_cover_letter.pdf',
    'Under Review'
),
(
    102,
    '2024-06-16',
    FALSE,
    NULL,
    FALSE,
    NULL,
    'Applied'
),
(
    103,
    '2024-06-17',
    TRUE,
    'jane_smith_resume.pdf',
    TRUE,
    'jane_smith_cover_letter.pdf',
    'Interview Scheduled'
),
(
    104,
    '2024-06-18',
    FALSE,
    NULL,
    TRUE,
    'alex_jones_cover_letter.pdf',
    'Rejected'
);
