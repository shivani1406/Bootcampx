SELECT Count(assistance_requests.id) as total_assistances, teachers.name
FROM assistance_requests Join teachers on
assistance_requests.teacher_id = teachers.id
Where teachers.name = 'Waylon Boehm'
GROUP BY teachers.name;


Select Count(assistance_requests.id) as total_assistances, students.name
From assistance_requests Join students on
student_id = students.id
Where students.name = 'Elliot Dickinson'
GROUP BY students.name;


Select teachers.name, students.name, assignments.name, (completed_at - started_at) as duration
FROM assistance_requests Join teachers on
assistance_requests.teacher_id = teachers.id
Join students on student_id = students.id
LEFT Join assignments on assignment_id = assignments.id
ORDER BY (completed_at - started_at);


Select AVG (completed_at - started_at) as average_assistance_request_duration
FROM assistance_requests;

Select cohorts.name, AVG (completed_at - started_at) as average_assistance_time
FROM assistance_requests JOIN students on
student_id = students.id
JOIN cohorts on cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY average_assistance_time;

Select cohorts.name, AVG (completed_at - started_at) as average_assistance_time
FROM assistance_requests JOIN students on
student_id = students.id
JOIN cohorts on cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY average_assistance_time DESC
Limit 1;


Select AVG (started_at - created_at) as average_assistance_request_duration
FROM assistance_requests;

Select cohorts.name, SUM(completed_at - started_at) as total_duration
FROM assistance_requests JOIN students on
student_id = students.id
JOIN cohorts on cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY total_duration;

Select avg(a.total_duration) as average_total_duration FROM (
Select cohorts.name, SUM(completed_at - started_at) as total_duration
FROM assistance_requests JOIN students on
student_id = students.id
JOIN cohorts on cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY total_duration) a;


Select assignments.id, assignments.name,  day, chapter, COUNT(assistance_requests.id) as total_requests
FROM assignments JOIN assistance_requests on
assignments.id = assignment_id
GROUP BY assignments.id, assignments.name,  day, chapter
ORDER BY total_requests DESC;


SElect day, COUNT(assignments.id), SUM(duration) From assignments
GROUP BY day
ORDER BY day;


SELECT distinct teachers.name, cohorts.name FROM 
assistance_requests JOIN teachers  on teacher_id = teachers.id
JOIN students on student_id = students.id
JOIN cohorts on cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
ORDER BY teachers.name;


SELECT distinct teachers.name, cohorts.name, COUNT(assistance_requests.id) FROM 
assistance_requests JOIN teachers  on teacher_id = teachers.id
JOIN students on student_id = students.id
JOIN cohorts on cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;
