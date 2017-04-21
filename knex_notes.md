## Knex notes


##### Migrations:
  - ``` knex migrate: make (migrationName) ```
  - ``` knex migrate: rollback ```
  - ``` knex migrate: latest ```

##### Seeds:
  !MAKE SURE TO NUMBER THEM IN ORDER
  - ```knex seed:make (#_name) ```



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
---
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
---
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

---
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
---
##### Delete
.del()
- This method deletes one or more rows, based on other conditions specified in the query.
- Resolves the promise / fulfills the callback with the number of affected rows for the query.
       knex('accounts')
      .where('activated', false)
      .del()

      Outputs: delete from accounts where activated = false
---
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
---

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
---

##### insert
.insert(data, [returning])
[insert method](http://knexjs.org/#Builder-insert)
- Creates an insert query, taking either a hash of properties to be inserted into the row, or an array of inserts, to be executed as a single insert command.

- Resolves the promise / fulfills the callback with an array containing the first insert id of the inserted model, or an array containing all inserted ids for postgresql.

See above for examples of usage
---

##### Grabbing data from two separate tables

 ``` Javascript
 knex('books')
 .where('books.id', 1)
 .innerJoin('books_authors', 'books.id', 'book_id')
 .innerJoin('authors', 'authors.id', 'author_id')
 .select('name', 'biography', 'portrait_url')
 ```

 ``` sql
 select "name", "biography", "portrait_url" from "books" inner join "books_authors" on "books"."id" = "book_id" inner join "authors" on "authors"."id" = "author_id" where "books"."id" = 1

 ```
---
