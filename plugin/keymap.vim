"  _  __                              _
" | |/ /___ _  _ _ __  __ _ _ __ __ _(_)_ __
" | ' </ -_) || | '  \/ _` | '_ \\ V / | '  \
" |_|\_\___|\_, |_|_|_\__,_| .__(_)_/|_|_|_|_|
"           |__/           |_|

" Defines certain usefull hot keys.

    function s:init_keymap()

" Using space as the leader key.

      let g:mapleader=" "

" <Space>b show list of buffers and add :b prompt to easily
" jump to a desired buffer.

      nnoremap <Leader>b :CtrlPBuffer<CR>

" <Space>l change working directory to current file's location.

      nnoremap <Leader>l :lcd %:p:h<CR>

" <Space>n navigate to current file's location in netrw

      nnoremap <Leader>n :e %:p:h<CR>

" <Space>f jump to symbol with help of easymotion plugin.

      if VundleInstalled()
        nmap <Leader>f <Plug>(easymotion-overwin-f)
      endif

" <Space>F fuzzy find a file by name in the current working directory
" <Space>B fuzzy find a buffer by name
" <Space>L fuzzy search line contents in open buffers

      if exists("g:loaded_fzf") && g:loaded_fzf
        nnoremap <Leader>F :Files .<CR>
        nnoremap <Leader>B :Buffers<CR>
        nnoremap <Leader>L :Lines<CR>
      endif

" <Space>ad show full checker/linter message in a temporary window
" <Space>ah print brief information about the symbol under cursor
" <Space>an jump to next checker/linter error or warning
" <Space>an jump to previous checker/linter error or warning
" <Space>al dump all errors and warnings into the vim quick fix list
" <Space>aq disable ALE in the current buffer

      if exists("g:loaded_ale") && g:loaded_ale
        nnoremap <Leader>ad :ALEDetail<CR>
        nnoremap <Leader>ah :ALEHover<CR>
        nnoremap <Leader>an :ALENext<CR>
        nnoremap <Leader>ap :ALEPrevious<CR>
        nnoremap <Leader>al :ALEPopulateLocList<CR>
        nnoremap <Leader>aq :ALEDisableBuffer<CR>
      endif

    endfunction

    call add(g:radrc_keymap, function("<SID>init_keymap"))
