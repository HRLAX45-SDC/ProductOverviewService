-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'products'
--
-- ---

DROP TABLE "products" CASCADE;

CREATE TABLE "products" (
  "id" bigserial NOT NULL,
  "name" VARCHAR(156) NULL DEFAULT NULL,
  "slogan" VARCHAR(500) NULL DEFAULT NULL,
  "descript" VARCHAR(500) NULL DEFAULT NULL,
  "category" VARCHAR(60) NULL DEFAULT NULL,
  "default_price" VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

-- ---
-- Table 'styles'
--
-- ---

DROP TABLE "styles" CASCADE;

CREATE TABLE "styles" (
  "id" bigserial NOT NULL,
  "id_products" INTEGER NULL DEFAULT NULL,
  "name" VARCHAR(200),
  "sale_price" VARCHAR(200) NULL DEFAULT NULL,
  "original_price" VARCHAR(200) NULL DEFAULT NULL,
  "default_style" VARCHAR(12) NULL DEFAULT 'false',
  PRIMARY KEY ("id")
);

-- ---
-- Table 'cart'
--
-- ---

DROP TABLE "carts" CASCADE;

CREATE TABLE "carts" (
  "id" bigserial NOT NULL,
  "user_session" bigint NOT NULL,
  "id_products" INTEGER DEFAULT NULL,
  "active" INT NOT NULL DEFAULT 0,
  PRIMARY KEY ("id")
);
-- ---
-- Table 'photos'
--
-- ---

DROP TABLE "photos" CASCADE;

CREATE TABLE "photos" (
  "id" bigserial NOT NULL,
  "id_styles" INTEGER NULL DEFAULT NULL,
  "url" TEXT NULL DEFAULT NULL,
  "thumburl" TEXT NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

-- ---
-- Table 'Feature'
--
-- ---

DROP TABLE "features" CASCADE;

CREATE TABLE "features" (
  "id" bigserial NOT NULL,
  "id_products" INTEGER NULL DEFAULT NULL,
  "feature" VARCHAR(100) NULL DEFAULT NULL,
  "value" VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

-- ---
-- Table 'inventory'
--
-- ---

DROP TABLE "inventory" CASCADE;

CREATE TABLE "inventory" (
  "id" bigserial NOT NULL,
  "id_styles" INTEGER NULL DEFAULT NULL,
  "size" varchar(10) NOT NULL DEFAULT NULL,
  "quantity" INTEGER NOT NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

DROP TABLE "related" CASCADE;

CREATE TABLE "related" (
"id" bigint NOT NULL,
"current_product_id" bigInt NOT NULL,
"related_product_id" bigInt NOT NULL,
PRIMARY KEY ("id")
);

-----
-- Perform CSV Loading
-----
COPY carts FROM '/Users/benbernardy/bootcamp/SDC/ProductOverview/csv_data/cart.csv' delimiter ',' csv header;

COPY features FROM '/Users/benbernardy/bootcamp/SDC/ProductOverview/csv_data/features.csv' delimiter ',' csv header;

COPY photos FROM '/Users/benbernardy/bootcamp/SDC/ProductOverview/csv_data/photos.csv' delimiter ',' csv header;

COPY products FROM '/Users/benbernardy/bootcamp/SDC/ProductOverview/csv_data/products.csv' delimiter ',' csv header;

COPY inventory FROM '/Users/benbernardy/bootcamp/SDC/ProductOverview/csv_data/inventory.csv' delimiter ',' csv header;

COPY styles FROM '/Users/benbernardy/bootcamp/SDC/ProductOverview/csv_data/styles.csv' delimiter ',' csv header;

COPY related FROM '/Users/benbernardy/bootcamp/SDC/ProductOverview/csv_data/related.csv' delimiter ',' csv header;

-- ---
-- Foreign Keys to be enabled after tables.sql created and loaded
-- ---

ALTER TABLE "styles" ADD FOREIGN KEY (id_products) REFERENCES "products" ("id");
ALTER TABLE "photos" ADD FOREIGN KEY (id_styles) REFERENCES "styles" ("id");
ALTER TABLE "features" ADD FOREIGN KEY (id_products) REFERENCES "products" ("id");
ALTER TABLE "inventory" ADD FOREIGN KEY (id_styles) REFERENCES "styles" ("id");
ALTER TABLE "carts" ADD FOREIGN KEY (id_products) REFERENCES "products" ("id");
ALTER TABLE "related" ADD FOREIGN KEY (current_product_id) REFERENCES "products" ("id");
ALTER TABLE "related" ADD FOREIGN KEY (related_product_id) REFERENCES "products" ("id");

-----
-- Create Indexes for FKs as psql doesn't do this automatically
-----

CREATE INDEX features_id_products_idx on features (id_products);
CREATE INDEX styles_id_products_idx on styles (id_products);
CREATE INDEX photos_id_products_idx on photos (id_styles);
CREATE INDEX inventory_id_products_idx on inventory (id_styles);
CREATE INDEX cart_id_products_idx on related (related_product_id);
CREATE INDEX related_current_product on related (current_product_id);