vnoremap <Right> l
vnoremap <Left>  h
vnoremap <Up>    k
vnoremap <Down>  j

nnoremap Y y$

if exists("##ModeChanged")
  autocmd ModeChanged *:i behave mswin
  autocmd ModeChanged i:* behave xterm
else
  behave xterm
endif

" Some config from $VIMRUNTIME/mswin.vim
if has("clipboard")
  " CTRL-X is Cut
  vnoremap <C-X> "+x
  " CTRL-C is Copy
  vnoremap <C-C> "+y
  " CTRL-V is Paste
  inoremap <C-V> "+gP
  if 1
    exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
  endif
endif
" For CTRL-V to work on non Unix system autoselect must be off.
if !has("unix")
  set guioptions-=a
endif
" CTRL-Z is Undo
inoremap <C-Z> <C-O>u
" CTRL-Y is Redo
inoremap <C-Y> <C-O><C-R>
" CTRL-A is Select all
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]
" backspace in Visual mode deletes selection
vnoremap <BS> d

" Command mode readline key bindings from tpope/vim-rsi
cnoremap        <C-A> <Home>
cnoremap   <C-X><C-A> <C-A>
cnoremap        <C-B> <Left>
cnoremap <expr> <C-D> getcmdpos()>strlen(getcmdline())?"\<Lt>C-D>":"\<Lt>Del>"
cnoremap <expr> <C-F> getcmdpos()>strlen(getcmdline())?&cedit:"\<Lt>Right>"

function! s:transpose() abort
  let pos = getcmdpos()
  if getcmdtype() =~# '[?/]'
    return "\<C-T>"
  elseif pos > strlen(getcmdline())
    let pre = "\<Left>"
    let pos -= 1
  elseif pos <= 1
    let pre = "\<Right>"
    let pos += 1
  else
    let pre = ""
  endif
  return pre . "\<BS>\<Right>".matchstr(getcmdline()[0 : pos-2], '.$')
endfunction

cnoremap <expr> <C-T> <SID>transpose()

function! s:ctrl_u()
  if getcmdpos() > 1
    let @- = getcmdline()[:getcmdpos()-2]
  endif
  return "\<C-U>"
endfunction

cnoremap <expr> <C-U> <SID>ctrl_u()
cnoremap <expr> <C-Y> pumvisible() ? "\<C-Y>" : "\<C-R>-"
if has("gui_running") || has('nvim')
  cnoremap        <M-d> <S-Right><C-W>
else
  cnoremap        <F31> <S-Right><C-W>
endif
