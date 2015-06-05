# Cleans out emacs buffer files if needed.
alias emacs_clean="ec1 | ec2 | ec3"
alias ec1="find . -name '*#' -delete"
alias ec2="find . -name '.#*' -delete"
alias ec3="find . -name '#*#' -delete"

# Alias for the most commonly used ls.
alias ll='ls -l'
alias la='ls -a'
alias lal='ls -ahl'
alias exal="exa -ahl"

# SSH perform remote command
alias ssh-remote-attached-bjoska="ssh -t "
