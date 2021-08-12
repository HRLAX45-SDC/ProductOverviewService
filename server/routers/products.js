const express = require('express');
const router = express.Router();

const products = require('../controllers/products');

/*
    /api/products
*/
router
  .get('/', products.list)
  .get('/:product_id', products.product)
  .get('/:product_id/styles', products.styles)
  .get('/:product_id/related', products.related);

module.exports = router;