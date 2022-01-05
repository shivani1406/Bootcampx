const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortName = process.argv[2];
const values = [`${cohortName}`];
pool.query(`
SELECT distinct teachers.name as t_name, cohorts.name as c_name FROM 
assistance_requests JOIN teachers  on teacher_id = teachers.id
JOIN students on student_id = students.id
JOIN cohorts on cohort_id = cohorts.id
WHERE cohorts.name = $1 
ORDER BY teachers.name;
`,values)

.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.c_name}: ${user.t_name}`);
  })
})
.catch(err => console.error('query error', err.stack));