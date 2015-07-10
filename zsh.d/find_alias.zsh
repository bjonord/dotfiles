# locate a specific file name using ag and tree in current directory.
alias treeag="tree ./ -af -I '.git' | ag"
alias gals-files="git ls-files | ag"
alias gitlsfiles="gals-files"