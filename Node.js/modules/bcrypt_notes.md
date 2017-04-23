
## bcrypt usage
[bcrypt npm DOCS](https://www.npmjs.com/package/bcrypt)
##### To hash a password:
- myPlaintextPassword = clients post req.body [a-z/A-Z/0-9], saltRounds = integer
  ```javascript
 let hash = bcrypt.hashSync(myPlaintextPassword, saltRounds);
  // Store hash in your password DB.
  ```
##### To check a password:
- first load hashed_password from your DB
```javascript
knex('table').where('hashed_password', hashed_password).then...
  bcrypt.compareSync(myPlaintextPassword, hash); // true
  bcrypt.compareSync(badPlaintextPassword, hash); // false
  ```
----
