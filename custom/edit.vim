vnoremap <Right> l
vnoremap <Left>  h
vnoremap <Up>    k
vnoremap <Down>  j

source $VIMRUNTIME/mswin.vim

" auto insert mode
"autocmd VimEnter,BufEnter * if &modifiable | execute 'startinsert' | else | execute 'stopinsert' | endif
