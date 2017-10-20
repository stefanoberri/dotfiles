# setting in this file are performed at login, valid for all the sessions and
# shared across different terminals

function sourceit(){ [ -r "$1" ] && [ -f "$1" ] && source "$1"; }

# if there is a more "generic" .profile file, source it
sourceit $HOME/.profile

# if it is an interactive shell, source ~/.bashrc
case "$-" in *i*) sourceit $HOME/.bashrc ;; esac

# User specific environment and startup programs
export PATH="$HOME/bin:$PATH";

# MacOSX has strange default colors. Change them
if [[ "$OSTYPE" == "darwin"* ]]; then
  # export LSCOLORS=exfxcxdxbxegedabagacad
  export LSCOLORS=exGxbxdxcxegedabagacad
fi
# http://www.marinamele.com/2014/05/customize-colors-of-your-terminal-in-mac-os-x.html
