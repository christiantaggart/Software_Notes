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
