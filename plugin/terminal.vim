"  _____                   _
" |_   _|__ _ _ _ __  __ _(_)_ __
"   | |/ -_) '_| '  \ \ V / | '  \
"   |_|\___|_| |_|_|_(_)_/|_|_|_|_|
"

    function s:term_open()
      if exists("g:terminal_buffer") && bufloaded(g:terminal_buffer)
        execute 'buffer' g:terminal_buffer
      else
        terminal ++curwin
        let g:terminal_buffer=winbufnr(0)
      endif
    endfunction

    function s:term_hsplit()
      20 split
      call s:term_open()
    endfunction

    function s:term_vsplit()
      vsplit
      call s:term_open()
    endfunction

" <Space>` open terminal in a split buffer.
" <Space>~ use vertial split instead of horizontal.
" <C-\><C-d> immediatelly stop terminal process and destroy buffer.

    function s:init_keymap()
      nnoremap <silent> <Leader>` :call <sid>term_hsplit()<cr>
      nnoremap <silent> <Leader>~ :call <sid>term_vsplit()<cr>
      tnoremap <silent> <C-\><C-d> <C-w><C-c><C-\><C-n>:bdelete!<cr>
    endfunction

    call add(g:radrc_keymap, { -> s:init_keymap() })
