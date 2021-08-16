
const productSchema = new mongoose.Schema({
  prod_id: Number, // from product_id
  name: String, // from product name
  slogan: String, // from slogan
  descript: String, // from description
  category: String, // from category
  default_price: String, // from default_price
  styles: Array // array of style_ids
})

const stylesSchema = new mongoose.Schema({
  style_id: Number, // from style
  sale_price: String,
  default: Boolean,
  thumbs: Array, // Array of thumbs
  photos: Array, // Array of full resolution
  skus: Array // array of size skus and quantities
})

const photosSchema = new mongoose.Schema({
  photo_id: Number, //index
  thumb: String, // url path
  url: String // url path
})

// Document Schema to be used in Inventory and Cart entries
const inventorySchema = new mongoose.Schema({
  sku: Number, // index
  quantity: Number
})

const featureSchema = new mongoose.Schema({
  feature_id: Number, // index
  feature: String,
  value: String
})

const cartSchema = new mongoose.Schema({
  cart_id: Number, // index
  cart: Array // of Inventory documents.
})



