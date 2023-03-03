#! /usr/bin/sh

export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export PATH="$PATH:$HOME/bin:$HOME/.cargo/bin:$HOME/.local/bin"

if [[ ! -a ~/.local/bin/lvim ]]; then
  # TODO: Re-write this to run an install prompt on first use of the command.
  bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
fi

alias svim="sudoedit"
alias vim="lvim"
