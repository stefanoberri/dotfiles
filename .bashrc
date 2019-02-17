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
# autocompletion for git
sourceit $HOME/.git-completion.bash
# export LANG=en_US.UTF-8

# User specific environment and startup programs
export PATH="$HOME/bin:$PATH";
export EDITOR=vim
# A variable used by some git aliases
export REVIEW_BASE=develop

# MacOSX has strange default colors. Change them
# http://www.marinamele.com/2014/05/customize-colors-of-your-terminal-in-mac-os-x.html
if [[ "$OSTYPE" == "darwin"* ]]; then
  # export LSCOLORS=exfxcxdxbxegedabagacad
  export LSCOLORS=exGxbxdxcxegedabagacad
fi

# use vi mode in bash
# set -o vi

# to use "magic" history (letters+urrow up find last commands in history
# starting with those letters). requires .inputrc
shopt -s histappend
PROMPT_COMMAND='history -a'
HISTSIZE=1500
HISTCONTROL="erasedups:ignorespace"
INPUTRC="~/.inputrc"
