# Cleans out emacs buffer files if needed.
alias emacs_clean="ec1 | ec2 | ec3"
alias ec1="find . -name '*#' -delete"
alias ec2="find . -name '.#*' -delete"
alias ec3="find . -name '#*#' -delete"

# SSH perform remote command
alias ssh-remote-attached-bjoska="ssh -t "
