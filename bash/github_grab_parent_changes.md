# Fetch Changes from parent GitHub Repo

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
