# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/miropls/.zsh/completions:"* ]]; then export FPATH="/home/miropls/.zsh/completions:$FPATH"; fi

export ZSH="$HOME/.oh-my-zsh"

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
alias hx.="hx ."
alias cat="bat"
alias gs="git status"
alias pn="pnpm"
alias lg="lazygit"

eval "$(zoxide init --cmd cd zsh)"

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH/oh-my-zsh.sh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
. "/home/miropls/.deno/env"

# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit

export PATH="/home/miropls/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/miropls/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# bun completions
[ -s "/home/miropls/.bun/_bun" ] && source "/home/miropls/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export ANDROID_HOME=$HOME/Android/Sdk 
export PATH=$PATH:$ANDROID_HOME/emulator 
export PATH=$PATH:$ANDROID_HOME/platform-tools

export HELIX_RUNTIME=~/Repositories/helix/runtime

# eval "$(starship init zsh)"
export PATH=$HOME/Repositories/Odin:$PATH
