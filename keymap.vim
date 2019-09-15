" _  __                              _
" | |/ /___ _  _ _ __  __ _ _ __ __ _(_)_ __
" | ' </ -_) || | '  \/ _` | '_ \\ V / | '  \
" |_|\_\___|\_, |_|_|_\__,_| .__(_)_/|_|_|_|_|
"           |__/           |_|

" Defines a keymap function to initialize few custom hot keys.

  function TerminalOpen()
    if exists("g:terminal_buffer") && bufloaded(g:terminal_buffer)
      execute 'buffer' g:terminal_buffer
    else
      terminal ++curwin
      let g:terminal_buffer=winbufnr(0)
    endif
  endfunction

  function TerminalHSplit()
    20 split
    call TerminalOpen()
  endfunction

  function TerminalVSplit()
    vsplit
    call TerminalOpen()
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

    nnoremap <Leader>` :call TerminalHSplit()<CR>
    nnoremap <Leader>~ :call TerminalVSplit()<CR>
    tnoremap <C-\><C-d> <C-w><C-c><C-\><C-n>:bdelete!<CR>

" <Space>f jump to symbol with help of easymotion plugin.

    if VundleInstalled()
      nmap <Leader>f <Plug>(easymotion-overwin-f)
    endif

  endfunction
