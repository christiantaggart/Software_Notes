
### General notes (Node.js/Express.js ~ RELATED)
---
##### URL Parameters are grabbed using:
      req.param.variable_name

##### POST Parameters are grabbed using:
      req.body.variable_name
- think of req.body _ aka _ (JSON) as any other object.
  - Keys are accessible by dot notation.
- JSON will be sent in the request body for you to access them datas
  - EXAMPLES of POST:
        first_name: req.body.firstName
        last_name: req.body.lastName
        email: req.body.email
  - EXAMPLES of URL Parameter grab:
          req.params.id : id the client is requesting ('/:id')


#### res.locals
[Express.js Source](https://expressjs.com/en/api.html#res.locals)
- An object that contains response local variables scoped to the request.
- Available only to the view(s) rendered during that request / response cycle (if any).
- This property is useful for exposing request-level information such as the request path name, authenticated user, user settings, and so on.


#### Best practice: Create functions in separate files and require them as a module (comparisons, verification, req.body.email, req.params.id, knex calls etc.)

---

## bcrypt usage
[bcrypt npm DOCS](https://www.npmjs.com/package/bcrypt)
##### To hash a password:
      let hash = bcrypt.hashSync(myPlaintextPassword, saltRounds);
      // Store hash in your password DB.
##### To check a password:
- first load hashed_password from your DB
      knex('table').where('hashed_password', hashed_password).then...
        bcrypt.compareSync(myPlaintextPassword, hash); // true
        bcrypt.compareSync(badPlaintextPassword, hash); // false
[jwt docs](https://www.npmjs.com/package/jsonwebtoken)

----
