### I don't remember why I needed this.

```sh
# BASH TO GRAB STUFF FROM PARENT GIT REPO ==============================
grabgit(){
  fold="${PWD##*/}"
  git checkout master
  git fetch upstream
  git rebase upstream/master
  git checkout -b $fold
  git push -u origin $fold
}
# BASH TO GRAB STUFF FROM PARENT GIT REPO ==============================

```
