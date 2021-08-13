const pg = require('pg');

const pool = new pg.Pool({
  // Connection info for pool. Note to not call pool.end() till program end.
  user: 'postgres',
  host: '127.0.0.1',
  database: 'prod_over',
  password: '123qwe!@#QWE',
  port: 5432,
});

pool.query('SELECT NOW()', (err, res) => {
  console.log(err ? err:'Postgres connection established')
;});

module.exports = pool;
