[C++ WIKI](https://en.wikipedia.org/wiki/C%2B%2B)
## Source file:
  - (TYPES: .c .cpp .cxx .cc)
  - Where you _actually_ type your C++ code

---

---
## [Object file](https://en.wikipedia.org/wiki/Object_file)  ( File type: .o && or .so is)

- An object file format is a computer file format used for the storage of object code and related data.

- Object file is a file containing object code, meaning relocatable format machine code that is usually not directly executable.

- There are various formats for object files, and the same object code can be packaged in different object files.
  - An object file may also work like a shared library.

- In addition to the object code itself, object files may contain metadata used for linking or debugging, including:
  - information to resolve symbolic cross-references between different modules
  - relocation information
  - stack unwinding information
  -  comments
  - program symbols
  - debugging or profiling information.

- Most object file formats are structured as separate sections of data, each section containing a certain type of data.
  - These sections are known as "segments" due to the term "memory segment", which was previously a common form of memory management.
- When a program is loaded into memory by a loader, the loader allocates various regions of memory.
  - Some of these regions correspond to segments of the object file, and thus are usually known by the same names.
  - Others, such as the stack, only exist at run time.

- In some cases relocation is done by the loader (or linker) to specify the actual memory addresses. However, for many programs or architectures relocation is not necessary, due to being handled by the memory management unit or by position-independent code.

- On some systems the segments of the object file can then be copied (paged) into memory and executed, without needing further processing.
  - On these systems this may be done lazily, that is, only when the segments are referenced during execution, for example via a memory-mapped file backed by the object file.

- Types of data supported by typical object file formats:

  -  Header (descriptive and control information)
  -  Code segment ("text segment", executable code)
  -  Data segment (initialized static variables)
  -  Read-only data segment (rodata, initialized static constants)
  -  BSS segment (uninitialized static data, both variables and constants)
  -  External definitions and references for linking
  -  Relocation information
  -  Dynamic linking information
  -  Debugging information

- Segments in different object files may be combined by the linker according to rules specified when the segments are defined.
- Conventions exist for segments shared between object files

The [GNU Project's Binary File Descriptor library (BFD library)](https://en.wikipedia.org/wiki/Binary_File_Descriptor_library
) provides a common API for the manipulation of object files in a variety of formats.

---

---
## Dynamic linking [wiki ](https://en.wikipedia.org/wiki/Dynamic_linker)
- Only happens when the program executes
- Linking is often referred to as a process that is performed when the executable is compiled.
- A dynamic linker is a special part of an operating system that loads _external shared libraries_ into a running process and then binds those shared libraries dynamically to the running process.
- This approach is also called **dynamic linking** or late linking.
---

---
## Static Linking library [wiki](https://en.wikipedia.org/wiki/Static_library)

- Statically-linked library is a set of (routines, external functions & variables) which are resolved in a caller at compile-time and copied into a target application by a **[compiler](https://en.wikipedia.org/wiki/Compiler)**, [linker](https://en.wikipedia.org/wiki/Linker_(computing), or binder) producing an **[object file](https://en.wikipedia.org/wiki/Object_file)** and a [stand-alone](https://en.wikipedia.org/wiki/Standalone_program) **[executable](https://en.wikipedia.org/wiki/Executable)**.

- This executable and the process of compiling it are both known as a [static build](https://en.wikipedia.org/wiki/Static_build) of the program. Historically, libraries could only be static. Static libraries are either merged with other static libraries and object files during building/linking to form a single executable or loaded at run-time into the address space of their corresponding executable at a static memory offset determined at [compile-time]/link-time.

  - ##### [Compile time](https://en.wikipedia.org/wiki/Compile_time) refers to either:
    - Operations performed by a compiler (the "compile-time operations")

    - Programming language requirements that must be met by source code for it to be successfully compiled (the "compile-time requirements"), or properties of the program that can be reasoned about during compilation.

    - Compile time refers to the time duration during which the statements written in any programming language are checked for errors.
---

- ##### Advantages to statically linking libraries with an executable _instead_ of dynamically linking them:
    - The most significant is that the application can be certain that all its libraries are present and that they are the correct version.
      - This avoids dependency problems, known colloquially as [DLL Hell](https://en.wikipedia.org/wiki/DLL_Hell)(dynamic linking library hell) or  [dependency hell](https://en.wikipedia.org/wiki/Dependency_hell).

    - Static linking can allow the application to be contained in a single executable file, simplifying distribution and installation.

    - Statically linking allows inclusion of just parts of the library that are directly and indirectly referenced by the target executable (or target library).  think ``` router.Routes(); ``` vs loading all of Express.js

      - With dynamic libraries, the **entire library** is loaded, as it is not known in advance which functions will be invoked by applications. Whether this advantage is significant in practice depends on the structure of the library.
---
- #### [Creating Static libraries](https://en.wikipedia.org/wiki/Static_library#Creating_static_libraries_in_C.2FC.2B.2B)
- Storage-class specifiers for indicating external or internal linkage, in addition to providing other features.
- To create such a library, the exported functions/procedures and other objects variables must be specified for external linkage (i.e. by not using the C[ ```static``` keyword](https://en.wikipedia.org/wiki/Static_(keyword))).
- Static library filenames usually have a ```.a``` extension on Unix-like systems and ```.lib``` on Microsoft Windows.

  - For example, to create an archive from files class1.o, class2.o, class3.o, the following command would be used:
```ar rcs libclass.a class1.o class2.o class3.o
```
  - If ```libclass.a``` is placed in standard library path, like /usr/local/lib:   ```cc main.c -lclass
```
  - or (during linking):  ```ld ... main.o -lclass ...
```
  - instead of:  ```cc main.c class1.o class2.o class3.o
```


---

---

## Header files (.h) [wiki](https://en.wikipedia.org/wiki/Include_directive#C.2FC.2B.2B)
- tell what the object file contains (functions, data types..  etc.)


- In C++, the ```#include``` [preprocessor directive](https://en.wikipedia.org/wiki/Directive_(programming) causes the compiler to replace that line with the entire text of the contents of the named source file
  - (if included in quotes: "")
  - or named header (if included in angle brackets: ```<>```);
  - The header doesn't need to be a file.

- Inclusion continues recursively on these included contents, up to an implementation-defined nesting limit. Headers need not have names corresponding to files: in C++ standard headers are typically identified with words, like "vector", hence ```#include <vector>``` while in C standard headers have identifiers in the form of filenames with a ```.h``` extension, as in ```#include <stdio.h>```

- A "source file" can be any file, with a name of any form, but is most commonly named with a ```.h``` extension and called a "header file" _(sometimes ".hpp" or ".hh" to distinguish C++ headers)_, though files with ``.c``, ```.cc```, and ```.cpp``` extensions may also be included (particularly in the [Single Compilation Unit technique](https://en.wikipedia.org/wiki/Single_Compilation_Unit)), and sometimes other extensions are used.

  - ##### [Single Compilation Unit technique (SCU)](https://en.wikipedia.org/wiki/Single_Compilation_Unit):
    - Reduces serial compilation time and allows the compiler to perform certain program optimizations even when the compiler itself is lacking support for whole program optimization.
    - The technique can be applied to an entire program or to some subset of source files.
      - when applied to an entire program, it is also known as a unity build.

- These two forms of ```#include``` directive can determine which _header_ or _source file_ to include in an implementation-defined way. In practice, what is usually done is that the angle-brackets form searches for source files in a standard system directory (or set of directories), and then searches for source files in local or project-specific paths (specified on the command line, in an environment variable, or in a Makefile or other build file), while the form with quotes does not search in a standard system directory, only searching in local or project-specific paths.
-  In case there is no clash, the angle-brackets form can also be used to specify project-specific includes, but this is considered poor form.
- The fact that headers need not correspond to files is primarily an implementation technicality, and used to omit the ```.h``` extension in including C++ standard headers; in common use "header" means "header file".

For example:

```c
#include <stdio.h>  // Include the contents of the standard header 'stdio.h' (probably a file 'stdio.h').
#include <vector>  // Include the contents of the standard header 'vector' (probably a file 'vector.h').
#include "user_defined.h"  // Include the contents of the file 'user_defined.h'
```
- In C and C++, problems may be faced if two (or more) include files both in turn include the same third file.
- One solution is to avoid include files from including any other files, possibly requiring the programmer to manually add extra include directives to the original file.
- Another solution is to use [include guards](https://en.wikipedia.org/wiki/Include_guard)
  - In the C and C++ programming languages, an #include guard, sometimes called a macro guard or header guard, is a particular construct used to avoid the problem of double inclusion when dealing with the include directive. The addition of #include guards to a header file is one way to make that file [idempotent](https://en.wikipedia.org/wiki/Idempotence).

  ---

  - ##### idempotence
    - In computer science, the term idempotent is used more comprehensively to describe an operation that will produce the same results if executed once or multiple times.

   - This may have a different meaning depending on the context in which it is applied.
    - In the case of methods or subroutine calls with side effects, for instance, it means that the modified state remains the same after the first call.
    - In functional programming, though, an idempotent function is one that has the property f(f(x)) = f(x) for any value x.

  - This is a very useful property in many situations, as it means that an operation can be repeated or retried as often as necessary without causing unintended effects.
  - With _non-idempotent_ operations, the algorithm may have to keep track of whether the operation was already performed or not.
    - Example:
    - A function looking up a customer's name and address in a database is typically idempotent, since this will not cause the database to change.Similarly, changing a customer's address is typically idempotent, because the final address will be the same no matter how many times it is submitted.

    - However, placing an order for a car for the customer is typically not idempotent, since running the call several times will lead to several orders being placed. Canceling an order is idempotent, because the order remains canceled no matter how many requests are made.

---

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

---
## LOOK INTO OBJECT ORIENTED PROGRAMMING (OOP) THEORY


---

---
#### Pointer is a memory address[wiki](https://en.wikipedia.org/wiki/Pointer_(computer_programming))
  - Memory allocation
  - In computer science, a pointer is a programming language object, whose value refers to (or "points to") another value stored elsewhere in the computer memory using its memory address. A pointer references a location in memory, and obtaining the value stored at that location is known as dereferencing the pointer. As an analogy, a page number in a book's index could be considered a pointer to the corresponding page; dereferencing such a pointer would be done by flipping to the page with the given page number.


- ##### Main function is == to document.ready

- ##### Best practice to separate functionality by file


#### run the compiler and it should make it into a file called a.out

---

---
<!-- ## BOOKS SHE SENT!
Effective modern c++ is very advanced

21 century c (will answer questions on memory allocation) -->

---

---







## C++ NOTES

[Source](http://www.dummies.com/programming/cpp/c-all-in-one-for-dummies-cheat-sheet/)
#### Common errors
- You forgot to declare the variable.
- You used the wrong uppercase and lowercase letters; for example, you typed Main when you meant main.
- You used one equal sign (=) when you were supposed to use two (==), either in an if statement or in a for loop.
- You forgot #include <iostream> or using namespace std;.
- You dropped the laptop in the swimming pool.
- You forgot to call new and just started using the pointer anyway.
- You forgot the word public: in your classes so everything turned up private.
- You let the dog eat the remote.
- You forgot to type the parentheses when calling a function that takes no parameters.
- You forgot a semicolon, probably at the end of a class declaration.
---

#### In C++, a header file holds forward declarations of identifiers.
Here are some of the most common C++ header files that you’ll be using, along with their correct spellings:

- Include <string> if you’re going to be using the string class.
- Include <iostream> when you want to use cout and cin.
- Include <fstream> when you want to read or write files.
- Include <iomanip> if you want advanced manipulator usage in your streams.
- Include <stdlib.h> for general operations, including system(“PAUSE”).
---

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
