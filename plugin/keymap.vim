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

" <Space>f jump to symbol with help of easymotion plugin.

      if VundleInstalled()
        nmap <Leader>f <Plug>(easymotion-overwin-f)
      endif

    endfunction

    call add(g:radrc_keymap, function("<SID>init_keymap"))
