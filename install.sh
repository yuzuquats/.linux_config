#!/bin/bash

# creates symbolic links from src/* to ~
(
GLOBIGNORE=.:..:.DS_Store
shopt -s dotglob
ln -sfn $PWD/src/* ~/ 
)

# git-prompt
if [ ! -e ~/.git-prompt.sh ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
fi

if [ $(uname -s) = 'Darwin' ]; then
  # Homebrew
  [ -z "$(which brew)" ] &&
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  echo "Updating homebrew"
  brew install \
    git tmux vim wget zsh python node yarn
fi

if [ $(uname -s) = '']; then

  apt-get install \
    git tmux vim wget zsh python node yarn
fi

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# git
git config --global user.email "james.l.kao@gmail.com"
git config --global user.name "James Kao"
git config --global credential.helper osxkeychain

# vim plug
curl --insecure -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall
