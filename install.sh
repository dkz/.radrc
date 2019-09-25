#!/bin/sh

ask () {
  local prompt="$@"
  local accept
  local escape
  while test -z $escape
  do
    printf "$prompt "
    read -p "[yn] " accept </dev/tty
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

add_plugin () {
  echo "Plugin '$1'" >> "$HOME/.vim/bundle.local"
}

install () {
  echo checking pre-existing .vim and .vimrc
  if test -e "$HOME/.vim"
  then
    echo .vim directory already exists
    exit 1
  fi

  if test -e "$HOME/.vimrc"
  then
    echo .vimrc already exists
    exit 1
  fi

  git clone git://github.com/dkz/.radrc $HOME/.vim
  if test $? -eq 0
  then
    git -C $HOME/.vim submodule init
    git -C $HOME/.vim submodule update
  else
    exit 1
  fi

  if ask " :: Do you want to enable custom keymap?"
  then
    add_rc "call EnableKeymap()"
  fi

  if ask " :: Do you want to install vim-airline?"
  then
    add_plugin "vim-airline/vim-airline"
    add_plugin "vim-airline/vim-airline-themes"
    add_rc "let g:airline#extensions#tabline#enabled=1"
    add_rc "let g:airline_section_c='%<%f%m (%{getcwd()})'"
    add_rc "let g:airline_theme='badwolf'"
  fi

  if ask " :: Do you want to install vim-colorschemes?"
  then
    add_plugin "flazz/vim-colorschemes"
  fi

  if ask " :: Do you want to install and set vim-one theme?"
  then
    add_plugin "rakr/vim-one"
    add_rc "let g:one_allow_italics=1"
    add_rc "let g:airline_theme='one'"
    add_rc "if !empty(glob('~/.vim/bundle/vim-one'))"
    add_rc "  colorscheme one"
    add_rc "endif"
  fi

  vim -c 'PluginInstall' "$HOME/.vim/vimrc"
}

install
