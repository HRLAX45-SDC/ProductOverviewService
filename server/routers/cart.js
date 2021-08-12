const express = require('express');
const router = express.Router();

const cart = require('../controllers/cart');

/*
    /api/cart
*/
router
  .get('/', cart.list);

router
  .post('/', cart.add);

module.exports = router;
