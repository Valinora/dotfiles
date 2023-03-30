#! /usr/bin/sh

export EDITOR="lvim"
export SUDO_EDITOR="lvim"
export PATH="$PATH:$HOME/bin:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.scripts/bin"
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gcr/ssh"

alias svim="sudoedit"
alias vim="lvim-wrapper.sh"
