source ~/.zplug/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "zsh-users/zsh-history-substring-search"


zplug "hevi9/infoline-zsh-theme", as:theme

zplug "~/.zsh", from:local

zplug load
