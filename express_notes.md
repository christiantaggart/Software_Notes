## router.route(path)
##### Source: [router.route(path)](https://expressjs.com/en/api.html#router.route)
Returns an instance of a single route which you can then use to handle HTTP verbs with optional middleware. Use `router.route()` to avoid duplicate route naming and thus typing errors.

``` javascript
var router = express.Router();

router.param('user_id', function(req, res, next, id) {
  // sample user, would actually fetch from DB, etc...
  req.user = {
    id: id,
    name: 'TJ'
  };
  next();
});

router.route('/users/:user_id')
.all(function(req, res, next) {
  // runs for all HTTP verbs first
  // think of it as route specific middleware!
  next();
})
.get(function(req, res, next) {
  res.json(req.user);
})
.put(function(req, res, next) {
  // just an example of maybe updating the user
  req.user.name = req.params.name;
  // save user ... etc
  res.json(req.user);
})
.post(function(req, res, next) {
  next(new Error('not implemented'));
})
.delete(function(req, res, next) {
  next(new Error('not implemented'));
});
```
This approach re-uses the single `/users/:user_id` path and adds handlers for various HTTP methods.

> ** NOTE: ** When you use `router.route()`, middleware ordering is based on when the route is created, not when method handlers are added to the route. For this purpose, you can consider method handlers to belong to the route to which they were added.

---
## app.route()
##### Source: [Express.js DOCS](https://expressjs.com/en/guide/routing.html)

You can create chainable route handlers for a route path by using `app.route()`. Because the path is specified at a single location, creating modular routes is helpful, as is reducing redundancy and typos. For more information about routes, see: [Router() documentation](https://expressjs.com/en/4x/api.html#router)

Here is an example of chained route handlers that are defined by using app.route().
``` javascript
app.route('/book')
  .get(function (req, res) {
    res.send('Get a random book')
  })
  .post(function (req, res) {
    res.send('Add a book')
  })
  .put(function (req, res) {
    res.send('Update the book')
  })
  ```
---
#### express.Router
Use the `express.Router` class to create modular, mountable route handlers. A Router instance is a complete middleware and routing system; for this reason, it is often referred to as a “mini-app”.

The following example creates a `router` as a module, loads a middleware function in it, defines some routes, and mounts the `router` module on a path in the main app.

Create a router file named `birds.js` in the app directory, with the following content:

``` javascript
var express = require('express')
var router = express.Router()

// middleware that is specific to this router
router.use(function timeLog (req, res, next) {
  console.log('Time: ', Date.now())
  next()
})
// define the home page route
router.get('/', function (req, res) {
  res.send('Birds home page')
})
// define the about route
router.get('/about', function (req, res) {
  res.send('About birds')
})

module.exports = router
```
---

## req.params
##### Source: [Express.js req.params DOCS](http://expressjs.com/en/api.html#req.params)

This property is an object containing properties mapped to the named _ route _ “parameters”.

For example, if you have the route `/user/:name` , then the “name” property is available as `req.params.name`.
This object defaults to `{}`.

``` javascript
// GET /user/tj
req.params.name
// => "tj"
```

When you use a regular expression for the _route_ definition, capture groups are provided in the array using `req.params[n]`, where `n` is the nth capture group.
This rule is applied to unnamed wild card matches with string routes such as ` /file/*:`

``` javascript
// GET /file/javascripts/jquery.js
req.params[0]
// => "javascripts/jquery.js"
```
___

## req.query
This property is an object containing a property for each query string parameter in the route. If there is no query string, it is the empty object, {}.

``` javascript
// GET /search?q=tobi+ferret
req.query.q
// => "tobi ferret"

// GET /shoes?order=desc&shoe[color]=blue&shoe[type]=converse
req.query.order
// => "desc"

req.query.shoe.color
// => "blue"

req.query.shoe.type
// => "converse"```

---

## app.locals

##### Source:  [app.locals](https://expressjs.com/en/api.html#app.locals)

The `app.locals` object has properties that are local variables within the application.

``` javascript

app.locals.title
// => 'My App'

app.locals.email
// => 'me@myapp.com'```

Once set, the value of `app.locals` properties persist throughout the life of the application, in contrast with `res.locals` properties that are valid only for the lifetime of the request.

You can access local variables in templates rendered within the application. This is useful for providing helper functions to templates, as well as application-level data. Local variables are available in middleware via `req.app.locals`
 #### See [req.app](https://expressjs.com/en/api.html#req.app)
``` javascript

app.locals.title = 'My App';
app.locals.strftime = require('strftime');
app.locals.email = 'me@myapp.com';
```

___

## req.app
##### Source [req.app](https://expressjs.com/en/api.html#req.app)

This property holds a reference to the instance of the Express application that is using the middleware.

If you follow the pattern in which you create a `module` that just `exports` a middleware `function` and `require()` it in your main file, then the middleware can access the Express instance via `req.app`

For example:
``` javascript
//index.js
app.get('/viewdirectory', require('./mymiddleware.js'))
//mymiddleware.js
module.exports = function (req, res) {
  res.send('The views directory is ' + req.app.get('views'));
};
```
___

## Response methods
##### Source: [Express.js Docs](https://expressjs.com/en/guide/routing.html)

The methods on the response object `res` in the following table can send a response to the client, and terminate the request-response cycle. If none of these methods are called from a route handler, the client request will be left hanging.

##### Method	Description
Response | Result
--- |  ---
`res.download()`	| Prompt a file to be downloaded.
`res.end()`	| End the response process.
`res.json()`	| Send a JSON response.
`res.jsonp()`	| Send a JSON response with JSONP support.
`res.redirect()`	| Redirect a request.
`res.render()`	 |Render a view template.
`res.send()`	| Send a response of various types.
`res.sendFile()`	| Send a file as an octet stream.
`res.sendStatus()`	| Set the response status code and send its string representation as the response body.
