" Vim color file based on Disco

" We need to use :h color-nr numbers for cterm, in case we are on a low-color
" terminal
let s:color_map = {
	\'Black'         : 0,
	\'DarkRed'       : 1,
	\'DarkGreen'     : 2,
	\'DarkYellow'    : 3,
	\'DarkBlue'      : 4,
	\'DarkMagenta'   : 5,
	\'DarkCyan'      : 6,
	\'LightGray'     : 7,
	\'DarkGray'      : 8,
	\'Red'           : 9,
	\'Green'         : 10,
	\'Yellow'        : 11,
	\'Blue'          : 12,
	\'Magenta'       : 13,
	\'Cyan'          : 14,
	\'White'         : 15,
	\'DarkOrange1'   : 208,
	\'Grey25'        : 238,
	\'Grey50'        : 244,
	\'Grey75'        : 250,
	\'Grey100'       : 231,
\}

if $TERM == 'linux'
	set t_Co=8
else
	set t_Co=256
endif

" Sets the highlighting for the given group. {{{
" From github.com/jsit/vim-tomorrow-theme
" Originally by Chris Kempson and contributors
fun! <SID>set_colors(group, fg, bg, attr)

	if !empty(a:fg)
		if type(a:fg) == 1 " If a:bg is a string, look it up for cterm
			exec "hi " . a:group . " guifg=" . a:fg . " ctermfg=" . get(s:color_map, a:fg)
		else
			exec "hi " . a:group . " guifg=" . a:fg . " ctermfg=" . a:fg
		endif
	endif

	if !empty(a:bg)
		if type(a:bg) == 1 && a:bg != 'NONE' " If a:bg is a string, look it up for cterm
			exec "hi " . a:group . " guibg=" .  a:bg . " ctermbg=" . get(s:color_map, a:bg)
		else
			exec "hi " . a:group . " guibg=" . a:bg . " ctermbg=" . a:bg
		endif
	endif

	if a:attr != ""
		exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr . " term=" . a:attr
	endif

endfun
" }}}

hi clear

if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "scheme"

" Check to see if we can do colors 8-15
if has('gui_running') || (&t_Co > 8)
	let s:gt_eight = 1
else
	let s:gt_eight = 0
endif

" Check to see if we can do italic
if (&t_ZH != '' && &t_ZH != '[7m')
	let s:italic = 1
else
	let s:italic = 0
endif

" Highlight Groups (:h highlight-groups) {{{

if s:gt_eight " Needs to be different from Comment
	call <SID>set_colors("ColorColumn"  , "" , "Grey25" , "")
	call <SID>set_colors("CursorColumn" , "" , "Grey25" , "")
	call <SID>set_colors("CursorLine" , "" , "Grey25" , "NONE")
else
	call <SID>set_colors("ColorColumn"  , "NONE" , "NONE" , "")
	call <SID>set_colors("CursorColumn" , "NONE" , "NONE" , "")
	call <SID>set_colors("CursorLine"   , ""     , "Grey25"  , "")
endif

call <SID>set_colors("Conceal"  , ""     , "NONE" , "")
call <SID>set_colors("Cursor"   , "NONE" , "NONE" , "reverse")
call <SID>set_colors("CursorIM" , ""     , ""     , "")

call <SID>set_colors("CursorLineNr" , "NONE" , "Grey25"      , "")
call <SID>set_colors("Directory"    , "Blue" , ""         , "")
call <SID>set_colors("DiffAdd"      , "DarkGreen", "NONE", "")
call <SID>set_colors("DiffDelete"   , "DarkRed",   "NONE", "")
call <SID>set_colors("DiffLine"     , "DarkCyan", "NONE", "")
hi link EndOfBuffer NonText
call <SID>set_colors("ErrorMsg"     , "White"     , "DarkRed"      , "")

if s:gt_eight " Needs to be different from SignColumn
	call <SID>set_colors("VertSplit" , "Grey50" , "Grey50" , "NONE")
else
	call <SID>set_colors("VertSplit" , "White"     , "White" , "reverse")
endif

if s:gt_eight
	call <SID>set_colors("Folded"     , "Grey50" , "Grey25"    , "")
	call <SID>set_colors("FoldColumn" , "Grey50" , "Grey25"    , "")
	call <SID>set_colors("SignColumn" , "Grey50" , "Grey25"    , "")
else
	call <SID>set_colors("Folded"     , "NONE"   , "Grey50" , "")
	call <SID>set_colors("FoldColumn" , "NONE"   , "Grey50" , "")
	call <SID>set_colors("SignColumn" , "NONE"   , "Grey50" , "")
endif

call <SID>set_colors("IncSearch"  , "Yellow" , "Black" , "reverse")
call <SID>set_colors("LineNr"     , "Grey25"          , ""      , "")
call <SID>set_colors("MatchParen" , ""             , "NONE"  , "underline,bold")
call <SID>set_colors("ModeMsg"    , "Magenta"        , ""      , "")
call <SID>set_colors("MoreMsg"    , "Magenta"        , ""      , "")
call <SID>set_colors("NonText"    , "Grey25"          , ""      , "")

