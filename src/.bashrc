export PATH=/usr/local/bin:$PATH

deps=(.bashrc_fb
      git-prompt.sh) 

for i in "${deps[@]}"; 
do
    if [ -f $HOME/$i ];
    then
        source $HOME/$i
    fi
    #echo importing bash dependency: $HOME/$i
done

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

alias re='. ~/.bashrc'
alias edit='vim ~/.bashrc'

alias ls='ls -la'
alias cl='cd "$@" && ls'

alias ~='cd ~'
alias ..='cd ..'

alias c:='cd /mnt/c'
alias d:='cd /mnt/d'
alias em='cd /mnt/c/Users/James/emacs.d'

alias p='cd /mnt/d/yuzuquat/projects'

