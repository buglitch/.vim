if &compatible
    set nocompatible
endif

set encoding=utf-8 fileencodings=

" misc
set mouse=a
set scrolloff=4
set sidescrolloff=8
set title

" indent
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set tabstop=4

" search
set showmatch
set hlsearch

" clipboard
set clipboard=unnamed
set clipboard^=unnamedplus

let c_space_errors=1
let python_space_errors=1

" plugins
source ~/.vim/custom/vim-plug.vim

" custom
source ~/.vim/custom/edit.vim
source ~/.vim/custom/functions.vim
source ~/.vim/custom/lines.vim
source ~/.vim/custom/scheme.vim
source ~/.vim/custom/tabs.vim
source ~/.vim/custom/term.vim
