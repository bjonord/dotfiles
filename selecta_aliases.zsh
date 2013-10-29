alias selecta_gbranch="git branch --all --remotes | cut -c 3- | rev | cut -d \"/\" -f 1 | rev | selecta | xargs git checkout"
alias selecta_vi_files="vim \`find . -type f -name '*.rb' | selecta\`"
alias selecta_rake_T="rake \`rake -T | selecta | cut -f2 -d' '\`"

# not ready:
# alias selecta_pi_kill="kill \`ps aux | selecta | awk '{print $2 }'\`"
