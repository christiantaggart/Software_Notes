
## [VARIABLES](http://www.cplusplus.com/doc/tutorial/variables/)

```c++
// operating with variables

#include <iostream>
using namespace std;

int main ()
{
  // declaring variables:
  int a, b;
  int result;

  // process:
  a = 5;
  b = 2;
  a = a + 1;
  result = a - b;

  // print out the result:
  cout << result;

  // terminate the program:
  return 0;
}
```

- When the variables in the example above are declared, they have an undetermined value until they are assigned a value for the first time.
- But it is possible for a variable to have a specific value from the moment it is declared.
  - This is called the **initialization** of the variable.

---
- #### In C++, there are three ways to initialize variables.
They are all equivalent and are reminiscent of the evolution of the language over the years:


**1.)** The first one, known as c-like initialization (because it is inherited from the C language), consists of appending an equal sign followed by the value to which the variable is initialized:

```c++
type identifier = initial_value;
```
  - For example, to declare a variable of type ```int``` called ```x``` and initialize it to a value of zero from the same moment it is declared, we can write:
```c++
int x = 0;
```

**2.)** A second method, known as constructor initialization (introduced by the C++ language), encloses the ```initial value``` between parentheses ```( )```:
```c++
type identifier (initial_value);
```
- For example:
```c++
int x (0);
```

**3.)** Finally, a third method, known as uniform initialization, similar to the above, but using curly braces ```{}``` instead of parentheses (this was introduced by the revision of the C++ standard, in 2011):
```c++
type identifier {initial_value};
```
- For example:
```c++
int x {0};
```

All three ways of initializing variables are valid and equivalent in C++.

---

---

### Type deduction: auto and decltype
- When a new variable is initialized, the compiler can figure out what the type of the variable is automatically by the initializer.

- For this, it suffices to use auto as the type specifier for the variable:
```c++
1
2
int foo = 0;
auto bar = foo;  // the same as: int bar = foo;
```

Here, bar is declared as having an auto type; therefore, the type of bar is the type of the value used to initialize it: in this case it uses the type of foo, which is int.

Variables that are not initialized can also make use of type deduction with the decltype specifier:

1
2
int foo = 0;
decltype(foo) bar;  // the same as: int bar;


Here, bar is declared as having the same type as foo.

auto and decltype are powerful features recently added to the language. But the type deduction features they introduce are meant to be used either when the type cannot be obtained by other means or when using it improves code readability. The two examples above were likely neither of these use cases. In fact they probably decreased readability, since, when reading the code, one has to search for the type of foo to actually know the type of bar.
