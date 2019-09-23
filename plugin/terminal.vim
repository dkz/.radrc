"  _____                   _
" |_   _|__ _ _ _ __  __ _(_)_ __
"   | |/ -_) '_| '  \ \ V / | '  \
"   |_|\___|_| |_|_|_(_)_/|_|_|_|_|
"

    function s:term_open()
      let terms=term_list()
      if l:terms != []
        execute 'buffer' l:terms[0]
      else
        terminal ++curwin
      endif
    endfunction

    function s:term_paste()
      let terms=term_list()
      if l:terms != []
        call term_sendkeys(l:terms[0], @")
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

" (normal) <Space>` open terminal in a split buffer.
" (visual) <Space>` send selection to terminal buffer.
" <Space>~ use vertial split instead of horizontal.
" <C-\><C-d> immediatelly stop terminal process and destroy buffer.

    function s:init_keymap()
      nnoremap <silent> <Leader>` :call <sid>term_hsplit()<cr>
      nnoremap <silent> <Leader>~ :call <sid>term_vsplit()<cr>
      vnoremap <silent> <Leader>` y:call <sid>term_paste()<cr>
      tnoremap <silent> <C-\><C-d> <C-w><C-c><C-\><C-n>:bdelete!<cr>
    endfunction

    call add(g:radrc_keymap, { -> s:init_keymap() })
