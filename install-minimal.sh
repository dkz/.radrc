#!/bin/bash

ask () {
  local prompt="$1"
  local accept
  local escape
  while test -z "$escape"
  do
    printf "%s " "$prompt"
    read -r -p "[yn] " accept </dev/tty
    case $accept in
      "y")
        escape=0
        ;;
      "n")
        (exit 1)
        escape=1
        ;;
    esac
  done
  (exit $escape)
}

add_rc () {
  echo "$1" >> "$HOME/.vim/vimrc.local"
}

if test -e "$HOME/.vimrc"
then
  echo .vimrc already exists
  exit 1
fi

if test -e "$HOME/.vim"
then
  echo .vim/ already exists
  exit 1
fi

curl --location https://github.com/dkz/.radrc/raw/master/vimrc > "$HOME/.vimrc"

if ask " :: Do you want to install and enable custom keymap?"
then
  mkdir -p "$HOME/.vim/plugin"
  curl --location https://github.com/dkz/.radrc/raw/master/plugin/keymap.vim \
    > "$HOME/.vim/plugin/keymap.vim"
  curl --location https://github.com/dkz/.radrc/raw/master/plugin/terminal.vim \
    > "$HOME/.vim/plugin/terminal.vim"
  echo "call EnableKeymap()" >> "$HOME/.vim/vimrc.local"
fi