if &background == "dark" && has('gui_running')
	call <SID>set_colors("Normal" , "White" , "Black" , "")
else
	call <SID>set_colors("Normal" , ""      , ""      , "")
endif

call <SID>set_colors("InfoPopup", "White", "Grey25", "")

call <SID>set_colors("PMenu"        , "White"           , "Grey25"          , "")

if s:gt_eight
	call <SID>set_colors("PMenuSel" , "Grey25" , "Grey50" , "")
else
	call <SID>set_colors("PMenuSel" , "Grey25" , "White"     , "")
endif

call <SID>set_colors("PMenuSbar"        , "White"       , "Grey25"          , "")
call <SID>set_colors("PMenuThumb"       , "White"       , "Grey25"          , "")
call <SID>set_colors("Question"         , "Magenta"    , ""             , "")
call <SID>set_colors("Search"           , "Yellow", "Black", "reverse")
call <SID>set_colors("SpecialKey"       , "Grey25"      , ""             , "")
call <SID>set_colors("SpellBad"         , "DarkRed"   , "White"           , "reverse")
call <SID>set_colors("SpellCap"         , ""         , "DarkRed"          , "reverse")
call <SID>set_colors("SpellLocal"       , ""         , "DarkRed"          , "reverse")
call <SID>set_colors("SpellRare"        , "DarkRed"   , "White"           , "reverse")
call <SID>set_colors("StatusLine"       , ""         , ""             , "reverse")
call <SID>set_colors("StatusLineNC"     , "Grey25"      , ""             , "")
call <SID>set_colors("StatusLineTerm"   , "Magenta"    , "NONE"         , "reverse")
call <SID>set_colors("StatusLineTermNC" , "DarkMagenta" , "NONE"         , "reverse")
call <SID>set_colors("TabLine"          , "White"       , "Grey25"          , "NONE")
call <SID>set_colors("TabLineFill"      , "Grey25"      , "Grey50"       , "")
call <SID>set_colors("TabLineSel"       , ""         , ""             , "NONE")
call <SID>set_colors("Title"            , "Yellow"     , ""             , "")
call <SID>set_colors("Visual"           , ""         , "Grey25"          , "")
call <SID>set_colors("VisualNOS"        , "Grey25"      , ""             , "")
call <SID>set_colors("WarningMsg"       , "DarkRed"      , "NONE"             , "")
call <SID>set_colors("WildMenu"         , "Magenta"    , "Grey25"          , "")

call <SID>set_colors("Underlined" , ""     , ""       , "underline")
call <SID>set_colors("Ignore"     , "Grey25"  , ""       , "")
call <SID>set_colors("Error"      , "DarkRed"  , "White"  , "reverse")
if (s:italic)
	call <SID>set_colors("Todo"       , "Green"   , "NONE" , "reverse,italic")
else
	call <SID>set_colors("Todo"       , "Green"   , "NONE" , "reverse")
endif

" End Highlight Groups }}}

" Group Names (:h group-name) {{{

if (s:italic)
	call <SID>set_colors("Comment", "Grey50", "", "italic")
else
	call <SID>set_colors("Comment", "Grey50", "", "")
endif

call <SID>set_colors("DiffText", "White", "NONE", "bold")
hi link diffFile      DiffText
hi link diffIndexLine DiffText
hi link diffNewFile   DiffText
hi link diffOldFile   DiffText
hi link diffSubname   DiffText

call <SID>set_colors("Constant", "Magenta", "", "")
hi link String    Constant
hi link Character Constant
hi link Number    Constant
hi link Boolean   Constant
hi link Float     Constant

if s:gt_eight " Only turn off bold if we have enough colors
	call <SID>set_colors("Identifier", "Cyan", "", "NONE")
else
	call <SID>set_colors("Identifier", "Cyan", "", "")
endif
hi link Function Identifier

call <SID>set_colors("Statement", "Yellow", "", "")
hi link Conditional Statement
hi link Repeat      Statement
hi link Label       Statement
hi link Operator    Statement
hi link Keyword     Statement
hi link Exception   Statement

call <SID>set_colors("PreProc", "Blue", "", "")
hi link Include   PreProc
hi link Define    PreProc
hi link Macro     PreProc
hi link PreCondit PreProc

call <SID>set_colors("Type", "Green", "", "")
hi link StorageClass Type
hi link Structure    Type
hi link Typedef      Type

call <SID>set_colors("Special", "DarkOrange1", "", "")
hi link SpecialChar    Special
hi link Tag            Special
hi link Delimiter      Special
hi link SpecialComment Special
hi link Debug          Special

" End Group Names }}}

" Clean up
delf <SID>set_colors

" ex: set noexpandtab nolist foldmethod=marker:
