-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'products'
--
-- ---

-- DROP TABLE IF EXISTS "products";

CREATE TABLE "products" (
  "id" bigserial NOT NULL,
  "name" VARCHAR(156) NULL DEFAULT NULL,
  "slogan" VARCHAR(256) NULL DEFAULT NULL,
  "descript" VARCHAR(320) NULL DEFAULT NULL,
  "category" VARCHAR(60) NULL DEFAULT NULL,
  "default_price" VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

-- ---
-- Table 'styles'
--
-- ---

-- DROP TABLE IF EXISTS "styles";

CREATE TABLE "styles" (
  "id" bigserial NOT NULL,
  "id_products" INTEGER NULL DEFAULT NULL,
  "sale_price" VARCHAR(60) NULL DEFAULT NULL,
  "default_disp" VARCHAR(12) NULL DEFAULT 'false',
  PRIMARY KEY ("id")
);

-- ---
-- Table 'cart'
--
-- ---

-- DROP TABLE IF EXISTS "cart";

CREATE TABLE "cart" (
  "id" bigserial NOT NULL,
  "id_products" INTEGER DEFAULT NULL,
  "sale_price" VARCHAR(60) NULL DEFAULT NULL,
  "default_disp" VARCHAR(12) NULL DEFAULT 'false',
  PRIMARY KEY ("id")
);
-- ---
-- Table 'photos'
--
-- ---

-- DROP TABLE IF EXISTS "photos";

CREATE TABLE "photos" (
  "id" bigserial NOT NULL,
  "id_styles" INTEGER NULL DEFAULT NULL,
  "thumb" VARCHAR(300) NULL DEFAULT NULL,
  "url" VARCHAR(300) NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

-- ---
-- Table 'Feature'
--
-- ---

DROP TABLE IF EXISTS "feature";

CREATE TABLE "feature" (
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

DROP TABLE IF EXISTS "inventory";

CREATE TABLE "inventory" (
  "id" bigserial NOT NULL,
  "id_styles" INTEGER NULL DEFAULT NULL,
  "sku" INTEGER NULL DEFAULT NULL,
  "quantity" INTEGER NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE "styles" ADD FOREIGN KEY (id_products) REFERENCES "products" ("id");
ALTER TABLE "photos" ADD FOREIGN KEY (id_styles) REFERENCES "styles" ("id");
ALTER TABLE "feature" ADD FOREIGN KEY (id_products) REFERENCES "products" ("id");
ALTER TABLE "inventory" ADD FOREIGN KEY (id_styles) REFERENCES "styles" ("id");
ALTER TABLE "cart" ADD FOREIGN KEY (id_products) REFERENCES "products" ("id");

-- ---
-- Table Properties
-- ---

-- ALTER TABLE "products" ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE "styles" ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE "photos" ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE "Feature" ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE "inventory" ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO "products" ("id","name","slogan","descript","category","default_price") VALUES
-- ('','','','','','');
-- INSERT INTO "styles" ("id","id_products","sale_price","default_disp") VALUES
-- ('','','','');
-- INSERT INTO "photos" ("id","id_styles","thumb","url") VALUES
-- ('','','','');
-- INSERT INTO "Feature" ("id","id_products","feature","value") VALUES
-- ('','','','');
-- INSERT INTO "inventory" ("id","id_styles","sku","quantity") VALUES
-- ('','','','');