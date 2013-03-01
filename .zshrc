# I will symlink to this file from ~/..

_source_zshd(){
# Finally, source all the files in zsh.d (ALPHA order)
for zshd in $(find ~/.zsh.d/*.zsh | sort ); do
source "${zshd}"
done
}
_source_zshd

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
