const dbUtils = require('../../db/dbUtils');

/* ======================
    /api/products
====================== */
module.exports = {
  list: (req, res) => {
    const { page, count } = req.query;
    dbUtils.getProducts(page, count)
      .then((result) => res.set(200).send(result.rows))
      .catch((e) => res.set(403).send(e.stack));
  },
  product: (req, res) => {
    const { product_id } = req.params;
    dbUtils.getProduct(product_id)
      .then((result) => res.set(200).send(result.rows[0]))
      .catch((e) => res.set(403).send(e.stack));
  },
  styles: (req, res) => {
    const { product_id } = req.params;
    dbUtils.getStyles(product_id)
      .then((result) => {
        const styleObj = { product_id };
        styleObj.results = result.rows;
        res.set(200).send(styleObj);
      })
      .catch((err) => res.set(403).send(err));
  },
  related: (req, res) => {
    const { product_id } = req.params;
    dbUtils.getRelated(product_id)
      .then((result) => res.set(200).send(result.rows[0].json_agg))
      .catch((e) => res.set(403).send(e.stack));
  },
};


// {
//   "product_id": "1",
//   "results": [
//   {
//           "style_id": 1,
//           "name": "Forest Green & Black",
//           "original_price": "140",
//           "sale_price": "0",
//           "default?": true,
//           "photos": [
//       {
//                   "thumbnail_url": "urlplaceholder/style_1_photo_number_thumbnail.jpg",
//                   "url": "urlplaceholder/style_1_photo_number.jpg"
//               },
//       {
//                   "thumbnail_url": "urlplaceholder/style_1_photo_number_thumbnail.jpg",
//                   "url": "urlplaceholder/style_1_photo_number.jpg"
//               }
//       // ...
//           ],
//       "skus": {
//                 "37": {
//                       "quantity": 8,
//                       "size": "XS"
//                 },
//                 "38": {
//                       "quantity": 16,
//                       "size": "S"
//                 },
//                 "39": {
//                       "quantity": 17,
//                       "size": "M"
//                 },
//           //...
//             }
//   },