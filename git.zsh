# Git aliases
alias 'gc=git commit'
alias 'gcm=git commit -m'
alias 'gaA=git add -A'
alias 'gap=git add -p'
alias 'gcop=git checkout -p'
alias 'gco=git checkout'
alias 'gacm=gaA; gcm'
alias 'gstat=git status'
alias 'gdiffc=git diff --cached'
alias 'gdiff=git diff'
alias "glg=git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gitrma="sh -c 'git ls-files --deleted | xargs -r git rm'"
alias "gstu=git log --reverse --branches --since='$(if [[ "Mon" == "$(date +%a)" ]]; then echo "last friday"; else echo "yesterday"; fi)' --author=$(git config --get user.email) --format=format:'%C(cyan) %ad %C(yellow)%h %Creset %s %Cgreen%d' --date=local"
