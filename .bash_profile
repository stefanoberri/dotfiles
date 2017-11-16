# setting in this file are performed at login, valid for all the sessions and
# shared across different terminals

function sourceit(){ [ -r "$1" ] && [ -f "$1" ] && source "$1"; }

# if there is a more "generic" .profile file, source it
sourceit $HOME/.profile

# if it is an interactive shell, source ~/.bashrc
case "$-" in *i*) sourceit $HOME/.bashrc ;; esac

# http://www.marinamele.com/2014/05/customize-colors-of-your-terminal-in-mac-os-x.html
