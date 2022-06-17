" __   ___       ___
" \ \ / (_)_ __ | _ \__
"  \ V /| | '  \|   / _|
"   \_/ |_|_|_|_|_|_\__|
"

" Be Improved.

    set nocompatible

" Enabling plugins through Vundle.

    filetype off
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
      Plugin 'ctrlpvim/ctrlp.vim'

      " Add local machine specific plugins to bundle.local
      if !empty(glob('~/.vim/bundle.local'))
        source ~/.vim/bundle.local
      endif

      call vundle#end()
    endif
    filetype plugin indent on

" Importing local bashenv definitions such as
" custom aliases for vim shell commands.

    if !empty(glob('~/.vim/bashenv.local'))
      let $BASH_ENV="~/.vim/bashenv.local"
    elseif !empty(glob('~/.vim/bashenv'))
      let $BASH_ENV="~/.vim/bashenv"
    endif

" Enable sensible autocompletion for commands
" intuitive window splitting and indentation.

    set wildmode=longest,list,full
    set splitright splitbelow
    set autoindent smartindent

" Automatically chdir to file being opened.

    set autochdir

" Enable relative line numbers for fast navigation.

    set relativenumber

" Set default tab width to 2 symbols, use spaces.

    set tabstop=2
    set shiftwidth=2
    set smarttab
    set expandtab

" Enable incremental search and search highlighting.
" Disable case matching for search except when uppercase
" characters are present in the pattern.
" Enable more intuitive special symbol treatment in
" pattern engine.

    set incsearch
    set hlsearch
    set ignorecase
    set smartcase
    set magic

" Briefly highlight opening parenthesis.

    set showmatch

" Do not include newline when going to the
" end of the line in visual mode.

    set selection=old

" Set command line height to 2 to preserve last message
" in the status line.

    set cmdheight=2
    set laststatus=2

" Disable backup, write backups and swap files,
" since they are unually irritate version control systems.

    set nobackup
    set noswapfile
    set nowb

" When multible buffers are open, vim can lose changes
" in abandoned buffers if this option is not enabled.

    set hidden

" Vim does not update screen when executing macro
" or performing long-running operation.

    set lazyredraw

" Minor cosmetic changes that do not affect editing:
" disable line wrapping, make fold column always visible,
" explicitly set dark background, tweak default colorscheme.

    set nowrap
    set foldcolumn=1
    set background=dark
    hi VertSplit ctermbg=LightGray ctermfg=LightGray
    hi FoldColumn ctermbg=LightGray
    hi SignColumn ctermbg=LightGray
    hi SignatureMarkText ctermbg=LightGray
    hi SignatureMarkText ctermfg=Black
    hi SignatureMarkText cterm=bold,underline
    set fillchars+=vert:\ 

" Highlight trailing whitespace characters

    hi TrailingWhitespace ctermbg=DarkGray
    autocmd ColorScheme * hi TrailingWhitespace ctermbg=DarkGray guibg=darkgray
    autocmd BufEnter * match TrailingWhitespace /\s\+$/
    autocmd WinEnter * match TrailingWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()

" Disable automatic comment insersion

    autocmd BufRead,BufNewFile * setlocal formatoptions-=cro

" If terminal with light theme is used, one can use F2 to
" switch dark color option off quickly and possibly change theme
" to a light variant (done by providing SwitchColorHook function).

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

" Use custom status line with current working directory (usefull
" for executing shell commands from vim)

    set statusline=\ %F%m%r%h\ %w\ (%r%{getcwd()}%h)\%=%y\ %3l:%2c\ \ 

" Enable omnifunc completion by pressing Ctrl-x Ctrl-o

    set omnifunc=syntaxcomplete#Complete

" Include optional keymaps from pluings directory.

    let g:radrc_keymap = []
    function s:radrc_keymap_enable()
      for Keymap in g:radrc_keymap
        call Keymap()
      endfor
    endfunction

    function EnableKeymap()
      autocmd VimEnter * call s:radrc_keymap_enable()
    endfunction

" Custom configuration can be specified in a ~/.vim/vimrc.local file
" with local machine specific tweaks that should not be shared through
" git repository.

    if !empty(glob('~/.vim/vimrc.local'))
      source ~/.vim/vimrc.local
    endif
