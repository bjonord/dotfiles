export PATH="/usr/local/sbin:$PATH"
PATH="/usr/local/bin:$PATH"
PATH="/usr/local/opt/gnu-getopt/bin:$PATH"

ZSH_DISABLE_COMPFIX="true"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

eval "$(rbenv init -)"

# PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
# PATH="$HOME/.jenv/bin:$PATH"

PATH="$PATH:$HOME/bin"
PATH="$PATH:$HOME/.cask/bin"
# PATH="$PATH:$TSPATH/extra/admin_scripts"
# PATH="$PATH:$SMPATH/scripts"


_source_zshd(){
# Finally, source all the files in zsh.d (ALPHA order)
for zshd in $(find ~/.dotfiles/zsh.d/**/*.zsh | sort ); do
    source "${zshd}"
done
}
_source_zshd

# added by travis gem
# [ -f /Users/bjorn/.travis/travis.sh ] && source /Users/bjorn/.travis/travis.sh

# Clean up PATH from duplicates etc.
PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"

# eval "$(jenv init -)"

autoload bashcompinit
bashcompinit

