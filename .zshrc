export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export VISUAL="$EDITOR"

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


# Completions
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Aliases
alias nv="nvim"
alias nv.="nvim ."
alias lg="lazygit"
alias pn="pnpm"
alias oc="opencode"

# Evaluations and sourcing
eval "$(zoxide init zsh)"

source $ZSH/oh-my-zsh.sh
source ~/.safe-chain/scripts/init-posix.sh # Safe-chain Zsh initialization script
