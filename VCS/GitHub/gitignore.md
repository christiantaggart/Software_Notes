# .gitignore

- Below is an example of a `.gitignore` file:
```
.gitignore
.DS_Store
**/**/hide
```


- After a file has been committed and saved to your repo if you want to ignore it.
  - The file must be untracked, to do so run the following in terminal:
```sh
git rm --cached DESIREDFILENAME
```
