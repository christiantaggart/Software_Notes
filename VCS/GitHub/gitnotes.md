# git notes
[Docs](https://git-scm.com/book/en/v2/Getting-Started-Git-Basics)
**git** is a Version Control System, a tool to manage your source code history.
**GitHub** is a hosting service for Git repositories.

- unstaged:
<!-- done stuff in atom -->

- staged: Ready to added or committed

- committed: has been added to repository



- `git init`: command through the CLI Creates the repository

- `git status`: command through CLI tells you the status of the repository (files, commits, etc)

- `git add -A`: command through CLI adds to staging area

- `git commit -m "Your Message Here"`: command through CLI will commit your change along with a message(describing the commit)

- `git log`: shows all commits copy git commit KEYID(number/hash)

`git checkout`: specific commit KEYID(number/hash)

`git revert`: to un-delete a commit(needs more infos here: <https://git-scm.com/docs/git-revert>)

Git commands used in various situations:

start a working area (see also: git help tutorial) clone Clone a repository into a new directory init Create an empty Git repository or reinitialize an existing one

work on the current change (see also: git help everyday) add Add file contents to the index mv Move or rename a file, a directory, or a symlink reset Reset current HEAD to the specified state rm Remove files from the working tree and from the index

examine the history and state (see also: git help revisions) bisect Use binary search to find the commit that introduced a bug grep Print lines matching a pattern log Show commit logs show Show various types of objects status Show the working tree status

grow, mark and tweak your common history branch List, create, or delete branches checkout Switch branches or restore working tree files commit Record changes to the repository diff Show changes between commits, commit and working tree, etc merge Join two or more development histories together rebase Reapply commits on top of another base tip tag Create, list, delete or verify a tag object signed with GPG

collaborate (see also: git help workflows) fetch Download objects and refs from another repository pull Fetch from and integrate with another repository or a local branch push Update remote refs along with associated objects

'git help -a' and 'git help -g' list available subcommands and some concept guides. See 'git help
