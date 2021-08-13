COPY carts FROM '/Users/benbernardy/bootcamp/SDC/ProductOverview/csv_data/cart.csv' delimiter ',' csv header;

COPY features FROM '/Users/benbernardy/bootcamp/SDC/ProductOverview/csv_data/features.csv' delimiter ',' csv header;

COPY photos FROM '/Users/benbernardy/bootcamp/SDC/ProductOverview/csv_data/photos.csv' delimiter ',' csv header;

COPY products FROM '/Users/benbernardy/bootcamp/SDC/ProductOverview/csv_data/products.csv' delimiter ',' csv header;

COPY inventory FROM '/Users/benbernardy/bootcamp/SDC/ProductOverview/csv_data/inventory.csv' delimiter ',' csv header;

COPY styles FROM '/Users/benbernardy/bootcamp/SDC/ProductOverview/csv_data/styles.csv' delimiter ',' csv header;

-- Create Indexes for FKs as psql doesn't do this automatically

CREATE INDEX features_id_products_idx on features (id_products);
CREATE INDEX styles_id_products_idx on styles (id_products);
CREATE INDEX photos_id_products_idx on photos (id_styles);
CREATE INDEX inventory_id_products_idx on inventory (id_styles);