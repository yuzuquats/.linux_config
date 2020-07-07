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

export FLUTTER_ROOT="~/development/flutter"

export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$HOME/Qt/5.9.1/clang_64/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools/platform-tools:$ANDROID_AVD_HOME
export PATH="$PATH":"$HOME/development/flutter/.pub-cache/bin"
export PATH=$HOME/development/flutter/bin:$PATH
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools/platform-tools:$ANDROID_AVD_HOME

export ENABLE_FLUTTER_DESKTOP=true
export RUST_BACKTRACE=full

export PYTHONPATH="$PYTHONPATH:/usr/local/lib/python3.7/site-package"

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_191.jdk/Contents/Home"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_HOME="$ANDROID_HOME"
export ANDROID_SDK_ROOT=$ANDROID_HOME
export ANDROID_AVD_HOME="$HOME/.android/avd"
export ANDROID_NDK_ROOT="$HOME/android_ndk"
export NVM_DIR="$HOME/.nvm"

export DIR_PROJECTS="$HOME/personal"

## Platforms

export DIR_SHARED=""
if [ $PLATFORM = 'Darwin' ]; then
  export XCODE="/Applications/Xcode_11.3.1_fb.app"
  export XCODE="/Applications/Xcode.app"

  export CMAKE_OSX_SYSROOT="$XCODE/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin"
  export CMAKE_C_COMPILER="$XCODE/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc"
  export CMAKE_CXX_COMPILER="$XCODE/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++"
  export CC="$XCODE/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc"
  export CXX="$XCODE/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++"
  export CPATH=`xcrun --show-sdk-path`/usr/include

  export DIR_SHARED="/Volumes/Shared"
  alias ctags="`brew --prefix`/bin/ctags"
  alias node='/usr/local/bin/node'
  alias stayawake="caffeinate -t 7200 &"
  alias timeout="gtimeout"
  alias workout="open https://docs.google.com/spreadsheets/d/1F1ekYp4zPG3rNI5RcfVQCwffMmLMlpiK7cUarNcVbn4/edit#gid=164328593"

fi
if [ $PLATFORM = 'Linux' ]; then
  export DIR_SHARED="/mnt/Shared"
  alias node=nodejs
fi

## Core Commands

alias cl='cd "$@" && ls'
alias copy="tr -d '\n' | pbcopy"

alias c='clear'
alias e='exit'

alias cal="$HOME/personal/calendar/hello_world"

## Git

alias gitk="gitk --all"
gdiffc() {
  git diff $1^!
}
alias gsl="git sl"
alias gsll="git sll"
alias gdiff="git diff HEAD^"
alias gcommit="git add :/;git commit -m "
alias gamend="git add :/; git commit --amend"
alias grebase="git rebase -i origin/master"
alias gc="git checkout "
alias gcont="git rebase --continue"
alias gccont="git cherry-pick --continue"

## Mercurial

alias hgst="hg log -r .^ --template '{desc|firstline}'"
alias hglog="hg log -r .^"
alias fixup="hg amend --fixup"
alias restack="hg restack"
alias he="hg histedit"
alias hgc="he --continue"
alias hdiff="hg diff -r .^"
alias amend="hg amend --addremove"
alias hgdiff="hg diff --pager never"
alias tip="hg up tip"
alias resolve="hg resolve -am"
alias sl="hg sl"

alias bookmark_clean="hg bookmarks | awk '{if (NF == 1) print $1; else print $1;}' | xargs hg bookmark -d"
alias sspng="webkit2png --dir ~ --filename temp "

## Android

alias log="adb logcat"
alias loge="log '*:E'"

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

## nvm

[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion" # This loads nvm bash_completion

## ocaml

alias ocaml="ledit ocaml"

## R

alias r="/Library/Frameworks/R.framework/Resources/bin/R"

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

alias gitconfig='$EDITOR ~/.gitconfig'
alias bashrc='$EDITOR ~/.bashrc'
alias zshrc='$EDITOR ~/.zshrc'
alias vimrc='$EDITOR ~/.vimrc'
alias mainrc='$EDITOR ~/dotfiles/src/.mainrc'
alias commands='$EDITOR ~/.config_deps/.commands.sh'
alias fbcommands='$EDITOR ~/.config_deps/.fb_commands.sh'
alias yuzu='$EDITOR ~/.oh-my-zsh/themes/yuzu.zsh-theme'

## Shortcuts

#alias notes="vim ~/personal/notes -c \"execute 'Goyo'\""

alias ~='cd ~'
alias ..='cd ..'

alias c:='cd /mnt/c'
alias d:='cd /mnt/d'
alias e:='cd /mnt/e'
alias f:='cd /mnt/f'

alias keys='cd "$HOME/keys"'
alias pattern='cd "$HOME/pattern"'
alias notes="cd $HOME/notes"
alias shared="cd $DIR_SHARED"

## Project Shortcuts

alias projects="cd $DIR_PROJECTS"
alias nc="cd $DIR_PROJECTS/yz_notification_center/yz_notification_center"
alias ds="cd $DIR_PROJECTS/YZDesignSystem"

