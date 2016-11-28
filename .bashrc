# This contains instructions for bash. They are mostly customisations of look
# and feel. System wide configurations (exports, modules and so on) should go
# in ~/.bash_profile

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

function sourceit(){ [ -r "$1" ] && [ -f "$1" ] && source "$1"; }

# host specific settings
sourceit $HOME/.extrarc
# set aliases
sourceit $HOME/.aliases
# change the prompt text and color: some examples
sourceit $HOME/.bash_prompt
# source useful functions
sourceit $HOME/.functions
# export LANG=en_US.UTF-8

# to use "magic" history (letters+urrow up find last commands in history
# starting with those letters). requires .inputrc
shopt -s histappend
PROMPT_COMMAND='history -a'
HISTSIZE=1500
HISTCONTROL="erasedups:ignorespace"
INPUTRC="~/.inputrc"
