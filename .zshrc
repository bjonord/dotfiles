# I will symlink to this file from ~/..
# The path for RVM
# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# export PATH="/usr/local/heroku/bin:$PATH"
# export PATH="$HOME/.rbenv/shims:$PATH"
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# export RUBYGEMS_GEMDEPS="-"
# source /usr/local/share/chruby/chruby.sh
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.cask/bin:$PATH"

_source_zshd(){
# Finally, source all the files in zsh.d (ALPHA order)
for zshd in $(find ~/.dotfiles/zsh.d/**/*.zsh | sort ); do
    source "${zshd}"
done
}
_source_zshd
