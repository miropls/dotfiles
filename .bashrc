# Exports
export EDITOR="nvim"
export VISUAL="$EDITOR"
export DOTNET_ROOT="$(dirname $(which dotnet))"

export XDG_CONFIG_HOME="$HOME/.config"

# Go
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/$HOME/go/bin"
export PATH="$HOME/.local/bin:$PATH"

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools"

# Odin
export PATH="$PATH:$HOME/odin"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Cargo
export PATH="$PATH:$HOME/.cargo/bin"

# Settings and some keybinds
bind -s "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"

bind 'TAB:menu-complete'
bind '"\e[Z": menu-complete-backward'
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
bind '"\e[1;5C":forward-word'
bind '"\e[1;5D":backward-word'

# Completions
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Aliases
alias nv="nvim"
alias nv.="nvim ."

alias ls="eza --icons"
alias la="eza -la --icons"
alias ll="eza -ll --icons"

alias ..="cd .."
alias ...='../..'
alias ....="cd ../.."
alias .....='../../..'
alias ......="cd ../../.."
alias .......='../../../..'
alias ........="cd ../../../.."
alias .........='../../../../..'
alias ...........='../../../../../..'

alias lg="lazygit"
alias gs="git status"
alias pn="pnpm"
alias oc="opencode"
alias lsql="lazysql"
alias zel="zellij"

. "$HOME/.local/bin/env"

source ~/.safe-chain/scripts/init-posix.sh # Safe-chain bash initialization script
source ~/git-prompt.sh
eval "$(zoxide init bash)"

case "$TERM" in
    xterm-color|*-256color|*alacritty) color_prompt=yes;;
esac

export PS1='\[\e[97;2m\]\w\[\e[0m\]\[\e[32m\]$(__git_ps1 " (%s)")\[\e[35m\] \[\e[35m\]\[\e[0m\] '
