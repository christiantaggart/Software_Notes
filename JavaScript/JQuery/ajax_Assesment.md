# Ajax Assessment

---

What does AJAX stand for?

> Answer here
asynchronous JavaScript and XML
---

What does JSON stand for?

> Answer here
JavaScript OBJECT NOTATION
---

What does asynchronous mean? How does it differ from synchronous?

> Answer here
asynchronous happens automatically during an ajax call where a synchronous thing happens when its called on// triggered
---

What are three states of a Promise?

> Answer here
pending  fulfilled rejected

---

What are `.then()` and `.catch()` used for?

> Answer here
success/ Error handling within the $.ajax request
---

How can you make a GET request with AJAX? (after you get the data back, loop through it and output the post title)

```js
// Method: GET
// URL: https://jsonplaceholder.typicode.com/posts

// Code here
```




> Answer here
$.ajax({
  url: ' https://jsonplaceholder.typicode.com/posts',
  type: 'GET',
  dataType: json
})
.done(function() {
for(i=0; i<data.length; i++){
  console.log(data.title)
}
})
.fail(function() {
  console.log("error");
})

---

How can you make a POST request with AJAX? Send a payload of "name" set to "Baxter"

```js
// Method: POST
// URL: https://jsonplaceholder.typicode.com/posts
// Payload: "name" set to "Baxter"

// Code Here
```

> Answer here
$.ajax({
  url: ' https://jsonplaceholder.typicode.com/posts',
  type: 'POST',
  dataType: JSON,
  data: {name: 'Baxter'}
})
.done(function() {
console.log("A+ BUDDY YOU DID IT")
})
.fail(function() {
  console.log("error");
})
