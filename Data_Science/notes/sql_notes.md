# SQL notes (SQLite3)

## Create

`touch test_database.db`

### Connect

`sqlite3 test_database.db`

### Query

Return the entire contents of a table `SELECT * FROM tablename`

View all tables inside DB `.tables` (Once in sql sesh)

View Schema `.schema`

Format the query nicely `.header on` and then use: `.columns on`

### Seeding

If you have a .sql file seed with `.read <file_name>.sql`

Just pipe in the seed file `sqlite3 dbname.db < seedfile.sql`


code|name|continent|region|surfacearea|indepyear|population|lifeexpectancy|gnp|gnpold|localname|governmentform|headofstate|capital|code2