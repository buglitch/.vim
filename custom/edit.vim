vnoremap <Right> l
vnoremap <Left>  h
vnoremap <Up>    k
vnoremap <Down>  j

source $VIMRUNTIME/mswin.vim

if exists("##ModeChanged")
  autocmd ModeChanged *:i behave mswin
  autocmd ModeChanged i:* behave xterm
else
  behave xterm
endif

nnoremap Y y$

unmap <C-V>
unmap <C-Y>
