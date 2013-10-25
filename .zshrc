# I will symlink to this file from ~/..
# The path for RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="/usr/local/heroku/bin:$PATH"

_source_zshd(){
# Finally, source all the files in zsh.d (ALPHA order)
for zshd in $(find ~/.zsh.d/*.zsh | sort ); do
source "${zshd}"
done
}
_source_zshd
