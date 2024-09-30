# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    sudo
    zsh-autosuggestions
    zsh-syntax-highlighting
)
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export DENO_INSTALL="/home/miropls/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/$HOME/go/bin"
export PATH="$PATH:/$HOME/.composer/vendor/bin"

alias nv="nvim"
alias cat="bat"

eval "$(zoxide init --cmd cd zsh)"

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
