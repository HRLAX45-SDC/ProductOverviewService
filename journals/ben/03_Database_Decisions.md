# Initial Database Decisions

## Challenges:
  * Discern Pros and Cons of SQL vs NoSQL databases
  * What are the scaling hurdles of scaling each?
  * How complex will schema creation be?
  
## Actions:
  * Researched Relational vs NoSQL db characteristics.
  * Mapped out schemas for both MongoDb and PostGres.
  
## Results:
  * Settled on PostGres for my implementation due to --
    1. Lack of expereince (growth mindset)
    2. A Higher transactional integrity (Important when dealing with purchases and inventory)
    3. Potentially large dataset needs to be easily indexed and quickly searched.
    4. Native Join operations useful for one to many relationship between a single product ID, having many styles and features.
 
### Next Steps:
  * Learn about Postgres DB replication and Write Ahead Logging
  * Identify potential PostGres scaling hurdles and complexities
