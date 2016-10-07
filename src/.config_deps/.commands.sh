set -o vi

test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

if [ -z "$DISPLAY" ]; then
    export DISPLAY=localhost:0.0
fi

export GIT_EDITOR=vim

if [ "$TERM" = "xterm" ]; then
  export TERM=xterm-256color
fi
alias tmux='tmux -2'  # for 256color
alias tmux='tmux -u'  # to get rid of unicode rendering problem

alias editc='vim ~/.config_deps/.commands.sh'

alias ls='ls -la --color'
alias cl='cd "$@" && ls'

alias ~='cd ~'
alias ..='cd ..'

alias c:='cd /mnt/c'
alias d:='cd /mnt/d'
alias e:='cd /mnt/e'
alias f:='cd /mnt/f'

alias em='cd /mnt/c/Users/James/emacs.d'

alias p='cd /mnt/d/yuzuquat/projects'

alias node='nodejs'
