set listchars=eol:¬,tab:»\ ,extends:>,precedes:<,space:·,nbsp:␣

"vim-plug: <F1> :Goyo

nnoremap <silent> <M-1> :set filetype=markdown<CR>
inoremap <silent> <M-1> <C-O>:set filetype=markdown<CR>

"vim-plug: <F2> :NERDTreeTabsToggle

nnoremap <silent> <M-2> :pwd<CR>
inoremap <silent> <M-2> <C-O>:pwd<CR>

nnoremap <silent> <F3> :set invnumber<CR>
inoremap <silent> <F3> <C-O>:set invnumber<CR>

nnoremap <silent> <M-3> :set cursorline!<CR>
inoremap <silent> <M-3> <C-O>:set cursorline!<CR>

nnoremap <silent> <F4> :execute "set colorcolumn="
         \ . (&colorcolumn == "" ? "80" : "")<CR>
inoremap <silent> <F4> <C-O>:execute "set colorcolumn="
         \ . (&colorcolumn == "" ? "80" : "")<CR>

nnoremap <silent> <M-4> :set cursorcolumn!<CR>
inoremap <silent> <M-4> <C-O>:set cursorcolumn!<CR>

nnoremap <silent> <F5> :set list!<CR>
inoremap <silent> <F5> <C-O>:set list!<CR>

nnoremap <silent> <M-5> :bufdo e<CR>
inoremap <silent> <M-5> <C-O>:bufdo e<CR>

"vim-plug: <F6> :GitGutterToggle

nm <silent> <F9> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
    \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
    \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
    \ . ">"<CR>
