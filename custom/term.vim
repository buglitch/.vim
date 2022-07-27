tnoremap <Esc> <C-\><C-n>

autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif

if has('nvim')
    autocmd TermOpen * if &buftype == 'terminal' | :startinsert | endif
endif
