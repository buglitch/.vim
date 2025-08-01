"https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
" Install vim-plug if not found
if empty(glob('~/.vim/plug.vim'))
  silent !curl -fLo ~/.vim/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

source ~/.vim/plug.vim

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source ~/.vimrc
\| endif

" Plugings
call plug#begin('~/.vim/bundle')
  "Plug 'vim-airline/vim-airline'
  Plug 'tpope/vim-surround'             "cs ds ys
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-commentary'           "gc
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'sheerun/vim-polyglot'
  Plug 'ryanoasis/vim-devicons'
  Plug 'preservim/nerdtree'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'mkitt/tabline.vim'
  Plug 'mjbrownie/vim-markdown-yank'
  Plug 'michaelb/vim-tips'
  Plug 'junegunn/goyo.vim'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'jiangmiao/auto-pairs'
  Plug 'godlygeek/tabular'
  Plug 'catppuccin/vim', { 'as': 'catppuccin' }
  Plug 'airblade/vim-gitgutter'
  Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

" Config
let g:airline_theme = 'catppuccin_mocha'

let g:AutoPairs = {
  \'(':')',
  \'[':']',
  \'{':'}',
  \"'":"'",
  \'"':'"',
  \"`":"`",
  \'```':'```',
  \'"""':'"""',
  \"'''":"'''",
  \"<":">"
\}

let g:AutoPairsShortcutToggle='<F7>'
let g:NERDTreeDirArrows=1
let g:NERDTreeMinimalUI=1
let g:gitgutter_enabled=0
let g:vim_tips_display_at_startup=0

autocmd FileType c   setlocal commentstring=//\ %s
autocmd FileType cpp setlocal commentstring=//\ %s

" Mapping
nmap <C-K> :pyf /usr/share/clang/clang-format.py<CR>

nnoremap <silent> <F1> :Goyo<CR>
inoremap <silent> <F1> <C-O>:Goyo<CR>

nnoremap <silent> <F2> :NERDTreeTabsToggle<CR>
inoremap <silent> <F2> <C-O>:NERDTreeTabsToggle<CR>

nnoremap <silent> <F6> :GitGutterToggle<CR>
inoremap <silent> <F6> <C-O>:GitGutterToggle<CR>

vnoremap <F8> :call MarkdownCodeYank()<CR>

let s:brown = "EBA0AC"
let s:aqua =  "89DCEB"
let s:blue = "74C7EC"
let s:darkBlue = "89B4FA"
let s:purple = "B4BEFE"
let s:lightPurple = "CBA6F7"
let s:red = "F38BA8"
let s:beige = "F5E0DC"
let s:yellow = "F9E2AF"
let s:orange = "F2CDCD"
let s:darkOrange = "FAB387"
let s:pink = "F5C2E7"
let s:green = "A6E3A1"
let s:lightGreen = "94E2D5"
let s:white = "CDD6F4"

let g:WebDevIconsDefaultFolderSymbolColor = s:darkBlue

let g:NERDTreeExtensionHighlightColor = {
  \ 'styl'     : s:green,
  \ 'sass'     : s:pink,
  \ 'scss'     : s:pink,
  \ 'htm'      : s:darkOrange,
  \ 'html'     : s:darkOrange,
  \ 'erb'      : s:red,
  \ 'slim'     : s:orange,
  \ 'ejs'      : s:yellow,
  \ 'css'      : s:blue,
  \ 'less'     : s:darkBlue,
  \ 'md'       : s:yellow,
  \ 'mdx'      : s:yellow,
  \ 'markdown' : s:yellow,
  \ 'rmd'      : s:yellow,
  \ 'json'     : s:beige,
  \ 'js'       : s:beige,
  \ 'mjs'      : s:beige,
  \ 'jsx'      : s:blue,
  \ 'rb'       : s:red,
  \ 'php'      : s:purple,
  \ 'py'       : s:yellow,
  \ 'pyc'      : s:yellow,
  \ 'pyo'      : s:yellow,
  \ 'pyd'      : s:yellow,
  \ 'coffee'   : s:brown,
  \ 'mustache' : s:orange,
  \ 'hbs'      : s:orange,
  \ 'conf'     : s:white,
  \ 'ini'      : s:white,
  \ 'yml'      : s:white,
  \ 'yaml'     : s:white,
  \ 'toml'     : s:white,
  \ 'bat'      : s:white,
  \ 'jpg'      : s:aqua,
  \ 'jpeg'     : s:aqua,
  \ 'bmp'      : s:aqua,
  \ 'png'      : s:aqua,
  \ 'webp'     : s:aqua,
  \ 'gif'      : s:aqua,
  \ 'ico'      : s:aqua,
  \ 'twig'     : s:green,
  \ 'cpp'      : s:blue,
  \ 'c++'      : s:blue,
  \ 'cxx'      : s:blue,
  \ 'cc'       : s:blue,
  \ 'cp'       : s:blue,
  \ 'c'        : s:blue,
  \ 'cs'       : s:blue,
  \ 'h'        : s:blue,
  \ 'hh'       : s:blue,
  \ 'hpp'      : s:blue,
  \ 'hxx'      : s:blue,
  \ 'hs'       : s:beige,
  \ 'lhs'      : s:beige,
  \ 'lua'      : s:purple,
  \ 'java'     : s:purple,
  \ 'sh'       : s:lightPurple,
  \ 'fish'     : s:green,
  \ 'bash'     : s:lightPurple,
  \ 'zsh'      : s:white,
  \ 'ksh'      : s:white,
  \ 'csh'      : s:white,
  \ 'awk'      : s:white,
  \ 'ps1'      : s:blue,
  \ 'ml'       : s:yellow,
  \ 'mli'      : s:yellow,
  \ 'diff'     : s:white,
  \ 'db'       : s:blue,
  \ 'sql'      : s:darkBlue,
  \ 'dump'     : s:blue,
  \ 'clj'      : s:green,
  \ 'cljc'     : s:green,
  \ 'cljs'     : s:green,
  \ 'edn'      : s:green,
  \ 'scala'    : s:red,
  \ 'go'       : s:beige,
  \ 'dart'     : s:blue,
  \ 'xul'      : s:darkOrange,
  \ 'sln'      : s:purple,
  \ 'suo'      : s:purple,
  \ 'pl'       : s:blue,
  \ 'pm'       : s:blue,
  \ 't'        : s:blue,
  \ 'rss'      : s:darkOrange,
  \ 'f#'       : s:darkBlue,
  \ 'fsscript' : s:blue,
  \ 'fsx'      : s:blue,
  \ 'fs'       : s:blue,
  \ 'fsi'      : s:blue,
  \ 'rs'       : s:darkOrange,
  \ 'rlib'     : s:darkOrange,
  \ 'd'        : s:red,
  \ 'erl'      : s:lightPurple,
  \ 'hrl'      : s:pink,
  \ 'ex'       : s:purple,
  \ 'exs'      : s:purple,
  \ 'eex'      : s:purple,
  \ 'leex'     : s:white,
  \ 'vim'      : s:green,
  \ 'ai'       : s:darkOrange,
  \ 'psd'      : s:darkBlue,
  \ 'psb'      : s:darkBlue,
  \ 'ts'       : s:blue,
  \ 'tsx'      : s:blue,
  \ 'jl'       : s:lightPurple,
  \ 'pp'       : s:white,
  \ 'vue'      : s:lightGreen,
  \ 'elm'      : s:white,
  \ 'swift'    : s:orange,
  \ 'xcplayground' : s:orange
\}