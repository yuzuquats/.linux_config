echo importing .zshrc

export TERM="screen-256color"
export ZSH=$HOME/.oh-my-zsh

plugins=(git 
         zsh-syntax-highlighting
         history-substring-search)

## Theme
ZSH_THEME="bullet-train"

BULLETTRAIN_PROMPT_SEPARATE_LINE=true
BULLETTRAIN_PROMPT_ADD_NEWLINE=true
BULLETTRAIN_PROMPT_ROOT=false
BULLETTRAIN_DIR_SHOW=true
BULLETTRAIN_NVM_SHOW=false
BULLETTRAIN_TIME_SHOW=false
BULLETTRAIN_NVM_PREFIX="੦ "
BULLETTRAIN_STATUS_SHOW=true
BULLETTRAIN_STATUS_EXIT_SHOW=true
BULLETTRAIN_CONTEXT_SHOW=true

## history-substring-search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down


source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/src/.mainrc

zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

