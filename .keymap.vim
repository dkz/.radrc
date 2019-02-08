if VundleInstalled()
  function EnableKeymap()
    let g:mapleader=" "
    nnoremap <Leader>1 :1b<CR>
    nnoremap <Leader>2 :2b<CR>
    nnoremap <Leader>3 :3b<CR>
    nnoremap <Leader>4 :4b<CR>
    nnoremap <Leader>5 :5b<CR>
    nnoremap <Leader>6 :6b<CR>
    nnoremap <Leader>7 :7b<CR>
    nnoremap <Leader>8 :8b<CR>
    nnoremap <Leader>9 :9b<CR>
    nnoremap <Leader>x :bdelete<CR>
    nnoremap <Leader>b :buffers<CR>
    nnoremap <Leader>> :bnext<CR>
    nnoremap <Leader>< :bprev<CR>
    nmap <Leader>f <Plug>(easymotion-overwin-f)
    nmap <Leader>w <Plug>(easymotion-overwin-w)
  endfunction
endif

