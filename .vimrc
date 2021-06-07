if &compatible
    set nocompatible
endif

filetype plugin indent on
syntax on

set encoding=utf-8
set background=dark
set laststatus=2
set title
set mouse=a

set showmatch

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

set scrolloff=4
set sidescrolloff=8

set hlsearch

set clipboard=unnamed
set clipboard^=unnamedplus

let c_space_errors=1
let python_space_errors=1

vnoremap <Right> l
vnoremap <Left>  h
vnoremap <Up>    k
vnoremap <Down>  j

source $VIMRUNTIME/mswin.vim
source ~/.vim/custom/functions.vim
source ~/.vim/custom/lines.vim
source ~/.vim/custom/tabs.vim
source ~/.vim/custom/term.vim
