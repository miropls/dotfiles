# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/miropls/.zsh/completions:"* ]]; then export FPATH="/home/miropls/.zsh/completions:$FPATH"; fi

export ZSH="$HOME/.oh-my-zsh"

export EDITOR="nvim"
export VISUAL="$EDITOR"

ZSH_THEME="powerlevel10k/powerlevel10k"

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
