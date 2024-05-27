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
