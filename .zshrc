export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom/plugins"

export EDITOR="nvim"
export VISUAL="$EDITOR"

ZSH_THEME="af-magic"

plugins=(
    git
    sudo
)

# Exports
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/$HOME/go/bin"
export PATH="$HOME/.local/bin:$PATH"

# Android
export ANDROID_HOME=$HOME/Android/Sdk 
export PATH=$PATH:$ANDROID_HOME/emulator 
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH=$HOME/odin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Aliases
alias nv="nvim"
alias nv.="nvim ."
alias hx.="hx ."
alias lg="lazygit"
alias cat="bat"
alias pn="pnpm"
alias gs="git status"
alias btp="bluetoothctl pair 38:18:4C:22:01:43"
alias btc="bluetoothctl connect 38:18:4C:22:01:43"
alias btd="bluetoothctl disconnect 38:18:4C:22:01:43"

eval "$(zoxide init --cmd cd zsh)"

source $ZSH_CUSTOM/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_CUSTOM/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH/oh-my-zsh.sh

# Turso
export PATH="$PATH:/home/miropls/.turso"

# bun completions
[ -s "/Users/paintmi/.bun/_bun" ] && source "/Users/paintmi/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

source ~/.safe-chain/scripts/init-posix.sh # Safe-chain Zsh initialization script
