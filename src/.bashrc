echo importing .bashrc

if [ -t 1 ]; then
  exec zsh
fi

source ~/dotfiles/src/.mainrc

function prompt_command {
  BOLD="\[\033[1m\]"
  RED="\[\033[1;31m\]"
  GREEN="\[\e[32;1m\]"
  BLUE="\[\e[34;1m\]"
  CYAN="\[\e[36m\]"
  OFF="\[\033[m\]"

  INFO="${RED}\h${OFF}@${CYAN}$PWD${OFF}"
  GIT='$(__git_ps1 " (%s)")'
  PROMPT="> "

  if [ "$?" -eq 0 ]
  then
    EXITSTATUS="\n${BOLD}${GREEN}$?${OFF} | "
  else
    EXITSTATUS="\n${BOLD}${RED}$?${OFF} | "
  fi

  PS1="${EXITSTATUS}${INFO}${GIT}\n${PROMPT}"
}

PROMPT_COMMAND=prompt_command

export PATH="$HOME/.yarn/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

PATH=$PATH:~/node_modules/@babel/cli/bin
export NODE_PATH=$(npm root --quiet -g)
PATH=$PATH:$NODE_PATH
