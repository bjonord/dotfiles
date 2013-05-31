EDITOR="emacsclient -c" # default editor emacs.
VISUAL="emacsclient -c" # as above

# no more vi!
alias vim='emacsclient -c'
alias vi='emacsclient -c'

# terminal editor
alias e="emacsclient -t -a emacs"
alias E="SUDO_EDITOR=\"emacsclient -t -a emacs\" sudoedit"