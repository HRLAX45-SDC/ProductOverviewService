const pg = require('pg');
const DB_PASS = process.env.DB_PASS;
const USER = process.env.USER;
const DB = process.env.DB
const DB_PORT = process.env.DB_PORT;
const HOST = process.env.HOST;

const pool = new pg.Pool({
  // Connection info for pool. Note to not call pool.end() till program end.
  user: USER,
  host: HOST,
  database: DB,
  password: DB_PASS,
  port: DB_PORT,
});

pool.query('SELECT NOW()', (err, res) => {
  console.log(err ? err:'Postgres connection established')
;});

module.exports = pool;
