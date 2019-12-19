"  _____              _           _      _
" |_   _|__ _ _ _ __ (_)_ _  __ _| |__ _(_)_ __
"   | |/ -_) '_| '  \| | ' \/ _` | |\ V / | '  \
"   |_|\___|_| |_|_|_|_|_||_\__,_|_(_)_/|_|_|_|_|
"

    function s:term_open()
      let terms=term_list()
      if l:terms != []
        execute 'buffer' l:terms[-1]
      else
        terminal ++curwin
      endif
    endfunction

    function s:term_paste_op(type, ...)
      let terms=term_list()
      if l:terms == []
        return
      endif

      if a:0 " Visual
        execute "y"
      elseif a:type == 'line'
        execute "normal! '[V']y"
      else
        execute "normal! `[v`]y"
      endif

      "^J as a part of input can mess certain terminal applications
      let input=substitute(@", "\n", "\r", "g")
      call term_sendkeys(l:terms[-1], l:input)
    endfunction

    function s:term_hsplit()
      20 split
      call s:term_open()
    endfunction

    function s:term_vsplit()
      vsplit
      call s:term_open()
    endfunction

" (operator) <Space>` paste into terminal, accessible in both visual/normal.
" (normal) <Space>t open terminal in a split buffer.
" (normal) <Space>T use vertial split instead of horizontal.
" (terminal) <C-\><C-d> immediatelly stop terminal process and destroy buffer.
" (terminal) <C-\><C-t> jump to previous open tab
" (terminal) <C-\><C-T> just to next open tab

    function s:init_keymap()
      nnoremap <silent> <Leader>` :set opfunc=<sid>term_paste_op<cr>g@
      vnoremap <silent> <Leader>` :call <sid>term_paste_op(visualmode(), "visual")<cr>
      nnoremap <silent> <Leader>t :call <sid>term_hsplit()<cr>
      nnoremap <silent> <Leader>T :call <sid>term_vsplit()<cr>
      tnoremap <silent> <C-\><C-d> <C-w><C-c><C-\><C-n>:bdelete!<cr>
      tnoremap <silent> <C-\><C-T> <C-w>:tabnext<cr>
      tnoremap <silent> <C-\><C-t> <C-w>:tabprevious<cr>
    endfunction

    if has("terminal")
      call add(g:radrc_keymap, function("<SID>init_keymap"))
    endif
