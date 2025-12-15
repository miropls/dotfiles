export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export DOTNET_ROOT="$(dirname $(which dotnet))"

if [[ ! -d "$ZSH" ]]; then
  eval "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [[ ! -d "$ZSH/plugins/zsh-syntax-highlighting" ]]; then
  eval "$(git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/plugins/zsh-syntax-highlighting)"
fi

if [[ ! -d "$ZSH/plugins/zsh-autosuggestions" ]]; then
  eval "$(git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH/plugins/zsh-autosuggestions)"
fi

ZSH_THEME="af-magic"

plugins=(
    git
    sudo
    zsh-syntax-highlighting
    zsh-autosuggestions
)

# Exports
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


# Completions
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Aliases
alias nv="nvim"
alias nv.="nvim ."
alias lg="lazygit"
alias gs="git status"
alias pn="pnpm"
alias oc="opencode"
alias lsql="lazysql"
alias zel="zellij"


# Evaluations and sourcing
eval "$(zoxide init zsh)"

source $ZSH/oh-my-zsh.sh
source ~/.safe-chain/scripts/init-posix.sh # Safe-chain Zsh initialization script
# eval "$(zellij setup --generate-auto-start zsh)"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/paintmi/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# bun completions
[ -s "/Users/paintmi/.bun/_bun" ] && source "/Users/paintmi/.bun/_bun"
export AWS_PROFILE=agent47
