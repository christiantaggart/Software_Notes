# OBJECTS IN ECMASCRIPT 6

[GOOD SOURCE OF ES6 INFO](https://github.com/lukehoban/es6features)

## Petes lecture:

- Be able to write an ES6 Class from which you can spawn object instances

- Be able to use a constructor function

- Be able to do class based inheritance

- Be able to explain difference between Prototypes and ES6 Classes

- Be able to use/explain keywords: class, new, static, extends, super

### [CLASSES](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes):

- Class names should start with an uppercase letter

- use toString on your class to allow it to be printed out for future reference

- Underscored parameters are ways to define parameters in a class
  - UNDERSCORED == properties internal to the object/class keep them private/ encapsulated
  - AKA "Private Members"
  - UNDERSCORED is used so that you don't modify internal values(`_tired` etc)
  - ASSUME PROPERTIES SHOULD BE PRIVATE (start them with underscore)

- GETTERS: get internal properties

- SETTERS: set internal properties of class (sleep, move, getTired .. etc)

```javascript
class Animal {

  constructor (skin, type, numLimbs) { // Method that sets initial values/ run initial methods(possibly on superclass) THERE CAN BE ONLY ONE
    this._skin = skin;
    this._type = type;
    this._numLimbs = numLimbs;
    this._tired = false;
  }

  move() {
    this._tired = true;
  }

  sleep() {
    this._tired = false;
  }

  getTired() {
    return this._tired;
  }

  toString(){
    return `A ${this._skin} skinned ${this._type} with ${this._numLimbs} limbs.`;
  }

}

var sloth = new Animal('hairy', 'mammal', 4);
console.log(sloth.toString()); // POLYMORPHISM
sloth.move();
console.log('Sloth tired after move()? ', sloth.getTired());
sloth.sleep();
console.log('Sloth tired after sleep()? ', sloth.getTired());

var snake = new Animal('scaly', 'reptile', 0);
console.log(snake.toString()); // POLYMORPHISM
```

### [SubClassing](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes#Sub_classing_with_extends)

```js
class Food {
  constructor(tastiness, texture, color){ // CREATES OUR PARENT TO INSTANTIATE THE OBJECT OF FOOD
    this._tastiness = tastiness
    this._texture = texture
    this._color = color

  }
  addSalt(amt){
    if(amg>5){
      this._tastiness-=2;
    }else {
      this._tastiness++;
    }
  }
}

  class Taco extends Food {
    constructor(tastiness, texture, color, crunchy){
      super(tastiness, texture, color) //ALLOWS ACCESS TO ALL METHODS/ANCESTRY OF PARENT
      this._crunchy = crunchy
  }

  changeShell(){
    this._crunchy = !this._crunchy
  }
}

```

### [Static](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes/static)
- Lives at class level (Global method/ property)
  - Functionality that is baked into the class that has nothing to do with the instances
- Will not change based state of object
- 

#### Syntax:
```js
// defined static method
  static staticMethodName() { ... }

//invoke static method
MyClass.staticMethodName();
```
