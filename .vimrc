" .vimrc
if &compatible
    set nocompatible
endif

" encoding
set encoding=utf-8 fileencodings=

" misc
set cursorline
set mouse=a
set scrolloff=4
set sidescrolloff=8
set title
set undofile

" indent
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set tabstop=4

" linebreak
set breakindent
set showbreak=-

" listchars
set listchars=eol:$,tab:>\ ,extends:+,precedes:+,space:.,nbsp:_,trail:~

" search
set hlsearch
set ignorecase
set showmatch
set smartcase

" clipboard
set clipboard=unnamed
set clipboard^=unnamedplus

" runtimepath
set runtimepath+=~/.vim

" plugins
source ~/.vim/custom/vim-plug.vim

" custom
source ~/.vim/custom/edit.vim
source ~/.vim/custom/functions.vim
source ~/.vim/custom/lines.vim
source ~/.vim/custom/navigation.vim
source ~/.vim/custom/term.vim

" colorscheme
let g:defim_best = 1
let g:defim_no_cursorline = 1
colorscheme defim
