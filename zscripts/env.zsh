#! /usr/bin/zsh

export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export PATH="$PATH:/home/nilocshot/bin:/home/nilocshot/.cargo/bin:/home/nilocshot/.local/bin"

env_hook_chpwd() {
  export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust"
}

add-zsh-hook chpwd env_hook_chpwd

alias svim="sudoedit"
