set -o vi  # command-line vim

if [ -z "$DISPLAY" ]; then
  export DISPLAY=localhost:0.0
fi

if [ "$TERM" = "xterm" ]; then
  export TERM=xterm-256color
fi

export PLATFORM=$(uname -s)
export EDITOR=vim
export GIT_EDITOR=$EDITOR
export FPP_EDITOR=$EDITOR
export LANG=en_US.UTF-8
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_111.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$HOME/Qt/5.9.1/clang_64/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export ANDROID_AVD_HOME="/var/root/.android/avd"

alias cl='cd "$@" && ls'
alias copy="tr -d '\n' | pbcopy"

alias c='clear'
alias e='exit'

## mac

if [ $PLATFORM = 'Darwin' ]; then
  alias ctags="`brew --prefix`/bin/ctags"
  alias node='/usr/local/bin/node'
  alias stayawake="caffeinate -t 7200 &"
fi

## linux

if [ $PLATFORM = 'Linux' ]; then
  alias node=nodejs
fi

## Git

alias gitk="gitk --all"

## Mercurial

alias hgst="hg log -r .^ --template '{desc|firstline}'"
alias hglog="hg log -r .^"
alias fixup="hg amend --fixup"
alias restack="hg restack"
alias he="hg histedit"
alias hgc="he --continue"
alias diff="hg diff -r .^ --pager never"
alias amend="hg commit --amend --addremove -M ."
alias hgdiff="hg diff --pager never"
alias tip="hg up tip"

alias bookmark_clean="hg bookmarks | awk '{if (NF == 1) print $2; else print $1;}' | xargs hg bookmark -d"

## Android

alias log="adb logcat"

## tmux

alias tmux='tmux -2'  # for 256color
alias tmux='tmux -u'  # to get rid of unicode rendering problem

## ctags

alias gctags="ctags -R --exclude=.git --exclude=log *"

function install_jsctags {
  npm install jsctags
  # https://github.com/mozilla/doctorjs/issues/52
  gsed -i '51i tags: [],' ./node_modules/jsctags/jsctags/ctags/index.js
}

## ocaml

alias ocaml="ledit ocaml"

## color ls

if [ -x /usr/bin/dircolors ]; then
  eval "`dircolors -b`"
  alias ls='ls -FA --color=auto'
  alias grep='grep --color=auto'
elif [ "$PLATFORM" = Darwin ]; then
  alias ls='ls -GFA'
fi

## dotfiles

alias re='. ~/.bashrc'

alias bashrc='$EDITOR ~/.bashrc'
alias zshrc='$EDITOR ~/.zshrc'
alias vimrc='$EDITOR ~/.vimrc'
alias mainrc='$EDITOR ~/dotfiles/src/.mainrc'
alias commands='$EDITOR ~/.config_deps/.commands.sh'
alias fbcommands='$EDITOR ~/.config_deps/.fb_commands.sh'

## Shortcuts

alias ~='cd ~'
alias ..='cd ..'

alias c:='cd /mnt/c'
alias d:='cd /mnt/d'
alias e:='cd /mnt/e'
alias f:='cd /mnt/f'

function aye {
  local dir='abcd'
  if [ $dir = "blah" ]; then
    echo "equals"
  elif [ $dir = "abcd" ]; then
    echo "abcd"
  fi
}
