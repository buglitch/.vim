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

" indent
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set tabstop=4

" linebreak
set showbreak=-
set breakindent

" listchars
set listchars=eol:$,tab:>\ ,extends:+,precedes:+,space:.,nbsp:_,trail:~

" search
set showmatch
set hlsearch

" clipboard
set clipboard=unnamed
set clipboard^=unnamedplus

" space errors
let c_space_errors=1
let python_space_errors=1

" runtimepath
set runtimepath+=~/.vim

" plugins
source ~/.vim/custom/vim-plug.vim

" custom
source ~/.vim/custom/edit.vim
source ~/.vim/custom/functions.vim
source ~/.vim/custom/lines.vim
source ~/.vim/custom/tabs.vim
source ~/.vim/custom/term.vim

" colorscheme
colorscheme custom
