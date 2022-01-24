# ProductOverviewService
Experimentation with containerizing Postgres databases and using express service workers. 

# Premise
Using another teams front end codebase, our team was tasked with developing corresponding backend microservices.

## Process:

### Database Modelling:
After some brief research we determined that a relational database would better suit the use case of an online store.
Ultimately, we decided on implementing Postgres due to team members previous experiene with ETL processes in the pg environment.

A single express server was designed to construct queries and interact with a local Postgres database.

### Local Testing:
After the local backend was stood up, we commenced testing query times by directing queries at the last 10% of our entries.

From there we moved to complex queries using aggregators and foreign key references, and hit a pretty significant bottleneck.

Using k6 to gain increased visibility we determined the slowdown was occurring in our database queries, and NOT the express server as we had expected.

A second pass through the database schema was made and I realized there were no indexes built from the foreign keys. Armed with that knowledge, I added an Index to our schema, so future deployments would automatically make these changes.

Returning to k6, our results now matched our expectations of less than 10ms per query.
![TestImage](TODO)

## Deployment:
We chose to use AWS EC2 micro.t2 instances in order to accommodate our lean deployment budget ( *COUGH COUGH ZERO DOLLARS* ).

After deploying single instances, we leaned on loader.io to fire increasing requests per second, until we noticed degraded response times or errors in excess of 3%.
![loader1](TODO)

## Scaling: 
After discovering the limitation of a single instance, we horizontally scaled to 5 service workers and used a round robin NGNX load balancer to coordinate increased traffic. 
Testing in this orientation met our intitial goal high durability and fault tolerant service of 8000+ RPS with 0% error rate.
![loaderio2](TODO)

# Revisiting
This exercise was illuminating on many fronts, but most importantly I would like to revisit and work on...
* More thorough Docker implementation to enable rapid deployment
* Attempt to have multiple express servers interacting with a single postgres database (instead of 1 express server: 1 postgres)
* Learn more about sharding, Write ahead logging, and replicating pg databases for increased fault tolerance.
