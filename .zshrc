ulimit -Sn 64000
ulimit -Sl 200000

export PATH="/usr/local/sbin:$PATH"
PATH="/usr/local/bin:$PATH"
PATH="/opt/homebrew/opt/gnu-getopt/bin:$PATH"

ZSH_DISABLE_COMPFIX="true"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

eval "$(rbenv init - zsh)"

PATH="$PATH:$HOME/bin"
PATH="$PATH:$HOME/zsh-bin"
PATH="$PATH:$HOME/.cask/bin"
PATH="$PATH:$HOME/.cargo/env"

_source_zshd(){
# Finally, source all the files in zsh.d (ALPHA order)
for zshd in $(find ~/.dotfiles/zsh.d/**/*.zsh | sort ); do
    source "${zshd}"
done
}
_source_zshd

# Clean up PATH from duplicates etc.
PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

source "$HOME/.cargo/env"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"

. /opt/homebrew/opt/asdf/libexec/asdf.sh


source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

complete -o nospace -C /opt/homebrew/bin/terraform terraform

if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

export OP_SESSION_teamtailor="UWoE7p4kDLuOTDWWHXamRZMvX_hZF53dh40U2y5N-5M"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
eval "$(atuin init zsh)"
