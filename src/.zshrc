echo importing .zshrc

export TERM="screen-256color"
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bullet-train"

BULLETTRAIN_PROMPT_SEPARATE_LINE=true
BULLETTRAIN_PROMPT_ADD_NEWLINE=true
BULLETTRAIN_PROMPT_ROOT=false
BULLETTRAIN_DIR_SHOW=true
BULLETTRAIN_NVM_SHOW=true
BULLETTRAIN_NVM_PREFIX="੦ "
BULLETTRAIN_STATUS_SHOW=true
BULLETTRAIN_STATUS_EXIT_SHOW=true
BULLETTRAIN_CONTEXT_SHOW=true

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $HOME/.linux_config/src/.mainrc

zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

