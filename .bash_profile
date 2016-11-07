# .bash_profile

# setting in this file are performed at login, valid for all the sessions and
# shared across different terminals
function sourceit(){
  [ -r "$1" ] && [ -f "$1" ] && source "$1";
}

# if there is a more "generic" .profile file, source it
sourceit $HOME/.profile

# set aliases
sourceit $HOME/.aliases

# Get the aliases and functions
sourceit $HOME/.bashrc

# User specific environment and startup programs
export PATH="$HOME/bin:$PATH";