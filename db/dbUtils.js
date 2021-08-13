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
  getProduct: (id) => pool.query(
    `SELECT products.*, features.feature, features.value
    FROM products
    INNER JOIN features
    ON products.id=features.id_products
    WHERE products.id =${id};`,
  ),
  getStyles: (id) => pool.query(
    `SELECT *
    FROM styles
    INNER JOIN products
    ON styles.id_products=products.id
    WHERE products.id=${id}`,
  ),
  // getRelated: (id) => pool.query(

  // )

};

module.exports = dbUtils;
