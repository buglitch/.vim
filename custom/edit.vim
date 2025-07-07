" Common mappings
nnoremap Q @q
nnoremap Y y$
vnoremap > >gv
vnoremap < <gv

" Scroll by visual lines
inoremap <Down>  <C-O>gj
inoremap <Up>    <C-O>gk
nnoremap <Down>  gj
nnoremap <Up>    gk
vnoremap <Down>  gj
vnoremap <Up>    gk

" Shift selection
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up><Right>
imap <S-Down> <Esc>lv<Down>
imap <S-Left> <Esc>v
imap <S-Right> <Esc>lv

" Set behavior
"behave xterm

" Tweaked config from $VIMRUNTIME/mswin.vim
if has("clipboard")
    " CTRL-X is Cut (visual selection)
    vnoremap <C-X> "+xi
    " CTRL-C is Copy (visual selection)
    vnoremap <C-C> "+yi
    " CTRL-V is Paste (insert mode)
    inoremap <C-V> "+gP
    if 1
      exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
    endif
endif
" For CTRL-V to work on non Unix system autoselect must be off.
if !has("unix")
  set guioptions-=a
endif
" CTRL-Z is Undo (insert mode)
inoremap <C-Z> <C-O>u
" CTRL-Y is Redo (insert mode)
inoremap <C-Y> <C-O><C-R>
" CTRL-A is Visual select all (insert mode)
inoremap <C-A> <Esc>ggvG<End>
" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]
" backspace in Visual mode deletes selection and goes to Insert mode
vnoremap <BS> di

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
