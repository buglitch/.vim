tnoremap <Esc> <C-\><C-n>

autocmd BufEnter,TermOpen * if &buftype == 'terminal' | :startinsert | endif
