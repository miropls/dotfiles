# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/miropls/.zsh/completions:"* ]]; then export FPATH="/home/miropls/.zsh/completions:$FPATH"; fi

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"

export EDITOR="nvim"
export VISUAL="$EDITOR"

ZSH_THEME="af-magic"

plugins=(
    git
    sudo
)

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export DENO_INSTALL="/home/miropls/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/$HOME/go/bin"
export PATH="$PATH:/$HOME/.composer/vendor/bin"
export PATH="$PATH:/home/miropls/.turso"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/odin:$PATH"

alias nv="nvim"
alias nv.="nvim ."
alias cat="bat"
alias pn="pnpm"
alias gs="git status"
alias xi="xbps-install"
alias xq="xbps-query -Rs"
alias xql="xbps-query"
alias xr="xbps-remove"
alias dayz="cd ~/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/common/DayZServer"

eval "$(zoxide init --cmd cd zsh)"

source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export ANDROID_HOME=$HOME/Android/Sdk 
export PATH=$PATH:$ANDROID_HOME/emulator 
export PATH=$PATH:$ANDROID_HOME/platform-tools

source $ZSH/oh-my-zsh.sh
