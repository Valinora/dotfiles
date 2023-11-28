#! /usr/bin/sh

export EDITOR="lvim"
export SUDO_EDITOR="lvim"
export BUN_INSTALL="$HOME/.bun"
export PATH="$PATH:$HOME/bin:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.scripts/bin:$HOME/.ghcup/bin:$HOME/.deno/bin:$BUN_INSTALL/bin"
export DENO_INSTALL="$HOME/.deno"

alias svim="sudoedit"
alias vim="lvim-wrapper.sh"

# bun completions
[ -s "/home/valinora/.bun/_bun" ] && source "/home/valinora/.bun/_bun"
