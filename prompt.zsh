# set 256color term
export TERM=xterm-256color


# superglobs
setopt extendedglob
unsetopt caseglob

# Bigger history file.
HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=10000
setopt incappendhistory 
setopt sharehistory
setopt extendedhistory

# This provides a more extensive tab completion.
autoload -U compinit
compinit

# Enables tab completion from both ends.
setopt completeinword

# Completion will be case insensitive.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Better completion for killall
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

# Colors for ls
if [[ -x "`whence -p dircolors`" ]]; then
  eval `dircolors`
  alias ls='ls -F --color=auto'
else
  alias ls='ls -F'
fi

# Alias for the most commonly used ls.
alias ll='ls -l'
alias la='ls -a'
alias lal='ls -al'

# Reports CPU usage for processes taking longer than 10 seconds to execute.
REPORTTIME=10

# Could be used to put command in history.
setopt interactivecomments # pound sign in interactive prompt

# A nicer prompt.
PS1='[%T] %n:/%3~:> '

# Old version with a full path.
# PS1='[%T] %n:%~:> '
