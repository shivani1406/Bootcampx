SELECT id, name
FROM students
WHERE cohort_id = 1
ORDER BY name;

SELECT count(id)
FROM students 
WHERE cohort_id IN (1,2,3);

SELECT name, id, cohort_id 
FROM students
WHERE phone is NULL or email is NULL;


SELECT name, email, id, cohort_id 
FROM students
WHERE email NOT LIKE '%gmail.com' and phone is null;


SELECT name, id, cohort_id 
FROM students
WHERE end_date is null
ORDER BY cohort_id;


SELECT name, email, phone
FROM students
WHERE github is null
AND end_date IS NOT NULL;
