# Check frequency of commands used.
alias freqcommands="history | cut -c8- | sort | uniq -c | sort -rn | head"
alias comeon="sudo $(history -p \!\!)"