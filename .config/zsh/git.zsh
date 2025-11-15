# aliases
alias g="git"
alias ga="git add"
alias gb="git branch"
alias gbc="git branch --show-current"
alias gbd="git branch -d"
alias gbD="git branch -D"
alias gbm="git branch --merged"
alias gc="git commit"
alias gca="git commit --amend"
alias gcnv="git commit --no-verify"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gd="git diff"
alias gds="git diff --staged"
alias gdw="git diff --word-diff=color"
alias gl="git pull"
alias gf="git fetch"
alias glg="git log"
alias gm="git merge"
alias gr="git rebase"
alias gri="git rebase -i"
alias grc="git rebase --continue"
alias gre="git reset"
alias gp="git push"
alias gpbc='git push -u origin $(git branch --show-current)'
alias gpfwl='git push --force-with-lease'
alias gs="git status"
alias gss="git status -s"
alias gst="git stash"
alias gstl="git stash list"
alias gsta="git stash apply"
alias gstp="git stash pop"
alias gstpu="git stash push -u"
alias gsw="git switch"
alias gwt="git worktree"
alias gchp="git cherry-pick"
alias gsh="git show"

# functions
function gfco() {
  local branches branch
  branches=$(git --no-pager branch --format="%(refname:short)") &&
  branch=$(echo "$branches" | fzf +m) &&
  print -z git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

function gfbd() {
  local branches branch
  branches=$(git --no-pager branch --format="%(refname:short)" --merged) &&
  branch=$(echo "$branches" | fzf +m) &&
  print -z git branch -d $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

function gfbD() {
  local branches branch
  branches=$(git --no-pager branch --format="%(refname:short)") &&
  branch=$(echo "$branches" | fzf +m) &&
  print -z git branch -D $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

function gfm() {
  local branches branch
  branches=$(git --no-pager branch --format="%(refname:short)") &&
  branch=$(echo "$branches" | fzf +m) &&
  print -z git merge $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

function gfri() {
  local branches branch
  branches=$(git --no-pager branch --format="%(refname:short)") &&
  branch=$(echo "$branches" | fzf +m) &&
  print -z git rebase -i $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
