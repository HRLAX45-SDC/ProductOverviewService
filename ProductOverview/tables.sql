-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'products'
--
-- ---

DROP TABLE IF EXISTS "products";

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

DROP TABLE IF EXISTS "styles";

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

DROP TABLE IF EXISTS "carts";

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

DROP TABLE IF EXISTS "photos";

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

DROP TABLE IF EXISTS "features";

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

DROP TABLE IF EXISTS "inventory";

CREATE TABLE "inventory" (
  "id" bigserial NOT NULL,
  "id_styles" INTEGER NULL DEFAULT NULL,
  "size" varchar(10) NOT NULL DEFAULT NULL,
  "quantity" INTEGER NOT NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE "products" ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE "styles" ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE "photos" ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE "Feature" ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE "inventory" ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
