set listchars=eol:¬,tab:»\ ,extends:>,precedes:<,space:·,nbsp:␣

nnoremap <silent> <F3> :set invnumber<CR>
inoremap <silent> <F3> <C-O>:set invnumber<CR>

nnoremap <silent> <F4> :execute "set colorcolumn="
         \ . (&colorcolumn == "" ? "80" : "")<CR>
inoremap <silent> <F4> <C-O>:execute "set colorcolumn="
         \ . (&colorcolumn == "" ? "80" : "")<CR>

nnoremap <silent> <F5> :set list!<CR>
inoremap <silent> <F5> <C-O>:set list!<CR>
