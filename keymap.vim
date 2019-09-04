" _  __                              _
" | |/ /___ _  _ _ __  __ _ _ __ __ _(_)_ __
" | ' </ -_) || | '  \/ _` | '_ \\ V / | '  \
" |_|\_\___|\_, |_|_|_\__,_| .__(_)_/|_|_|_|_|
"           |__/           |_|

" Defines a keymap function to initialize few custom hot keys.

  function Terminal()
    20 split
    terminal ++curwin
  endfunction

  function TerminalSplit()
    vsplit
    terminal ++curwin
  endfunction

  function EnableKeymap()

" Using space as the leader key.

    let g:mapleader=" "

" <Space>b show list of buffers and add :b prompt to easily
" jump to a desired buffer.

    nnoremap <Leader>b :buffers<CR>:b<Space>

" <Space>` open terminal in a split buffer.
" <Space>~ use vertial split instead of horizontal.
" <C-\><C-d> immediatelly stop terminal process and destroy buffer.

    nnoremap <Leader>` :call Terminal()<CR>
    nnoremap <Leader>~ :call TerminalSplit()<CR>
    tnoremap <C-\><C-d> <C-w><C-c><C-\><C-n>:bdelete!<CR>

" <Space>d delete trailing spaces in current buffer.

    nnoremap <Leader>d :%s/\s\+$//g<CR>:noh<CR>

" <Space>f jump to symbol with help of easymotion plugin.

    if VundleInstalled()
      nmap <Leader>f <Plug>(easymotion-overwin-f)
    endif

  endfunction
