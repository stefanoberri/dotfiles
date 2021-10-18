# setting in this file are performed at login, valid for all the sessions and
# shared across different terminals

function sourceit(){ [ -r "$1" ] && [ -f "$1" ] && source "$1"; }

# if there is a more "generic" .profile file, source it
sourceit $HOME/.profile

# if it is an interactive shell, source ~/.bashrc
case "$-" in *i*) sourceit $HOME/.bashrc ;; esac

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
