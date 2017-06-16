## [CLASSES](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes)
[CLASSES VS PROTOTYPES](https://medium.com/javascript-scene/master-the-javascript-interview-what-s-the-difference-between-class-prototypal-inheritance-e4cd0a7562e9)

- Class Inheritance:
  - A class is like a blueprint —**a description of the object to be created.** Classes inherit from classes and **create subclass relationships: hierarchical class taxonomies.** _Think parent => child_ (Rectangle, square, etc)

  -  Instances are typically instantiated via constructor functions with the `new` keyword.
  - Class inheritance may or may not use the `class` keyword from ES6.
  - Classes as you may know them from languages like Java don’t technically exist in JavaScript.
  - Constructor functions are used, instead.
  - The ES6 `class` keyword desugars to a constructor function:
```js
class Foo {}   
typeof Foo // 'function'
```
  - In JavaScript, class inheritance is implemented on top of prototypal inheritance, but that does not mean that it does the same thing:
    - JavaScript’s class inheritance uses the prototype chain to wire the child `Constructor.prototype` to the parent `Constructor.prototype` for delegation.
    - Usually, the `super()` constructor is also called. Those steps form single-ancestor parent/child hierarchies and create the tightest coupling available in OO design.







- EXAMPLE:
 Rectangle class == parent of square
  - will inherit certain `methods` or `properties` from parent `class`

#### Prototype methods

```js
class Rectangle {
  constructor(height, width) {
    this.height = height;
    this.width = width;
  }

  get area() {
    return this.calcArea();
  }

  calcArea() {
    return this.height * this.width;
  }
}

const square = new Rectangle(10, 10);
console.log(square.area);
```
