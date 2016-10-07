export PATH=/usr/local/bin:$PATH

deps=(.config_deps/.commands.sh
      .config_deps/.fb_commands.sh
      .config_deps/.git-prompt.sh)

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

if [ -t 1 ]; then
    exec zsh
fi

