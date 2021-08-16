# Day 3

## Challenges
  * Understand various hurdles in the ETL process
  * Modifiying planned schema to match Extracted csv data
  * Need familiarity with postgresql docs regarding batch table creation and loading.
  * Need familiarity with postgresql docs regarding command exec from file.

## Actions
  * Learned about ```psql -c``` switch enabling commands from bash terminal
    * Also ```\i [file]``` flags for batch issuing sql commands ```\ir``` for relative filepaths
  * Exploring support for ```COPY table``` and psql ```\copy```

## Results
  * Learned multiple ways to Transfer and Load data using pgAdmin and psql.
  * Also learned that psql DOES NOT add indexes on foreign keys. This massively slows down queries when using JOINs.
---
  Before FK indexing, on my local machine in psql, this query averaged 562ms.
  ```sql
  SELECT products.*, features.feature, features.value
  FROM products INNER JOIN features
  ON products.id=features.id_products
  WHERE products.id=90000;
  ```
  After FK indexing via ```CREATE INDEX _indexname_ ON _table_ (_column_)```, query times dropped to just over 1ms.

  * Also learned that multiple indexes are not always a gain. On small tables, the scan time is limited enough that it doesn't justify the memory use by creating an index.