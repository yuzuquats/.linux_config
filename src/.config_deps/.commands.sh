set -o vi  # command-line vim

if [ -z "$DISPLAY" ]; then
  export DISPLAY=localhost:0.0
fi

if [ "$TERM" = "xterm" ]; then
  export TERM=xterm-256color
fi

export EDITOR=vim
export GIT_EDITOR=$EDITOR

alias ls='ls -GFA'
alias cl='cd "$@" && ls'
alias copy="tr -d '\n' | pbcopy"

alias c='clear'
alias e='exit'

alias node='/usr/local/bin/node'

## Git

alias gitk="gitk --all"

## Mercurial

alias hgst="hg log -r .^ --template '{desc|firstline}'"
alias hglog="hg log -r .^"

## tmux

alias tmux='tmux -2'  # for 256color
alias tmux='tmux -u'  # to get rid of unicode rendering problem

## dotfiles

alias re='. ~/.bashrc'

alias bashrc='$EDITOR ~/.bashrc'
alias zshrc='$EDITOR ~/.zshrc'
alias vimrc='$EDITOR ~/.vimrc'
alias mainrc='$EDITOR ~/.linux_config/src/.mainrc'
alias commands='$EDITOR ~/.config_deps/.commands.sh'
alias fbcommands='$EDITOR ~/.config_deps/.fb_commands.sh'

## Shortcuts

alias ~='cd ~'
alias ..='cd ..'

alias c:='cd /mnt/c'
alias d:='cd /mnt/d'
alias e:='cd /mnt/e'
alias f:='cd /mnt/f'
