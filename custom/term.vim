tnoremap <Esc> <C-\><C-n>

autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif

if has('nvim')
  autocmd TermOpen * if &buftype == 'terminal' | :startinsert | endif

  autocmd TermOpen,WinEnter * if &buftype=='terminal'
    \|setlocal winhighlight=StatusLine:StatusLineTerm,StatusLineNC:StatusLineTermNC
    \|else|setlocal winhighlight=|endif
endif
