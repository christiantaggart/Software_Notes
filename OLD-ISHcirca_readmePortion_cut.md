.bash_profile

$ circa
(auto crud app)

this is the readme.md portion


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

## Knex notes
##### Where
.where(~mixed~)
- Object Syntax:
       knex('users').where({
          first_name: 'Test',
          last_name:  'User'
        }).select('id')
        Outputs:
        select  'id ' from  'users ' where  'first_name ' = 'Test' and  'last_name ' = 'User'
- Key, Value Syntax:
        knex('users').where('id', 1)
        Outputs:
        select * from  'users ' where  'id ' = 1
- Grouped Chain Syntax:
        knex('users').where(function() {
          this.where('id', 1).orWhere('id', '>', 10)
        }).orWhere({name: 'Tester'})
        Outputs:
        select * from  'users where ( 'id ' = 1 or  'id ' > 10) or ( 'name ' = 'Tester')

##### Select
.select([columns])
- Creates a select query, taking an optional array of columns for the query, eventually defaulting to * if none are specified when the query is built.
- The response of a select call will resolve with an array of objects selected from the database.
      knex.select('title', 'author', 'year').from('books')

      Outputs:
      select  'title ',  'author ',  'year ' from  books

      knex.select().table('books')

      Outputs:
      select * from  books

##### Join

.join(table, first, [operator], second)
The join builder can be used to specify joins between tables, with the first argument being the joining table, the next three arguments being the first join column, the join operator and the second join column, respectively.

      knex('users')
      .join('contacts', 'users.id', '=', 'contacts.user_id')
      .select('users.id', 'contacts.phone')

      Outputs:
      select users.id, contacts.phone from users inner join contacts on users.id = contacts.user_id

      knex('users')
      .join('contacts', 'users.id', 'contacts.user_id')
      .select('users.id', 'contacts.phone')

      Outputs:
      select  users.id, contacts.phone from users inner join  contacts  on users.id = contacts.user_id


##### Update
.update(data, [returning]) or .update(key, value, [returning])

- Creates an update query, taking a hash of properties or a key/value pair to be updated based on the other query constraints.
- Resolves the promise / fulfills the callback with the number of affected rows for the query.
- If a key to be updated has value undefined it is ignored.
      knex('books')
      .where('published_date', '<', 2000)
      .update({ status: 'archived', thisKeyIsSkipped: undefined })

      Outputs:
      update books set status = archived where published_date < 2000

      knex('books').update('title', 'Slaughterhouse Five')

      Outputs:
      update books set title = 'Slaughterhouse Five'

##### Delete
.del()
- This method deletes one or more rows, based on other conditions specified in the query.
- Resolves the promise / fulfills the callback with the number of affected rows for the query.
       knex('accounts')
      .where('activated', false)
      .del()

      Outputs: delete from accounts where activated = false

##### Then
.then(onFulfilled, [onRejected])
- Coerces the current query builder chain into a promise state, accepting the resolve and reject handlers as specified by the Promises/A+ spec.
- As stated in the spec, more than one call to the then method for the current query chain will resolve with the same value, in the order they were called; the query will not be executed multiple times.
      knex.select()
      .from('users')
      .where({name: 'Tim'})
      .then(function(rows) {
        return knex.insert({user_id: rows[0].id, name: 'Test'}, 'id').into('accounts');
      })
      .then(function(id) {
        console.log('Inserted Account ' + id);
      })
      .catch(function(error) { console.error(error); });

##### Returning (selecting columns to insert into)
 .returning(column) _or_ .returning([column1, column2, ...])
- The returning method specifies which column should be returned by the insert and update methods.
-  Passed column parameter may be a string or an array of strings.
- When passed in a string, makes the SQL result be reported as an array of values from the specified column.
- When passed in an array of strings, makes the SQL result be reported as an array of objects, each containing a single property for each of the specified columns.

      knex('books')
      .returning('id')
      .insert({title: 'Slaughterhouse Five'})

      Outputs:  insert into books  title  values ('Slaughterhouse Five')

      knex('books')
      .returning('id')
      .insert([{title: 'Great Gatsby'}, {title: 'Fahrenheit 451'}])

      Outputs:
      insert into books  title values ('Great Gatsby'), ('Fahrenheit 451')

      // Returns [ { id: 1, title: 'Slaughterhouse Five' } ]
      knex('books')
      .returning(['id','title'])
      .insert({title: 'Slaughterhouse Five'})

      Outputs:
      insert into books title values ('Slaughterhouse Five')


##### insert
.insert(data, [returning])
[insert method](http://knexjs.org/#Builder-insert)
- Creates an insert query, taking either a hash of properties to be inserted into the row, or an array of inserts, to be executed as a single insert command.

- Resolves the promise / fulfills the callback with an array containing the first insert id of the inserted model, or an array containing all inserted ids for postgresql.

See above for examples of usage
