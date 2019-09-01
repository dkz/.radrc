if VundleInstalled()
  function EnableKeymap()
    let g:mapleader=" "
    nnoremap <Leader>b :buffers<CR>:b<Space>
    nnoremap <Leader>! :vs<Bar>:terminal ++curwin<CR>
    nnoremap <Leader>d :%s/\s\+$//g<CR>:noh<CR>
    nmap <Leader>f <Plug>(easymotion-overwin-f)
  endfunction
endif

