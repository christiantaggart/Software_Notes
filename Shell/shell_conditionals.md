### Conditional statements
[source](http://www.thegeekstuff.com/2010/06/bash-conditional-expression/)
[Cheatsheet](https://gist.github.com/LeCoupa/122b12050f5fb267e75f)
---

-    Returns true if file exists.
```bash
 [ -e filepath ]
 ```

-    Returns true if file exists and executable.
```bash
 [ -x filepath ]
```
-   Returns true if file exists and its a socket file.
```bash
 [ -S filepath ]
```
-     Returns true if both the expression is true.
```bash
[ expr1 -a expr2 ]
```
-    Returns true if either of the expression1 or 2 is true.
```bash
 [ expr1 -o expr2 ]
```
---
- and operator (return true if both true or false)
``` bash
statement1 && statement2  
```
- or operator (return true if one or the other is true)
```bash
statement1 || statement2  
```
---
- Evaluating variables
``` bash
str1=str2                 # str1 matches str2
str1!=str2                # str1 does not match str2
str1<str2                 # str1 is less than str2
str1>str2                 # str1 is greater than str2
-n str1                   # str1 is not null (has length greater than 0)
-z str1                   # str1 is null (has length 0)
```
---
- File Conditionals

```bash
-a file                   # file exists
-d file                   # file exists and is a directory
-e file                   # file exists; same -a
-f file                   # file exists and is a regular file (i.e., not a directory or other special type of file)
-r file                   # you have read permission
-r file                   # file exists and is not empty
```

---
- Conditionals for functions
```bash
-lt                       # less than
-le                       # less than or equal
-eq                       # equal
-ge                       # greater than or equal
-gt                       # greater than
-ne                       # not equal
```

---

[Source](http://www.thegeekstuff.com/2010/06/bash-if-statement-examples)
- ####  If..then..fi
  - ```If``` the given conditional expression is true, it  executes statements between  ```then``` and ```fi```
  - ##### Syntax
  ``` bash
  if [ conditional expression ]
  then
  	statement1
  	statement2
  	.
  fi
  ```
  - ##### Example:
  ``` bash
      #!/bin/bash
      count=100
      if [ $count -eq 100 ]
      then
        echo "Count is 100"
      fi
  ```
  ---
- #### If..then..else..fi
  - ```If``` true, it executes the statement1 and 2.
  -  If the conditional expression returns zero, it jumps to else part, and executes the statement3 and 4.
  - ##### Syntax  
  ``` bash
  if [ conditional expression ]
  then
  	statement1
  	statement2
  	.
  else
  	statement3
  	statement4
  	.
  fi
  ```
  - ##### Example:
```bash
    #!/bin/bash
    count=99
    if [ $count -eq 100 ]
    then
      echo "Count is 100"
    else
      echo "Count is not 100"
    fi
```
---
- #### if..elif..else..fi
  -  Use this if..elif. if , if you want to select one of many blocks of code to execute. It checks expression 1, if true executes statement 1,2.
  - If expression1 is false, it checks expression2, and if all the expression is false, then it enters into else block and executes the statements in the else block.
  - ##### Syntax
``` bash
  if [ conditional expression1 ]
  then
  	statement1
  	statement2
  	.
  elif [ conditional expression2 ]
  then
  	statement3
  	statement4
   .
   .
   .
  else
  	statement5
  fi
```
  - ##### Example:
``` bash
    #!/bin/bash
    count=99
    if [ $count -eq 100 ]
    then
      echo "Count is 100"
    elif [ $count -gt 100 ]
    then
      echo "Count is greater than 100"
    else
      echo "Count is less than 100"
    fi
```
---

- #### if..then..else..if..then..fi..fi..
  - If statement and else statement could be nested in bash. The keyword “fi” indicates the end of the inner if statement and all if statement should end with the keyword “fi”.
  - ##### Syntax
``` bash
    if [ conditional expression1 ]
    then
      statement1
      statement2
      .
    else
      if [ conditional expression2 ]
      then
        statement3
        .
      fi
    fi
```
  - ##### Example:
  ``` bash
      #!/bin/bash
    count=99
    if [ $count -eq 100 ]
    then
      echo "Count is 100"
    else
      if [ $count -gt 100 ]
      then
        echo "Count is greater than 100"
      else
      echo "Count is less than 100"
      fi
    fi
  ```
  ---
