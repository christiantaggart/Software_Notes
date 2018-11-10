# Shell Script for easy KnexJS Commands

```sh
# KNEX____Stuff================================================================
knx(){
  knex migrate:rollback
  knex migrate:latest
  knex seed:run
}
knxt(){
  knex migrate:rollback --env test
  knex migrate:latest --env test
  knex seed:run --env test
}
```
