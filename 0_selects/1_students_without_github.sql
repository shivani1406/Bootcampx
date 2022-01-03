SELECT id, name, email, cohort_id
FROM students
WHERE github is null 
ORDER BY cohort_id;
