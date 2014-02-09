alias sel_gbranch="git branch --all --remotes | cut -c 3- | rev | cut -d \"/\" -f 1 | rev | selecta | xargs git checkout"
alias sel_vi="vim \`find . -type f -name '*' | selecta\`"
alias sel_virb="vim \`find . -type f -name '*.rb' | selecta\`"
alias sel_vilog="vim \`find . -type f -name '*.log' | selecta\`"
alias sel_rakeT="rake \`rake -T | selecta | cut -f2 -d' '\`"

# Selecta with functions:
alias sel_grepvi="~/.zsh.d/functions/grep_selecta.zsh"

# not ready:
# alias sel_pi_kill="kill \`ps aux | selecta | awk '{print $2 }'\`"
