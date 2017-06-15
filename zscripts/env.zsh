#! /usr/bin/zsh

export EDITOR="nvim"

env_hook_chpwd() {
  export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src"
}

add-zsh-hook chpwd env_hook_chpwd
