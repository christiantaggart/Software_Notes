
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

## In C++, a header file holds forward declarations of identifiers.
Here are some of the most common C++ header files that you’ll be using, along with their correct spellings:

- Include ```<string>``` if you’re going to be using the string class.
- Include ```<iostream>``` when you want to use cout and cin.
- Include ```<fstream>``` when you want to read or write files.
- Include ```<iomanip>``` if you want advanced manipulator usage in your streams.
- Include``` <stdlib.h>``` for general operations, including system(“PAUSE”).
---
