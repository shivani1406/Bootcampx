const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

// const id = process.argv[3];

// pool.query(`
// SELECT id, name, cohort_id
// FROM students
// LIMIT 5;
// `)
// .then(res => {
//   console.log(res.rows);
// })
// pool.query(`
// SELECT students.id as user_id, students.name as user_name, cohorts.name as cohort_name
// FROM students JOIN cohorts ON cohorts.id = cohort_id
// LIMIT 5;
// `)
const cohortName = process.argv[2];
const limit = process.argv[3] || 5;
const values = [`%${cohortName}%`, limit];
pool.query(`
SELECT students.id as user_id, students.name as user_name, cohorts.name as cohort_name
FROM students JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name like $1
LIMIT $2;
`,values)

.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.user_name} has an id of ${user.user_id} and was in the ${user.cohort_name} cohort`);
  })
})
.catch(err => console.error('query error', err.stack));