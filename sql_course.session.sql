SELECT *
FROM job_postings_fact
LIMIT 100;

/*
🟨 Problem 2
CASE Statements
Problem Statement
Count the number of unique companies that offer 
work from home (WFH) versus those requiring work 
to be on-site. Use the job_postings_fact table to 
count and compare the distinct companies based on 
their WFH policy (job_work_from_home).

Hint
Use COUNT with DISTINCT to ensure each company is only counted once, even if they have multiple job postings.
Use CASE WHEN to separate companies based on their WFH policy (job_work_from_home column).
*/

SELECT 
    COUNT(DISTINCT CASE WHEN job_work_from_home = TRUE THEN company_id END) AS wfh_companies,
    COUNT(DISTINCT CASE WHEN job_work_from_home = FALSE THEN company_id END) AS non_wfh_companies
FROM job_postings_fact

/*
🟥  Problem 3
*/

SELECT
    job_id,
    salary_year_avg,
    (CASE
        WHEN job_title ILIKE '%Senior%' THEN 'Senior'
        WHEN job_title ILIKE '%Manager%' OR 
             job_title ILIKE 'Lead' THEN 'Lead/Manager'
        WHEN job_title ILIKE 'Junior' OR 
             job_title ILIKE 'ENTRY' THEN 'Junior/Entry'
        ELSE 'Not Specified' END)AS experience_level,
    (CASE
        WHEN job_work_from_home = TRUE THEN 'Yes'
        ELSE 'No' END)AS remote_option
FROM
    job_postings_fact
WHERE
    salary_year_avg IS NOT NULL
ORDER BY
    job_id;