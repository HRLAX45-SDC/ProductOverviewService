const pool = require('./index');

const dbUtils = { // 1 , 6
  getProducts: (page = 0, count = 5) => {
    const pageInt = Number(page);
    const countInt = Number(count);
    const start = pageInt * countInt;
    const end = start + countInt;
    return pool.query(
      `SELECT * from products WHERE id >= ${start} AND id <=${end};`,
    );
  },
  getProduct: (id) => pool.query(`SELECT * from products WHERE id =${id}`),

};

module.exports = dbUtils;
