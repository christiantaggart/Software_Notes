## ALICAS LECTURE ON SRP

SEPARATE RESPONSIBILITIES PRINCIPLE
Separation of concerns


## OBJECTIVES
- WHY DOES SRP MATER

### WHY:
- Smaller pieces of code
  - Break it into pieces

- Easier to debug (testing)
  - Test individual component/ modules/ pieces

- Easier to split work among people in a team

- Design Patterns: Model, View, Controller
- Software Architecture: Backend Front end (single page apps)
  - One step above how the code is written (how everything is laid out Theoretically speaking)
- OOP Encapsulation, Polymorphism, Inheritance, Abstraction
  - Inheritance: Gains methods, Properties, etc from parent class, prototype
  - Abstraction: Only the things you need to know for the task you're doing
  - Polymorphism: Calling the same functions on different objects with different results on context of object
  - Encapsulation: Only manipulated by methods in that class

- Angular
  - Services Responsibilities: Ajax calls to reserver and handle response
  - components Responsibilities: Call the service and manipulate the data given to them for the front end

- APPLY INPUT, TRANSFORM, OUTPUT
  - With imperative shell and functional core
##### Example:
- I/O (imperative shell)
  - Gather Input: HTTP, Database query, etc
- Computation (functional core, .map/ .reduce is a giveaway)
  - Transform the input: Format for humans (currency notation) or computers (JSON conversion)
- I/O (imperative shell)
  - Output the transforms data: Create JSON and send it back
- WRITING FOR TESTS FORCES you to separate for testability

- CREATIVE IMPERATIVE SHELL FUNCTIONAL CORE:
- REFACTOR FOR TESTING:



### GRAPHS
adjacency is the direction the graph is pushing
add visited method to exit infinite loop with directional graph
