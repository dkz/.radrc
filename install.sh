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

  git clone https://github.com/dkz/.radrc "$HOME/.vim"
  if test "$?" -eq 0
  then
    git -C "$HOME/.vim" submodule init
    git -C "$HOME/.vim" submodule update
  else
    exit 1
  fi

  echo
  echo

  if ask "Enable custom keymap?"
  then
    add_rc "call EnableKeymap()"
  fi

  if ask "Install vim-airline?"
  then
    add_plugin "vim-airline/vim-airline"
    add_plugin "vim-airline/vim-airline-themes"
    add_rc "let g:airline_section_c='%<%f%m (%{getcwd()})'"
    add_rc "let g:airline_symbols_ascii = 1"
    add_rc "let g:airline_theme='badwolf'"
  fi

  if ask "Install vim-colorschemes?"
  then
    add_plugin "flazz/vim-colorschemes"
    add_plugin "rafi/awesome-vim-colorschemes"
  fi

  if ask "Install and enable vim-one color scheme?"
  then
    add_plugin "rakr/vim-one"
    add_rc "let g:one_allow_italics=1"
    add_rc "let g:airline_theme='one'"
    add_rc "if !empty(glob('~/.vim/bundle/vim-one'))"
    add_rc "  colorscheme one"
    add_rc "endif"
  fi

  if ask "Install git integration plugins: gitgutter and fugitive?"
  then
    add_plugin "tpope/vim-fugitive"
    add_plugin "airblade/vim-gitgutter"
  fi

  if ask "Install fuzzy finder integration plugin (fzf)?"
  then
    add_plugin "junegunn/fzf"
    add_plugin "junegunn/fzf.vim"
  fi

  if ask "Install linter and syntax checker integration plugin (ALE)?"
  then
    add_plugin "dense-analysis/ale"
  fi

  vim -c 'PluginInstall' "$HOME/.vim/vimrc"
  # Cleanup messed control sequences after calling vim
  reset
}

install
