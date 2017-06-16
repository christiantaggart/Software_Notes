## [C](https://learnxinyminutes.com/docs/c/)
- Constants:
```c
#define KEYWORD
```

- Constants are written in all-caps out of convention, not requirement
```c
#define DAYS_IN_YEAR 365
```

- Enumeration constants are also ways to declare constants.

- All statements must end with a semicolon
```c
enum days {SUN = 1, MON, TUE, WED, THU, FRI, SAT};
```
- `MON` gets `2` automatically, `TUE` gets `3`, etc.

- Import headers with #include
```c
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
```

- File names between `<angle brackets>` are headers **from the C standard library**

- For _your own_ headers, use double quotes instead of angle brackets:
```c
#include "my_header.h"
```

- Declare function signatures in advance in a `.h` file, or at the top of your `.c` file.
  - Function Signature = (NAME COMBINED WITH PARAMETERS IT TAKES) HEADER FILE IS LIKE SKELETON FOR YOUR FUNCTION

```c
void function_1();
int function_2(void);
```


- Must declare a **'function prototype'** before `main()` when functions occur after your `main()` function.
```c
int add_two_ints(int x1, int x2); // function prototype
```

- Although `int add_two_ints(int, int);` is also valid (no need to name the args), it is recommended to name arguments in the prototype as well for easier inspection

### ENTRY
- Your program's entry point is a function called main with an integer return type.
```c
int main(void) {
  // your program
}
```
