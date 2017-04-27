[C++ WIKI](https://en.wikipedia.org/wiki/C%2B%2B)
## Source file:
  - (TYPES: .c .cpp .cxx .cc)
  - Where you _actually_ type your C++ code


---
#### LOOK INTO GARBAGE COLLECTION.

- ### Constructor and destructor functions
  - constructor: function name();
    - creates the function
  - destructor: ~function name();
    - removes if for garbage collection


- #### Quotation " " marks are for files that you have made

- #### Angle brackets are for libraries that you have not made < ex library>


---
## LOOK INTO OBJECT ORIENTED PROGRAMMING (OOP) THEORY


---


## C++ NOTES


#### PROGRAMMING
Remembering a bunch of C++ syntax can make you “loopy.” The following samples show the syntax of some of the more easily forgotten C++ situations: a for loop, a while loop, and a switch statement; a class and the code for a member function; a base class and a derived class; a function, function pointer type, and pointer to the function; and a class template and then a class based on the template.

- ##### Here’s a for loop:
``` c++
int i;
for (i=0; i<10; i++) {
    cout << i << endl;
}
```

- ##### While loop that counts from 10 down to 1:
```c++
int i = 10;
while (i > 0) {
    cout << i << endl;
    i—;
}
```
- ##### Switch statement:
```c++
switch (x) {
case 1:
    cout << “1” << endl;
case 2:
    cout << “2” << endl;
default:
    cout << “Something else” << endl;
}
```


- ##### Class and the code for a member function:
```c++
class MyClass {
private:
    int x;
public:
    void MyFunction(int y);
};
void MyClass::MyFunction(int y) {
    x = y;
}
```



- #####  Base class and a derived class:
```c++
class MyBase {
private:
   // derived classes can
   // not access this
   int a;   
protected:
   // derived classes can
   // access this
   int b;   
};
class Derived : public MyBase {
public:
    void test() {
        b = 10;
    }
};
```
- ##### Here’s a function, a function pointer type, and a pointer to the function:
```c++
int function(char x) {
    return (int)x;
}
typedef int (* funcptr)(char);
funcptr MyPtr = function;
```
- ##### Class template and then a class based on the template:
``` c++
template <typename T>
class MyTemplate {
public:
    T a;
};
MyTemplate<int> X;
```


#### identifiers [Source](http://en.cppreference.com/w/cpp/language/identifiers)
#### Learn X in Y mins C++ from tim [source](https://learnxinyminutes.com/docs/c++/)
