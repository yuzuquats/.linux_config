echo importing .bash_profile

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

. ~/.fbchef/environment

export PATH="$HOME/.cargo/bin:$PATH"
