# MISC STUFF:
[Cheatsheet](https://gist.github.com/LeCoupa/122b12050f5fb267e75f)
  #### Prompt
  - To view your Current prompt settings (prompt  string one)
    ``` bash
    echo $PS1
    ```
  ---
  #### Executables
  - PATH is an environment variable specifying a set of directories where executable programs are located.
  ``` bash
  echo $PATH
  ```
  ---

  #### Misc Commands
  - This command gets rid of the 'last login' message at the top of each session.
  ``` bash
  touch ~/.hushlogin
  ```
  - displays all defined functions in your login session
  ```bash
  declare -f  
  ```
