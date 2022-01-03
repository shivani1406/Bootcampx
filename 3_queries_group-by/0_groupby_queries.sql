SELECT day, count(*) AS total_assignments
FROM assignments
GROUP BY day
ORDER BY day;


SELECT day, count(*) AS total_assignments
FROM assignments
GROUP BY day
HAVING count(*) >= 10
ORDER BY day;


SELECT cohorts.name, COUNT(students.id) as total_students
FROM cohorts JOIN students on cohort_id = cohorts.id
GROUP BY cohorts.name
HAVING COUNT(students.id) >= 18
ORDER BY COUNT(students.id) ;


SELECT cohorts.name, COUNT(assignment_submissions.*) as total_assignments
FROM cohorts JOIN students on cohort_id = cohorts.id
JOIN assignment_submissions on student_id = students.id
GROUP BY cohorts.name
ORDER BY COUNT(assignment_submissions.*) DESC;

SELECT students.name, AVG(assignment_submissions.duration) as avg_completion_time ,
AVG(assignments.duration) as avg_estimated_duration
FROM students JOIN assignment_submissions on student_id = students.id
JOIN assignments ON assignments.id = assignment_id
WHERE end_date IS NULL 
GROUP BY students.name
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY AVG(assignments.duration);
