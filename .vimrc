set nocompatible
filetype off

if !empty(glob('~/.vim/.bashenv'))
  let $BASH_ENV="~/.vim/.bashenv"
endif

function VundleInstalled()
  return !empty(glob('~/.vim/bundle/Vundle.vim'))
endfunction

if VundleInstalled()
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-repeat'
  Plugin 'tmhedberg/matchit'
  Plugin 'easymotion/vim-easymotion'
  Plugin 'kshenoy/vim-signature'

  if !empty(glob('~/.vim/.bundlerc.local'))
    source ~/.vim/.bundlerc.local
  endif

  call vundle#end()
endif
filetype plugin indent on

set autoindent
set autochdir
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
set nobackup
set noswapfile
set nowb
set showmatch
set magic
set cmdheight=2
set laststatus=2
set foldcolumn=1
set nowrap
set hidden
set background=dark
set selection=old

"set lazyredraw

function SwitchColors()
  if &background == "dark"
    set background=light
  else
    set background=dark
  endif
  if exists("*SwitchColorsHook")
    call SwitchColorsHook(&background)
  endif
endfunction

nmap <f2> :call SwitchColors()<CR>

set splitright
set splitbelow

set statusline=\ %F%m%r%h\ %w\ (%r%{getcwd()}%h)\%=%l:%c\ \ 

set omnifunc=syntaxcomplete#Complete

if !empty(glob('~/.vim/.keymap.vim'))
  source ~/.vim/.keymap.vim
endif
if !empty(glob('~/.vim/.vimrc.local'))
  source ~/.vim/.vimrc.local
endif
