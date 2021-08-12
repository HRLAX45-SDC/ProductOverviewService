-- ---
-- Foreign Keys to be enabled after tables.sql created
-- ---

ALTER TABLE "styles" ADD FOREIGN KEY (id_products) REFERENCES "products" ("id");
ALTER TABLE "photos" ADD FOREIGN KEY (id_styles) REFERENCES "styles" ("id");
ALTER TABLE "features" ADD FOREIGN KEY (id_products) REFERENCES "products" ("id");
ALTER TABLE "inventory" ADD FOREIGN KEY (id_styles) REFERENCES "styles" ("id");
ALTER TABLE "carts" ADD FOREIGN KEY (id_products) REFERENCES "products" ("id");