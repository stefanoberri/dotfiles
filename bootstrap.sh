#!/bin/bash

set -e
# defaults
force=0

# built in variables
files2sync="
  .bashrc 
  .inputrc 
  .tmux.conf 
  .tmuxStatus.sh
  .vimrc
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


## MAIN ##

parse_args "$@" 
any_exists $files2sync # set variable $exists
if [ "$exists" == "0" -o "$force" == "1" ]; then
  echo "going to make links"
else
  report_existing $files2sync
  echo "use --force to override"
fi




