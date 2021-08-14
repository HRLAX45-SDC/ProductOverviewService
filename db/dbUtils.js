const pool = require('./index');

const dbUtils = { // 1 , 6
  getProducts: (page = 0, count = 5) => {
    const pageInt = Number(page);
    const countInt = Number(count);
    const start = pageInt * countInt;
    const end = start + countInt;
    return pool.query(
      `SELECT
        id::int,
        name,
        slogan,
        descript as description,
        category,
        default_price
      FROM products WHERE id >= ${start} AND id <=${end};`,
    );
  },
  getProduct: (id) => pool.query(
    `SELECT
    products.id::int,
    products.name,
    products.slogan,
    products.descript as description,
    products.category,
    products.default_price,
    ( SELECT json_agg(json_build_object(
      'feature', features.feature,
      'value', features.value)) as features
      FROM features
      WHERE features.id_products=products.id
    )
    FROM products
    WHERE products.id =${id};`,
  ),
  getStyles: (id) => pool.query(
    `SELECT
    styles.id::int as style_id,
    styles.name as name,
    styles.original_price as original_price,
    styles.sale_price as sale_price,
    styles.default_style::bool as "default?",
      ( SELECT json_object_agg( inventory.id, json_build_object(
        'size', inventory.size,
        'quantity', inventory.quantity)) as sku
        FROM inventory
        WHERE inventory.id_styles=styles.id
      ),
      ( SELECT json_agg(json_build_object(
        'url', url,
        'thumbnail_url', thumburl)) AS photos
        FROM photos
        WHERE photos.id_styles=styles.id
      )
    FROM styles
    WHERE styles.id_products=${id};`,
  ),
  getRelated: (id) => pool.query(
    `SELECT json_agg(related_product_id)
    FROM related
    WHERE current_product_id=${id}`,
  ),

};

module.exports = dbUtils;
