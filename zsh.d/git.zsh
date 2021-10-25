# Git aliases
alias 'gc=git commit'
alias 'gcm=git commit -m'
alias 'gaA=git add -A'
alias 'gap=git add -p'
alias 'gcop=git checkout -p'
alias 'gco=fgco'
alias 'gcom=git mainco'
alias 'gpom=git mainpo'
alias 'grem=git rebma'
alias 'gfor=git feorigin'
alias 'gco-=gco -'

function grepco {
  git branch | grep $1 | head -n1 | awk '{print $1}' | xargs git checkout
}

function fgco {
 if [ -z $1 ]; then
   git for-each-ref --format='%(refname:short)' refs/heads | fzf | xargs git checkout
 else
   git checkout $*
 fi
}

# alias 'grepco=git branch | grep $1 | xargs git checkout'
alias 'gcoh=git checkout HEAD --'
alias 'gacm=gaA; gcm'
alias 'gstat=git status --short --branch'
alias 'gdiffc=git diff --cached --patience'
alias 'gdiff=git diff --patience'
alias 'gpr=git pull --rebase'
alias "glg=git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gitrma="sh -c 'git ls-files --deleted | xargs -r git rm'"
alias "gstu=git log --reverse --branches --since='$(if [[ "Mon" == "$(date +%a)" ]]; then echo "last friday"; else echo "yesterday"; fi)' --author=$(git config --get user.email) --format=format:'%C(cyan) %ad %C(yellow)%h %Creset %s %Cgreen%d' --date=local"
alias 'wtf=git blame'
alias "glgsearch=glg -S"
alias 'fgcob=git branch | fpp -nfc -ai -c gco'
alias 'fgap=gstat | fpp -c gap'
alias 'fdiff=gstat | fpp -c gdiff'
alias 'frspec=gstat | fpp -c rspec'
