#!/bin/bash

set -e
# defaults
force=0


# built in variables
files2sync="
  .functions
  .name
  .bashrc
  .bash_profile
  .bash_prompt
  .aliases
  .profile
  .inputrc
  .extrarc
  .tmux.conf
  .tmuxStatus.sh
  .vimrc
  bin/tmuxStatus
  "

function usage(){
  echo "Create symlinks in your home directory to configurations files in this
  directory"
  echo ""
  echo "Usage:"
  echo ""
  echo "  $0 [Options]"
  echo ""
  echo "Options:"
  echo ""
  echo "--force, -f:  Replace existing target files with symlinks"
  echo "--help, -h:   Show this help and exit"
}

function parse_args(){
  # set -gt to the number of required arguments required
  while [[ $# -gt 0 ]]
  do
  key="$1"

  case $key in
      --force|-f)
      force=1
      # if it has a value you add:
      # value=$2
      # shift # to skip the argument next loop
      ;;
      --help|-h)
      usage
      exit 0
      ;;
      *)
      # unknown option
      echo "Unknown option: $key"
      echo "enter '$0 --help' for usage"
      exit 1
      ;;
  esac
  shift
  done
}

function any_exists(){
  exists=0
  for f in "$@"; do
    if [ -f $HOME/$f ]; then
      exists=1
    fi
  done
}

function report_existing(){
  for f in "$@"; do
    if [ -f $HOME/$f ]; then
      echo "file $HOME/$f already exists"
    fi
  done
}

function create_symlinks(){
  for f in "$@"; do
    TARGET=$HOME/$f
    SOURCE=$PWD/$f
    if [ -e $SOURCE ]; then
      if [ -e $TARGET ]; then
        rm $TARGET
      fi
      TARGETDIR=$(dirname $TARGET)
      ln -s $SOURCE $TARGET
    fi
  done
}

## MAIN ##

parse_args "$@"
if [ ! -d $HOME/bin ]; then
  mkdir $HOME/bin
fi
any_exists $files2sync # set variable $exists
if [ "$exists" == "0" -o "$force" == "1" ]; then
  create_symlinks $files2sync
else
  report_existing $files2sync
  echo "use --force to override"
fi

# Install Vundle (requires git)
VUNDLE=$HOME/.vim/bundle/Vundle.vim
# reactivate set e or the next command will stop the script if there is no git
set +e
which git > /dev/null
GIT_MISSING=$?
# go back to safety
set -e
if [ $GIT_MISSING -eq 0 ]; then
  if [ -d $VUNDLE ]; then
    echo "Vundle already available in $VUNDLE"
  else
    git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE
    vim +PluginInstall +qall
  fi
else
  echo "git not available. Skipping Vundle installation"
fi

