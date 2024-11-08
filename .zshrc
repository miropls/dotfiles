# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/miropls/.zsh/completions:"* ]]; then export FPATH="/home/miropls/.zsh/completions:$FPATH"; fi

export ZSH="$HOME/.oh-my-zsh"

export EDITOR="nvim"
export VISUAL="$EDITOR"

# ZSH_THEME="powerlevel10k/powerlevel10k"

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

alias nv="nvim"
alias nv.="nvim ."
alias cat="bat"
alias gs="git status"
alias pn="pnpm"

eval "$(zoxide init --cmd cd zsh)"

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH/oh-my-zsh.sh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
. "/home/miropls/.deno/env"

# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit

eval "$(starship init zsh)"
