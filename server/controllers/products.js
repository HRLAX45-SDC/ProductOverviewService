const { url, Atelier } = require('../lib/AtelierAPI');
let URL = url.products;

const ERROR_MESSAGES = [
  'Unable to retrieve products from \'/products\'',
  'Unable to retrieve products from \'/products/:product_id\'',
  'Unable to retrieve products from \'/products/:product_id/styles\'',
  'Unable to retrieve products from \'/products/:product_id/related\'',
];

/* ======================
    /api/products
====================== */
module.exports = {
  list: (req, res) => {
    Atelier.get(URL)
      .then(response => res.status(response.status).json(response.data))
      .catch(err => res.status(404).json(ERROR_MESSAGES[0]));
  },
  product: (req, res) => {
    Atelier.get(`${URL}/${req.params.product_id}`)
      .then(response => res.status(response.status).json(response.data))
      .catch(err => res.status(404).json(ERROR_MESSAGES[1]));
  },
  styles: (req, res) => {
    Atelier.get(`${URL}/${req.params.product_id}/styles`)
      .then(response => res.status(response.status).json(response.data))
      .catch(err => res.status(404).json(ERROR_MESSAGES[2]));
  },
  related: (req, res) => {
    Atelier.get(`${URL}/${req.params.product_id}/related`)
      .then(response => res.status(response.status).json(response.data))
      .catch(err => res.status(404).json(ERROR_MESSAGES[3]));
  },
};