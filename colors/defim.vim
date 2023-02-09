" Defim (DEFault IMproved) Vim color file
"
" A Configurable color scheme based on vim defaults who uses colors from your
" terminal theme.
"
" Only dark background supported for now.
"
" Options
"
" g:defim_italic: If set to 1, use italic to differientiate comments and todos
" instead if supported (Default 0)
"
" g:defim_orange: If set to 1, use orange instead of red for syntax
" highlighting when used in gui default if supported (Default 0)
"
" g:defim_better: If set to 1, sets all of the unset above to 1 (Default 0)
"
" g:defim_dimer: If set to 1, use Grey25 and Grey50 instead of DarkGray and
" LightGray for a dimer look if supported (Default 0)
"
" g:defim_grey: If set to 1, use grey for comments and line number (Default 0)
"
" g:defim_best: If set to 1, sets all of the unset above to 1 (Default 0)
"
" g:defim_git_diff: If set to 1, uses git diff highlight instead of vim's
" default (Default 1)
"
" g:defim_no_underline: If set to 1, avoid underline (Default 1)
"
" g:defim_thin_vertsplit: If set to 1, don't reverse the vertical split
" separator for a thiner look (Default 1)
"
" g:defim_no_cursorline: If set to 1, the cursorline is invisible and only the
" line number is highlighted (Default 0)

let g:defim_best           = get(g:, 'defim_best', 0)

if g:defim_best == 1                                                                                                  
    let g:defim_better     = 1
else
    let g:defim_better     = get(g:, 'defim_better', 0)
endif

let g:defim_italic         = get(g:, 'defim_italic', g:defim_better)
let g:defim_orange         = get(g:, 'defim_orange', g:defim_better)

let g:defim_dimer          = get(g:, 'defim_dimer', g:defim_best)
let g:defim_grey           = get(g:, 'defim_grey', g:defim_best)

let g:defim_git_diff       = get(g:, 'defim_git_diff', 1)
let g:defim_no_underline   = get(g:, 'defim_no_underline', 1)
let g:defim_thin_vertsplit = get(g:, 'defim_thin_vertsplit', 1)

let g:defim_no_cursorline  = get(g:, 'defim_no_cursorline', 0)

if g:defim_orange == 1
  let s:LightRed = 'DarkOrange1'
else
  let s:LightRed = 'Red'
endif

if g:defim_dimer == 1
  let s:DarkGrey = 'Grey25'
  let s:LightGrey = 'Grey50'
else
  let s:DarkGrey = 'DarkGray'
  let s:LightGrey = 'LightGray'
endif

" Declarations  {{{
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

set background=dark

if $TERM == 'linux'
    set t_Co=8
else
    set t_Co=256
endif

"" Sets the  hi ghlighting for the given group. {{{
"" From github.com/jsit/vim-tomorrow-theme
"" Originally by Chris Kempson and contributors
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
"" }}}

hi clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "defim"

if g:defim_italic == 1 && (has("gui_running") || (has("unix") && system("tput sitm") == "\033[3m") || (&t_ZH != '' && &t_ZH != '[7m')) "[27m'
    let s:italic = 1
else
    let s:italic = 0
endif

" }}}

" Improved defaults (ui) {{{
if &background == "dark" && has('gui_running')
    call <SID>set_colors("Normal"           , "White"      , "Black"      , "NONE"             ) "Default                              [Set dark background]
else
    call <SID>set_colors("Normal"           , ""           , ""           , "NONE"             ) "Default                              [OK]
endif
call     <SID>set_colors("ErrorMsg"         , "White"      , "DarkRed"    , ""                 ) "Default White / DarkRed              [OK]
call     <SID>set_colors("IncSearch"        , ""           , ""           , "reverse"          ) "Default (Reverse)                    [OK]
call     <SID>set_colors("ModeMsg"          , ""           , ""           , "bold"             ) "Default (Bold)                       [OK]
if g:defim_grey == 1
    call <SID>set_colors("NonText"          , s:DarkGrey   , ""           , ""                 ) "Default Blue                         [Less visible NonText]
else
    call <SID>set_colors("NonText"          , "Blue"       , ""           , ""                 ) "Default Blue                         [OK]
