# Heroku Deployment
##### [By: tjcutt](https://github.com/tjcutt)
### [GO HERE](http://leesah-herokudeploy.surge.sh/)

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
