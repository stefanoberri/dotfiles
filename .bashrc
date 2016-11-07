# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
#

# some convenient variables to hosts

# prepend useful paths
# /bin in my home
PATH=${HOME}/bin:$PATH

# append extra path
# node.js modules installed in the current directory
PATH=${HOME}/bin:$PATH:./node_modules/.bin 

# Eternal history (it is not working)
# as in https://www.debian-administration.org/article/543/Bash_eternal_history
export HISTTIMEFORMAT="%s "
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo $$ $USER \
               "$(history 1)" >> ~/.bash_eternal_history'




# ALIASES
# colorful ls
alias ls="ls --color=auto"

# change dark blue to light blue for directories
LS_COLORS="$LS_COLORS:di=00;36"

# platform independent
alias l="ls -lrt"
alias tree="tree -C"

# set function to fetch git branch
__git_ps1 ()
{
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -n "$b" ]; then
        printf " +%s" "${b##refs/heads/}";
    fi
}


# change the prompt text and color: some examples

# light blue / cyan shows [mac: DIR]$
# export PS1="\[\e[36m\][mac: \W]\$ \[\e[0m\]"
# purple shows [user@hostname DIR]$
# export PS1="\[\e[35m\][\u@\h \W]\$ \[\e[0m\]"
# white, shows [hostname: DIR]$
# export PS1="\[\e[1;37m\][\h: \W]\$ \[\e[0m\]"

# green 
# the prompt shows [DIR +gitBranch]$ where +gitbranch is in white
export PS1="\[\e[32m\][\W\[\e[37m\]\$(__git_ps1)\[\e[32m\]]\$ \[\e[0m\]"
# red, shows [user@hostname DIR]$
# export PS1="\[\e[31m\][\u@\h \W]\$ \[\e[0m\]"
# red, shows [DIR]$ 
# export PS1="\[\e[31m\][\W]\$ \[\e[0m\]"

# export LANG=en_US.UTF-8


# to use "magic" history (letters+urrow up find last commands in history
# starting with those letters). requires .inputrc
shopt -s histappend
PROMPT_COMMAND='history -a'
HISTSIZE=1500
HISTCONTROL="erasedups:ignorespace"
INPUTRC="~/.inputrc"

# CLASSPATH="$HOME/bin/js.jar"
