# MongoDb




#### SHOW DB's
- Display all available databases
```sh
show dbs
```

#### Connect to a database
- After displaying all dbs you can connect using the following
```sh
use DESIRED_DATABASE_NAME
```

#### Show collections (tables)
- A collection is essentially a table
```sh
show collections
```
---

### [MongoDB docs](https://docs.mongodb.com/getting-started/shell/remove/)
#### Remove All Documents (in a collection)
_collection == table_
- To remove all documents from a collection, pass an empty conditions document '{}' to the 'remove()' method.
```sh
db.DESIRED_COLLECTION_NAME.remove({})
```

#### Drop a Collection
- The remove all operation only removes the documents from the collection. The collection itself, as well as any indexes for the collection, remain.
- Use the drop() method to drop a collection, including any indexes.
```sh
db.DESIRED_COLLECTION_NAME.drop()
```
- Upon successful drop of the collection, the operation returns true.
```sh
true
```
