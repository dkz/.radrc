#!/bin/sh

[ -e "$HOME/.vimrc" ] && echo .vimrc already exists && exit 1

curl --location https://github.com/dkz/.radrc/raw/master/.vimrc > $HOME/.vimrc
