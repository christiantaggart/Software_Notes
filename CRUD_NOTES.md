## GIT COMMIT
##### marked-down checklist [Tom-Con](https://github.com/tom-con) made

```
~~~~ IN CLI / Terminal / BASH ~~~~~~~~~~~
$ express --view=hbs // initializes directory with express generator
$ npm install // installs modules that were required by express generator setup
$ echo ‘node_modules’ > .gitignore
$ git init
$ git remote add origin <<<GIT URL>>>
$ git add .
$ git commit -m “Setup”
$ atom .
$ npm i --save hbs
```

## WIREFRAME ROUTES --- how will crud operate?
$ npm i --save knex pg  express-validation joi
$ touch knex.js
$ touch knexfile.js
'use strict';
module.exports = knex;
'use strict';
client: 'pg',

Create DB
Run server and ensure it’s working
GET YOUR FRAMEWORKS HOOKED UP
Start with barebones frontend

$ knex migrate:make {{TABLE NAME1}}; 40. SET UP migration file
$ knex migrate:make {{TABLE NAME2}};
const environment = process.env.NODE_ENV || 'test'; const knexConfig = require('./knexfile')[environment]; const knex = require('knex')(knexConfig);
module.exports = { development: {
connection: 'postgres://localhost/{{DATABASE NAME}}' };
$ Mkdir validations
$ touch validations/{{tablename}}.js
Require validations in your server
const validations = require(‘../validations/{{route name}}’)
SET UP migration file
$ knex migrate:latest
Check to see the database is nice
ETC..

$ knex seed:make {{TABLE NAME1}};
 SET UP SEED file
$ knex seed:make {{TABLE NAME2}};
SET UP SEED file (NUMBER THEM!!!!!! 1_SEEDNAME 2_SEEDNAME 3_SEEDNAME
ETC..
$ knex seed:run;

$ psql {{DATABASE NAME}}
``` # \d ```
```# select * from {{TABLE NAMES}};
```

ETC..
Start adding functionality to route requests.
Require knex!!!! ~~~~~
Start playing
