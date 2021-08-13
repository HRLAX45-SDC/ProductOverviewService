# Day 4

## Challenges
  * Found I didn't understand how _exactly_ express was using router middleware.
  * Was confused about choices of npm library for dealing with Postgres

## Actions
 * Spent some time researching PS, KNEX, and Sequalize.
 * Reviewed Legacy codebases use of file structuring and modularization.

## Results
  * Setlled on using the pg library for its lighter weight and integration is postgres.
  * Sequelize is great, but I fear it may not have robust enough features once scalling/sharding/replicating happens
  * Knex seems like a swiss army knife, and would love to tackle another project with it down the line.

----

I was surprised how much mental effort it took for me to reshape data returned from my pg queries. I will be spending
a large portion of today, verifying that my data is being returned to the client in the expected format.