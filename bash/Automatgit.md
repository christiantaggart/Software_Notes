### Two letter For frequent git VCS Usability
- Without text specified after `ag` it will commit with the Standard Commit Message;
- No need for quotes it will remove them; but apostrophes are a problem currently. so use bad grammar
  - Example Use:
```sh
ag This is a commit message, notice I didnt need to wrap my message in quotes. I just simply write my message after invoking the function. So silky smooth I will probably decide to commit more often
```

**Result:** This is a commit message, notice I didn't need to wrap my message in quotes. I just simply write my message after invoking the function. So silky smooth I will probably decide to commit more often


```sh
#---------------------------
# AUTOMATGIT ================================================================
# --------------------------
ag(){
  git add -A;
    if [[ -z "$*"  ]]; then
      git commit -m "USER_NAME_GOES_HERE is committing something on git";
    else
      git commit -m "$*";
    fi
      git push;
}
# ------------------ END AUTOMATGIT --------------------------
```
