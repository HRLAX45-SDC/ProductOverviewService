const pg = require('pg');

const pool = new pg.Pool({

  user: 'postgres',
  host: '3.101.144.40',
  database: 'po',
  password: 'docker',
  port: 3001,
});

pool.query('SELECT NOW()', (err, res) => {
  console.log(err ? err:'Postgres connection established')
;});

module.exports = pool;
