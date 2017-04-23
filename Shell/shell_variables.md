# shell variable declaration

[Cheatsheet](https://gist.github.com/LeCoupa/122b12050f5fb267e75f)

- ### Defining variables:
  - Defines a variable
  ```bash
  varname=value
  ```
  - Defines a variable to be in the environment of a particular subprocess
```bash
varname=value command
```  
  - Checks a variable's value
```bash  
echo $varname
```
  - defines an environment variable (will be available in subprocesses)
```bash
export VARNAME=value
```
---
- ### Defining arrays
  - Multiple ways to define:
```bash
array[0] = val               
array[1] = val
array[2] = val
array=([2]=val [0]=val [1]=val)
array(val val val)
```
