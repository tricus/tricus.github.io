# git [⬅️ top](README.md)

## Renaming files/directories
Use the `mv` command:
```bash
git mv oldname newname
```
However, if `newname` already exists and is a directory, this command may move `oldname` inside of `newname`, e.g. `oldname/newname` which may not be desired.

On Windows it may be necessary to tell `git` to be case-sensitive:
If changing *case only* on Windows, it may be necessary to set case-sensitivity, and the rename must be done in two steps:
```bash
git config core.ignorecase false
git mv specificCasedName tempaname
git mv tempname SpecificCasedName
```

## Temporarily preserve changes
```bash
git stash -m "Optional stash message"
```

## Semi-permanently preserve changes
```bash
git commit -a -m "Commit message"
git branch my-saved-work
```
Changes are preserved on branch `my-saved-work`

## Reset local branch so it is the same as a fresh clone (discards commits and changes)
```bash
# Get latest
git fetch origin
# Reset to current upstream branch
git reset --hard "@{u}"
# OR reset to a particular authoritative branch
git reset --hard origin/master
# Delete untracked local files -d=recurse -f=force -x=include ignored -X=only ignored -n=dry-run
git clean -d -f -n 
```

## Restore a commit lost by a `reset`
```bash
# Find the commit in the log
git reflog
# Restore the commit to the current branch
git cherry-pick $hash
```

## Catch a branch up to current HEAD of original source branch
Different options:  
- Option 1. Merge from original source branch
   ```bash
   git pull origin develop
   ```
   > This form of `pull` does a `fetch` and a `merge`.
- Option 2. Rebase current branch onto original source branch
   ```bash
   git pull
   git rebase origin/develop
   ```
   > The `pull` gets the latest changes and the `rebase` replays commits on the branch against the new content.
- Option 3. Rebase during pull
   ```bash
   git pull --rebase
   ```
   > Performs `fetch` and `rebase`

## Oops, I made a local commit on `main` instead of on a working branch

No problem.  The commit doesn't "belong" to the current branch.  Simply create a new branch: `git switch -c my-working-branch` and the commit will "follow" you there.
  
However, the upstream may have been set to `origin/main` so a regular `git push` will fail (due to policy).  Instead use: `git push origin HEAD` to push to the remote with the new branch name.

To fix the upstream remote use: `git branch my-working-branch --set-upstream-to origin/my-working-branch`
