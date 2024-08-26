###### <top>
[⬅️ toc](./README.md)
# git

## Convenience script for cloning a repo
> Save as `%USERPROFILE%\source\repos\git-clone.cmd`
```cmd
@echo off
setlocal

REM *** Clone a repo
REM ***
REM *** Usage:
REM ***   Clone to directory with same name:
REM ***     git-clone
REM ***   Clone to new directory:
REM ***     git-clone <directory>

REM *** If repo url contains a % character, it must be double-escaped (i.e. %%%%) because:
REM *** One substitution happens in the `set repo` line
REM *** Another substitution happens inside the `:runcmd` subroutine
set repo=https://<USER>@dev.azure.com/<ORG>/<PROJECT>/_git/<REPO>

REM set cmd=git clone %repo% %1
REM echo %cmd%
REM %cmd%
call :runcmd git clone "%repo%" %1
if ERRORLEVEL 1 exit /b

set target=%1
if "%target%" == "" (
  for %%A in ("%repo%") do (
    set target=%%~nA
  )
)
cd %target%

call :runcmd git switch develop
if ERRORLEVEL 1 exit /b

call :runcmd git branch --list
if ERRORLEVEL 1 exit /b

set /p "branch=Enter name for new branch: "
if "%branch%" neq "" (
  call :runcmd git switch -c %branch%
  if ERRORLEVEL 1 exit /b
  call :runcmd git branch --list
  if ERRORLEVEL 1 exit /b
)

code .

goto :eof


REM *** Subroutine to echo and execute stored command text
:runcmd
@echo on
%*
@echo off
goto :eof
```
[⬆️top](#top)

## Renaming files/directories (locally)
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
[⬆️top](#top)

## Renaming a remote branch
```bash
git push <remote> <remote>/<old_name>:refs/heads/<new_name> :<old_name>
```
> Credit https://stackoverflow.com/a/21302474

[⬆️top](#top)

## Temporarily preserve changes
```bash
git stash -m "Optional stash message"
```
[⬆️top](#top)

## Semi-permanently preserve changes
```bash
git commit -a -m "Commit message"
git branch my-saved-work
```
Changes are preserved on branch `my-saved-work`  
[⬆️top](#top)

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
[⬆️top](#top)

## Restore a commit lost by a `reset`
```bash
# Find the commit in the log
git reflog
# Restore the commit to the current branch
git cherry-pick $hash
```
[⬆️top](#top)

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

[⬆️top](#top)

## Oops, I made a local commit on `main` instead of on a working branch

No problem.  The commit doesn't "belong" to the current branch.  Simply create a new branch: `git switch -c my-working-branch` and the commit will "follow" you there.
  
However, the upstream may have been set to `origin/main` so a regular `git push` will fail (due to policy).  Instead use: `git push origin HEAD` to push to the remote with the new branch name.

To fix the upstream remote use: `git branch my-working-branch --set-upstream-to origin/my-working-branch`  
[⬆️top](#top)

## Squash all local commits into one local commit
```bash
git reset --soft $(git merge-base main HEAD)
git commit -m "Commit message for your single commit"
```
> Credit https://stackoverflow.com/a/25357146

[⬆️top](#top)