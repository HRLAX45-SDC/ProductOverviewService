# Atelier Investigation
  ## Challenges
   * Reconcile Atelier API endpoints with Front End interaction to find all endpoints that need service
   * Define shape of each returned by each response, so we can better understand DB schema requirements
   * Inspect FrontEnd to ensure it is accessing the points we expect.

## Actions
  * Spent 1.5 hours investigating the above.

## Results
  * Based on below research below, more accurately formed a few questions for Schema construction.
  * Identified next steps to consider
  * In NoSQL, why can't we combine the product info into single objects. This will allow all product queries to access the same db collection but with differently formed queries
  * Using SQL, these will still need to be separate tables with foreign keys? 
  * Also the non ACID complaint functioning of Mongo, may cause errors. Not robust. If a single NoSQL collection fails, then all product queries fail.
  
### Products

1. GET /products

parameter | Type | Description 
----------|------|------------
page      | integer | Selects the page of results to return Default 1
count | integer | specifies how many results per page. Default 5

Response: _Status 200 OK_ with JSON object
```JSON
[
  {
        "id": 1,
        "name": "Camo Onesie",
        "slogan": "Blend in to your crowd",
        "description": "The So Fatigues will wake you up and fit you in. This high energy camo will have you blending in to even the wildest surroundings.",
        "category": "Jackets",
        "default_price": "140"
    }
 ]
 ```
-----

2. GET /products/:product_id

param | Type | Descript
------|------|---------
product_id| integer | Required ID of the product requested as seen above.

Response: _Status 200 OK_ with JSON obj
``` JSON
{
    "id": 11,
    "name": "Air Minis 250",
    "slogan": "Full court support",
    "description": "This optimized air cushion pocket reduces impact but keeps a perfect balance underfoot.",
    "category": "Basketball Shoes",
    "default_price": "0",
    "features": [
  	{
            "feature": "Sole",
            "value": "Rubber"
        },
  	{
            "feature": "Material",
            "value": "FullControlSkin"
        }
    ],
}
``` 
-----
3. GET /product/:product_id/styles

param | Type | Descript
------|------|---------
product_id| integer | Required ID of the product requested as seen above.

Response _Status 200 OK_ with JSON obj with product Id and array of styleID objects
```JSON
{
    "product_id": "1",
    "results": [
  	{
            "style_id": 1,
            "name": "Forest Green & Black",
            "original_price": "140",
            "sale_price": "0",
            "default?": true,
            "photos": [
  			{
                    "thumbnail_url": "urlplaceholder/style_1_photo_number_thumbnail.jpg",
                    "url": "urlplaceholder/style_1_photo_number.jpg"
                },
  			{
                    "thumbnail_url": "urlplaceholder/style_1_photo_number_thumbnail.jpg",
                    "url": "urlplaceholder/style_1_photo_number.jpg"
                }
  			// ...
            ],
        "skus": {
                	"37": {
                    		"quantity": 8,
                    		"size": "XS"
                	},
                	"38": {
                    		"quantity": 16,
                    		"size": "S"
                	},
                	"39": {
                    		"quantity": 17,
                    		"size": "M"
                	},
            //...
            	}
    },
```
4. GET /products/:productId/related

param | Type | Descript
------|------|---------
product_id| integer | Required ID of the product requested as seen above.

Returns _Status 200 OK_ with JSON array of related product Id's
```JSON
[
  2,
  3,
  8,
  7
]
```
----
### CART

1. GET /cart

Responds: _Status 200 OK_ with JSON array of items where sku_id is === specific sku within product styles
```JSON
[
    {
        "sku_id": 1,
        "count": 2
    },
    {
        "sku_id": 3,
        "count": 1
    },
    {
        "sku_id": 5,
        "count": 33
    }
 ]
 ```
 
 2. POST /cart

param | Type | Descript
------|------|---------
sku_id| integer | ID for the product style /size added to cart
 
 Responds: _Status 201 CREATED_
