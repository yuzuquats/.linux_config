echo importing .zshrc
alias shared="cd /Volumes/notes"

export TERM="screen-256color"
export ZSH=$HOME/.oh-my-zsh
setopt NULL_GLOB

## disable mysterious repeate of commands
DISABLE_AUTO_TITLE="true"

plugins=(git 
         history-substring-search)

## Theme
ZSH_THEME="yuzu"

## history-substring-search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/src/.mainrc

zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

