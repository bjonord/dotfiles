require 'irb/completion'
require 'irb/ext/save-history'
#History configuration
IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

ENV["VISUAL"] = "/usr/local/bin/code"

# Autocomplete stuff
# IRB.conf[:USE_AUTOCOMPLETE] = false
# IRB.conf[:USE_COLORIZE] = false
