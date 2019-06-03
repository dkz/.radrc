#!/bin/sh

[ -e "$HOME/.vimrc" ] && echo .vimrc already exists && exit 1

curl --location https://github.com/dkz/.litrc/raw/master/.vimrc > $HOME/.vimrc
