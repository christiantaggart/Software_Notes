# Functions
[Cheatsheet](https://gist.github.com/LeCoupa/122b12050f5fb267e75f)
- ##### The function refers to passed arguments by position (as if they were positional parameters), that is, ```$1```, ```$2```, and so forth.
- ##### ```$@``` is equal to ```$1```, ```$2```... ```$N```, where ```N``` is the number of positional parameters.
- ##### ```$#``` holds the number of positional parameters.

#### SYNTAX:
```bash
functname() {
  shell commands
}
```
