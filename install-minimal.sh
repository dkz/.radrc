#!/bin/sh

[ -e "$HOME/.vimrc" ] && echo .vimrc already exists && exit 1

wget -O - https://github.com/dkz/.litrc/raw/master/.vimrc > $HOME/.vimrc
