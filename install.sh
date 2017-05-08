#!/bin/bash

export $HOME ~
cd ~

# git
git config --global user.email "james.l.kao@gmail.com"
git config --global user.name "James Kao"

if [ $(uname -s) = 'Darwin' ]; then
  # Homebrew
  echo "homebrew update + install"
  [ -z "$(which brew)" ] &&
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  brew install \
    git tmux vim wget zsh python node yarn
  git config --global credential.helper osxkeychain
fi

if [ $(uname -s) = 'Linux' ]; then
  # Linux
  echo "apt-get update + install"
  apt-get update

  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  apt-get install \
    git tmux vim wget zsh python node yarn
fi

# vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# git-prompt
if [ ! -e ~/.git-prompt.sh ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
fi

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# creates symbolic links from src/* to ~
(
GLOBIGNORE=.:..:.DS_Store
shopt -s dotglob
ln -sfn $PWD/src/* ~/ 
)

vim +PlugInstall +qall
