"vim-plug: <F1> :Goyo

nnoremap <silent> <M-!> :let &cole=(&cole == 2) ? 0 : 2
         \ <bar> echo 'conceallevel ' . &cole<CR>

inoremap <silent> <M-!> <C-O>:let &cole=(&cole == 2) ? 0 : 2
         \ <bar> echo 'conceallevel ' . &cole<CR>

"vim-plug: <F2> :NERDTreeTabsToggle

nnoremap <silent> <M-@> :pwd<CR>
inoremap <silent> <M-@> <C-O>:pwd<CR>

nnoremap <silent> <F3> :set invnumber<CR>
inoremap <silent> <F3> <C-O>:set invnumber<CR>

nnoremap <silent> <M-#> :set cursorline!<CR>
inoremap <silent> <M-#> <C-O>:set cursorline!<CR>

nnoremap <silent> <F4> :execute "set colorcolumn="
         \ . (&colorcolumn == "" ? "80" : "")<CR>
inoremap <silent> <F4> <C-O>:execute "set colorcolumn="
         \ . (&colorcolumn == "" ? "80" : "")<CR>

nnoremap <silent> <M-$> :set cursorcolumn!<CR>
inoremap <silent> <M-$> <C-O>:set cursorcolumn!<CR>

nnoremap <silent> <F5> :set list!<CR>
inoremap <silent> <F5> <C-O>:set list!<CR>

nnoremap <silent> <M-%> :bufdo e<CR>
inoremap <silent> <M-%> <C-O>:bufdo e<CR>

"vim-plug: <F6> :GitGutterToggle

"vim-plug: g:AutoPairsShortcutToggle='<F7>'

nm <silent> <F9> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
    \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
    \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
    \ . ">"<CR>
