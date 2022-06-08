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
  Plug 'tpope/vim-sensible/'
  Plug 'tpope/vim-commentary'
  Plug 'sheerun/vim-polyglot'
  Plug 'preservim/nerdtree'
  Plug 'junegunn/goyo.vim'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'airblade/vim-gitgutter'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'Buglitch/disco.vim'
call plug#end()

" Config
let g:NERDTreeDirArrows=1
let g:NERDTreeMinimalUI=1
let g:gitgutter_enabled=0

highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

" Mapping
nnoremap <silent> <F1> :Goyo<CR>
inoremap <silent> <F1> <C-O>:Goyo<CR>

nnoremap <silent> <F2> :NERDTreeTabsToggle<CR>
inoremap <silent> <F2> <C-O>:NERDTreeTabsToggle<CR>

nnoremap <silent> <F6> :GitGutterToggle<CR>
inoremap <silent> <F6> <C-O>:GitGutterToggle<CR>

set t_Co=256

let g:disco_color_map = {
	\'red': 'Orange',
	\'green': 'Magenta',
	\'yellow': 'Green',
	\'blue': 'Blue',
	\'magenta': 'Yellow',
	\'cyan': 'Cyan',
	\
	\'dimred': 'Brown',
	\'dimgreen': 'DarkMagenta',
	\'dimyellow': 'DarkGreen',
	\'dimblue': 'DarkBlue',
	\'dimmagenta': 'DarkYellow',
	\'dimcyan': 'DarkCyan',
	\
	\'bg': 'Black',
	\'fg': 'White',
	\'truered': 'DarkRed',
	\'dim': 'Grey20',
	\'dimtwo': 'Grey40',
	\'brightyellow': 'Yellow',
\}

if $TERM != 'linux'
	colorscheme disco
endif
