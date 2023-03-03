#!/bin/bash

if [[ ! -a ${HOME}/.local/bin/lvim ]]; then
  # LunarVim not installed, so we install it.
  bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
else
  exec lvim "$@"
fi
