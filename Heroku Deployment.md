# Heroku Deployment
##### [By: tjcutt](https://github.com/tjcutt)

```$``` indicates a terminal command. Any other code can be assumed to be written in your _integrated development environment (IDE)_ (e.g. **Atom**)

- Create a heorku app
  ``` $ heroku apps:create appName-app ```
- Check your node version
  ```$ node -v```

- Add that current node version as an engine at the bottom of your package.json file and add additional scripts (as shown below).  Note the app.js will be whichever JS file you use within your file system to initialize express

```json
{
  "name": "galvanize-message",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "start": "node ./bin/www",
    "test": "mocha",
    "knex": "knex",
    "heroku-postbuild": "knex migrate:rollback; knex migrate:latest; knex seed:run",
    "nodemon": "node app.js"
  },
  "dependencies": {
    "body-parser": "~1.16.0",
    "cookie-parser": "~1.4.3",
    "debug": "~2.6.0",
    "express": "~4.14.1",
    "hbs": "^4.0.1",
    "knex": "^0.12.9",
    "morgan": "~1.7.0",
    "pg": "^6.1.5",
    "serve-favicon": "~2.3.2"
  },
  "engines": {
    "node": "v7.7.2"
  }
}





MY OLD ONE
{
  "name": "galvanize-bookshelf",
  "version": "1.0.0",
  "description": "Create a web application to manage your book collection",
  "main": "server.js",
  "scripts": {
    "heroku-postbuild": "knex migrate:latest",
    "knex": "knex",
    "lint": "eslint  --ignore-pattern public/js/vendor",
    "nf": "nf start",
    "start": "nodemon server.js",
    "test": "mocha"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/gschool/galvanize-bookshelf.git"
  },
  "author": "Ian Smith <ian.smith@galvanize.com>",
  "contributors": [
    "Ken McGrady <ken.mcgrady@galvanize.com>",
    "Ryan Sobol <ryan.sobol@galvanize.com>"
  ],
  "license": "MIT",
  "bugs": {
    "url": "https://github.com/gschool/galvanize-bookshelf/issues"
  },
  "homepage": "https://github.com/gschool/galvanize-bookshelf#readme",
  "dependencies": {
    "bcrypt-as-promised": "^1.1.0",
    "body-parser": "^1.15.2",
    "boom": "^3.2.2",
    "cookie-parser": "^1.4.3",
    "express": "^4.14.0",
    "humps": "^1.1.0",
    "jsonwebtoken": "^7.1.9",
    "knex": "^0.11.7",
    "morgan": "^1.7.0",
    "pg": "^6.0.0"
  },
  "devDependencies": {
    "chai": "^3.5.0",
    "dotenv": "^2.0.0",
    "eslint": "^3.1.1",
    "eslint-config-ryansobol": "^7.7.0",
    "foreman": "^1.4.1",
    "mocha": "^2.5.3",
    "nodemon": "^1.10.0",
    "supertest": "^1.2.0"
  },
  "engines": {
    "node": "7.4.0"
  }
}


```
-   create PostgreSQL database remotely on the heroku app

```bash
$ heroku addons:create heroku-postgresql
```
- create a production environment within your knexfile.js with a client and a connection as shown

```javascript
  "production": {
    client: 'pg',
    connection: process.env.DATABASE_URL
  }
```
- create a procfile/config and session key

``` bash
$ echo 'web: node ./bin/www' > Procfile

$ bash -c 'heroku config:set SESSION_SECRET=$(openssl rand -hex 64)'
```
- use git to push to your heroku app

``` bash
$ git add .
$ git commit -m 'message'
$ git push heroku master
```
- allow a few minutes for deployment
- follow address to check if the deployment was sucessful
- If additional debugging is needed:

``` bash
$ heroku logs
```
