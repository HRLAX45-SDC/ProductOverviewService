const { url, Atelier } = require('../lib/AtelierAPI');
let URL = url.cart;

const ERROR_MESSAGES = [
  'Unable to get from cart at \'/cart\'',
  'Unable to post to cart at \'/cart\'',
];

/* ======================
    /api/cart
====================== */
module.exports = {
  list: (req, res) => {
    Atelier.get(URL)
      .then(response => res.status(response.status).json(response.data))
      .catch(err => res.status(404).send(ERROR_MESSAGES[0]));
  },
  add: (req, res) => {
    Atelier.post(URL, req.body)
      .then(response => res.status(response.status).json(response.data))
      .catch(err => res.status(404).send(ERROR_MESSAGES[1]));
  },
};