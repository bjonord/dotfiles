# export PATH=$PATH:$HOME/.elixir/bin # Add Elixir bin dir to PATH.
export PATH=$PATH:/usr/local/lib/elixir/bin/

export NPM_PACKAGES="$HOME/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"

unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
