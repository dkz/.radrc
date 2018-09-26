set nocompatible
filetype off

let $BASH_ENV="~/.vim/.bashenv"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on

set autoindent
set smartindent
set relativenumber
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set incsearch
set hlsearch
set ignorecase
set smartcase
set lazyredraw
set nobackup
set noswapfile
set nowb
set showmatch
set magic
set cmdheight=2
set laststatus=2
set foldcolumn=1
set nowrap

set statusline=\ %F%m%r%h\ %w\ (%r%{getcwd()}%h)\%=%l:%c\ \ 

let g:airline#extensions#tabline#enabled=1
let g:airline_theme='badwolf'
let g:airline_section_c='%<%f%m (%{getcwd()})'

set omnifunc=syntaxcomplete#Complete

map <space> /
map <c-space> ?