endif
call     <SID>set_colors("PMenuSbar"        , ""           , s:LightGrey  , ""                 ) "Default Grey BG                      [OK]
call     <SID>set_colors("StatusLine"       , ""           , ""           , "reverse,bold"     ) "Default (Reverse, Bold)              [OK]
call     <SID>set_colors("StatusLineNC"     , ""           , ""           , "reverse"          ) "Default (Reverse)                    [OK]
call     <SID>set_colors("TabLineFill"      , ""           , ""           , "reverse"          ) "Default (Reverse)                    [OK]
call     <SID>set_colors("TabLineSel"       , ""           , ""           , "bold"             ) "Default (Bold)                       [OK]
if g:defim_thin_vertsplit == 1
    call <SID>set_colors("VertSplit"        , ""           , ""           , "NONE"             ) "Default (Reverse)                    [Thiner line]
else
    call <SID>set_colors("VertSplit"        , ""           , ""           , "reverse"          ) "Default (Reverse)                    [OK]
endif

"" Clipboard {{{
call     <SID>set_colors("VisualNOS"        , ""           , ""           , "underline,bold"   ) "Default (Underline, Bold)            [OK]
"" }}}

"" Diff {{{
if g:defim_git_diff == 1
    call <SID>set_colors("DiffText"         , ""           , "NONE"       , "bold"             ) "Default / Red (Bold)                 [No background]
else
    call <SID>set_colors("DiffText"         , ""           , "Red"        , "bold"             ) "Default / Red (Bold)                 [OK]
endif
" }}}

"" Gui {{{
call     <SID>set_colors("Cursor"           , "NONE"       , "NONE"       , "reverse"          ) "Default Bg / Fg                      [OK, Reverse]
call     <SID>set_colors("lCursor"          , "NONE"       , "NONE"       , "reverse"          ) "Default Bg / Fg                      [OK, Reverse]
"" }}}

" }}}

" Improved defaults (ui) [dark background only] {{{
call     <SID>set_colors("Directory"        , "Cyan"       , ""           , ""                 ) "Default LightCyan                    [OK]                    
if g:defim_grey == 1
    call <SID>set_colors("CursorLineNr"     , s:LightGrey  , ""           , "NONE"             ) "Default Yellow (Underline)           [More subtle CursorLineNr]
    call <SID>set_colors("LineNr"           , s:DarkGrey   , ""           , ""                 ) "Default Yellow                       [More subtle LineNr]
else
    call <SID>set_colors("CursorLineNr"     , "Yellow"     , ""           , "underline"        ) "Default Yellow (Underline)           [OK]
    call <SID>set_colors("LineNr"           , "Yellow"     , ""           , ""                 ) "Default Yellow                       [OK]
endif
call     <SID>set_colors("MatchParen"       , ""           , "DarkCyan"   , ""                 ) "Default / DarkCyan                   [OK]
call     <SID>set_colors("MoreMsg"          , "Green"      , ""           , ""                 ) "Default LightGreen                   [OK]
call     <SID>set_colors("Pmenu"            , "Black"      , "Magenta"    , ""                 ) "Default Black / Magenta              [OK]
call     <SID>set_colors("PmenuSel"         , s:DarkGrey     , "Black"    , ""                 ) "Default DarkGrey / Black             [OK]
call     <SID>set_colors("PmenuThumb"       , ""           , "White"      , ""                 ) "Default / White                      [OK]
call     <SID>set_colors("Question"         , "Green"      , ""           , ""                 ) "Default LightGreen                   [OK]
call     <SID>set_colors("Search"           , "Yellow"     , "Black"      , "reverse"          ) "Default Yellow / Black (Reverse)     [OK]
call     <SID>set_colors("SpecialKey"       , "Blue"       , ""           , ""                 ) "Default LightBlue                    [OK]
if g:defim_no_underline == 1
    call <SID>set_colors("TabLine"          , "White"      , s:DarkGrey   , "NONE"             ) "Default White / DarkGrey (Underline) [No underline]
else
    call <SID>set_colors("TabLine"          , "White"      , s:DarkGrey   , "Underline"        ) "Default White / DarkGrey (Underline) [OK]
endif

call     <SID>set_colors("Title"            , "Magenta"    , ""           , ""                 ) "Default LightMagenta                 [OK]
call     <SID>set_colors("Visual"           , ""           , s:DarkGrey   , ""                 ) "Default DarkGrey                     [OK]
call     <SID>set_colors("WarningMsg"       , "Red"        , ""           , ""                 ) "Default LightRed                     [OK]

"" Spell {{{
call     <SID>set_colors("SpellBad"         , ""           , "Red"        , ""                 ) "Default / LightRed                   [OK]
call     <SID>set_colors("SpellCap"         , ""           , "Blue"       , ""                 ) "Default / LightBlue                  [OK]
call     <SID>set_colors("SpellLocal"       , ""           , "Magenta"    , ""                 ) "Default / LightMagenta               [OK]
call     <SID>set_colors("SpellRare"        , ""           , "Cyan"       , ""                 ) "Default / Cyan                       [OK]
"" }}}

"" Wild Menu {{{
call     <SID>set_colors("WildMenu"         , "Black"      , "Yellow"     , ""                 ) "Default Black / Yellow               [OK]
"" }}}

"" Folding {{{
if g:defim_grey == 1
    call <SID>set_colors("FoldColumn"       , s:LightGrey  , s:DarkGrey   , ""                 ) "Default Cyan / DarkGrey              [Greyscale only]
    call <SID>set_colors("Folded"           , s:LightGrey  , s:DarkGrey   , ""                 ) "Default Cyan / DarkGrey              [Greyscale only]
else
    call <SID>set_colors("FoldColumn"       , "Cyan"       , s:DarkGrey   , ""                 ) "Default Cyan / DarkGrey              [OK]
    call <SID>set_colors("Folded"           , "Cyan"       , s:DarkGrey   , ""                 ) "Default Cyan / DarkGrey              [OK]
endif
"" }}}

"" Signs {{{
call     <SID>set_colors("SignColumn"       , "Cyan"       , s:DarkGrey   , ""                 ) "Default Cyan / DarkGrey              [OK]
"" }}}

"" Diff {{{
if g:defim_git_diff == 1
    call <SID>set_colors("DiffAdd"          , "DarkGreen"  , "NONE"       , "NONE"             ) "Default / LightBlue                  [Git diff highlight]
    call <SID>set_colors("DiffDelete"       , "DarkRed"    , "NONE"       , "NONE"             ) "Default Blue / LightCyan             [Git diff highlight]
    call <SID>set_colors("DiffLine"         , "DarkCyan"   , "NONE"       , "NONE"             ) "Default NONE                         [Git diff highlight]
else
    call <SID>set_colors("DiffAdd"          , ""           , "Blue"       , ""                 ) "Default / LightBlue                  [Git diff highlight]
    call <SID>set_colors("DiffDelete"       , "DarkBlue"   , "Cyan"       , ""                 ) "Default Blue / LightCyan             [Git diff highlight]
endif
"" }}}

"" Highlight {{{
call     <SID>set_colors("ColorColumn"      , ""           , "DarkRed"    , ""                 ) "Default / DarkRed                    [OK]
call     <SID>set_colors("CursorColumn"     , ""           , s:DarkGrey   , ""                 ) "Default / DarkGrey                   [OK]
if g:defim_no_cursorline == 1
    call <SID>set_colors("CursorLine"       , ""           , ""           , "NONE"             ) "Default (Underline)                  [Only CursorLineNr is visible]
else
    call <SID>set_colors("CursorLine"       , ""           , ""           , "underline"        ) "Default (Underline)                  [OK]
endif
"" }}}

"" Conceal {{{
call     <SID>set_colors("Conceal"          , s:LightGrey  , s:DarkGrey   , ""                 ) "Default LightGrey / DarkGrey         [OK]
"" }}}

"" Terminal {{{
call     <SID>set_colors("StatusLineTerm"   , "Black"      , "Green"      , "bold"             ) "Default Black / LightGreen (Bold)    [OK]
call     <SID>set_colors("StatusLineTermNC" , "Black"      , "Green"      , ""                 ) "Default Black / LightGreen           [OK]
"" }}}

"" Menu {{{
call <SID>set_colors("ToolbarLine"          , ""           , s:LightGrey  , ""                 ) "Default / LightGrey                  [OK]
call <SID>set_colors("ToolbarButton"        , "White"      , s:DarkGrey   , "bold"             ) "Default White / DarkGrey (Bold)      [OK]
"" }}}

" }}}

" Default ui hi links {{{
hi  link CursorLineFold   FoldColumn
hi  link EndOfBuffer      NonText
hi  link CurSearch        Search
hi  link QuickFixLine     Search
hi  link CursorLineSign   SignColumn
" }}}

" Improved defaults (syntax) {{{

if s:italic
    call <SID>set_colors("Todo"             , "Black"      , "Yellow"     , "italic"           ) "Default Black / Blue on Yellow       [Italic TODO if availible]
else
    call <SID>set_colors("Todo"             , "DarkBlue"   , "Yellow"     , ""                 ) "Default Black / Blue on Yellow       [OK]
endif
call     <SID>set_colors("Error"            , "DarkRed"    , "White"      , "reverse"          ) "Default White on Red (Reverse)       [OK]
" }}}

" Improved defaults (syntax) [dark background only] {{{

if g:defim_grey == 1
    call <SID>set_colors("Comment"          , s:LightGrey  , ""           , ""                 ) "Default Cyan                         [Grey Comment]
    call <SID>set_colors("Identifier"       , "Cyan"       , ""           , "NONE"             ) "Default Cyan (Bold)                  [Turn off bold if different from Comment]
else
    call <SID>set_colors("Comment"          , "Cyan"       , ""           , ""                 ) "Default Cyan                         [OK]
    call <SID>set_colors("Identifier"       , "Cyan"       , ""           , "Bold"             ) "Default Cyan (Bold)                  [OK]
endif
if s:italic
    call <SID>set_colors("Comment"          , ""           , ""           , "italic"           ) "Default Cyan                         [Italic Comments if availible]
    call <SID>set_colors("Identifier"       , ""           , ""           , "NONE"             ) "Default Cyan (Bold)                  [OK]
endif
call     <SID>set_colors("Special"          , s:LightRed   , ""           , ""                 ) "Default LightRed / Orange            [OK]
call     <SID>set_colors("Constant"         , "Magenta"    , ""           , ""                 ) "Default Magenta                      [OK]
call     <SID>set_colors("Ignore"           , "Black"      , ""           , ""                 ) "Default Black                        [OK]
call     <SID>set_colors("PreProc"          , "Blue"       , ""           , ""                 ) "Default LightBlue                    [OK]
call     <SID>set_colors("Statement"        , "Yellow"     , ""           , ""                 ) "Default Yellow                       [OK]
call     <SID>set_colors("Type"             , "Green"      , ""           , ""                 ) "Default Green                        [OK]
call     <SID>set_colors("Underlined"       , "Blue"       , ""           , "underline"        ) "Default LightBlue (Underline)        [OK]
" }}}

" Default syntax hi links {{{
hi link  Function         Identifier
hi link  Boolean          Constant
hi link  Character        Constant
hi link  Float            Constant
hi link  Number           Constant
hi link  String           Constant
hi link  Define           PreProc
hi link  Include          PreProc
hi link  Macro            PreProc
hi link  PreCondit        PreProc
hi link  Debug            Special
hi link  Delimiter        Special
hi link  SpecialChar      Special
hi link  SpecialComment   Special
hi link  Tag              Special
hi link  Conditional      Statement
hi link  Exception        Statement
hi link  Keyword          Statement
hi link  Label            Statement
hi link  Operator         Statement
hi link  Repeat           Statement
hi link  StorageClass     Type
hi link  Structure        Type
hi link  Typedef          Type
" }}}

" Additional hi links {{{
hi! link cIf0             Comment
hi! link ExtraWhitespace  ColorColumn

if g:defim_git_diff == 1
  hi! link diffFile       DiffText
  hi! link diffIndexLine  DiffText
  hi! link diffNewFile    DiffText
  hi! link diffOldFile    DiffText
  hi! link diffSubname    DiffText
endif
" }}}

" Clean up {{{
delf     <SID>set_colors
" }}}

" ex: set foldmethod=marker:
