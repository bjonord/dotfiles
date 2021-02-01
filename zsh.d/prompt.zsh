# set 256color term
export TERM=xterm-256color

# superglobs
setopt extendedglob
unsetopt caseglob

# Bigger history file.
HISTFILE=~/.zhistory
HISTSIZE=50000
SAVEHIST=20000
## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

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
# Make sure to install exa instead see rust-nix-util-alias.zsh.

# Reports CPU usage for processes taking longer than 10 seconds to execute.
REPORTTIME=10

# Could be used to put command in history.
setopt interactivecomments # pound sign in interactive prompt

# A nicer prompt.
PS1='[%T] %n:/%3~:> '

# Old version with a full path.
# PS1='[%T] %n:%~:> '
