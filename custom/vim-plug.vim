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
