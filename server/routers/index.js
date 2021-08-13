const express = require('express');

const router = express.Router();

const products = require('./products');
const cart = require('./cart');

/* ======================
    /api
====================== */
router
  .use('/products', products)
  .use('/cart', cart);

module.exports = router;
