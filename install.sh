#!/bin/bash

export PLATFORM=$(uname -s)

# git
git config --global user.email "james.l.kao@gmail.com"
git config --global user.name "James Kao"

if [ $PLATFORM = 'Darwin' ]; then
  # Homebrew
  echo "homebrew update + install"
  [ -z "$(which brew)" ] &&
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  brew install \
    git tmux vim wget zsh python node yarn
  brew install git-delta
  git config --global credential.helper osxkeychain
fi

if [ $PLATFORM = 'Linux' ]; then
  # Linux
  echo "apt-get update + install"
  add-apt-repository ppa:pkg-vim
  apt-get update && apt-get upgrade

  apt-get install git 
  apt-get install zsh
  apt-get install tmux

  apt-get install vim 

  apt-get install wget
  apt-get install python python-dev python3-dev
  apt-get install build-essential cmake
  
  curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash - 
  sudo apt-get install -y nodejs
  
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  apt-get install yarn
fi

# vim plug
sudo chmod 777 ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# creates symbolic links from src/* to ~
(
GLOBIGNORE=.:..:.DS_Store
shopt -s dotglob
ln -sfn $HOME/dotfiles/src/* ~/ 
)

vim +PlugInstall +qall

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# fonts

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
