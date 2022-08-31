" Defim (DEFault IMproved) Vim color file 

" Declarations {{{
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

"" Sets the hi ghlighting for the given group. {{{
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

let g:colors_name = "custom"

" Check to see if we can do colors 8-15
if has('gui_running') || ((&t_Co > 8) && $TERM != 'linux') 
    let s:gt_eight = 1
else
    let s:gt_eight = 0
endif

" Check to see if we can do italic
if has("gui_running") || (has("unix") && system("tput sitm") == "\033[3m") || (&t_ZH != '' && &t_ZH != '[7m') "[27m'
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
call     <SID>set_colors("NonText"          , "Grey25"     , ""           , ""                 ) "Default Blue                         [Less visible NonText]
call     <SID>set_colors("PMenuSbar"        , ""           , "Grey50"     , ""                 ) "Default Grey BG                      [OK]
call     <SID>set_colors("StatusLine"       , ""           , ""           , "reverse,bold"     ) "Default (Reverse, Bold)              [OK]
call     <SID>set_colors("StatusLineNC"     , ""           , ""           , "reverse"          ) "Default (Reverse)                    [OK]
call     <SID>set_colors("TabLineFill"      , ""           , ""           , "reverse"          ) "Default (Reverse)                    [OK]
call     <SID>set_colors("TabLineSel"       , ""           , ""           , "bold"             ) "Default (Bold)                       [OK]
call     <SID>set_colors("VertSplit"        , ""           , ""           , "NONE"             ) "Default (Reverse)                    [Thiner line]

"" Clipboard {{{
call     <SID>set_colors("VisualNOS"        , ""           , ""           , "underline,bold"   ) "Default (Underline, Bold)            [OK]
"" }}}

"" Diff {{{
call     <SID>set_colors("DiffText"         , ""           , "NONE"       , "bold"             ) "Default / Red (Bold)                 [No background]
" }}}

"" Gui {{{
call     <SID>set_colors("Cursor"           , "NONE"       , "NONE"       , "reverse"          ) "Default Bg / Fg                      [OK, Reverse]
call     <SID>set_colors("lCursor"          , "NONE"       , "NONE"       , "reverse"          ) "Default Bg / Fg                      [OK, Reverse]
"" }}}

" }}}

" Improved defaults (ui) [dark background only] {{{
call     <SID>set_colors("CursorLineNr"     , "Grey50"     , ""           , "NONE"             ) "Default Yellow (Underline)           [Use color instead]
call     <SID>set_colors("Directory"        , "Cyan"       , ""           , ""                 ) "Default LightCyan                    [OK]
call     <SID>set_colors("LineNr"           , "Grey25"     , ""           , ""                 ) "Default Yellow                       [Less visible LineNr]
call     <SID>set_colors("MatchParen"       , ""           , "NONE"       , "underline,bold"   ) "Default / DarkCyan                   [Use underline and bold instead]
call     <SID>set_colors("MoreMsg"          , "Green"      , ""           , ""                 ) "Default LightGreen                   [OK]
call     <SID>set_colors("Pmenu"            , "Black"      , "Magenta"    , ""                 ) "Default Black / Magenta              [OK]
call     <SID>set_colors("PmenuSel"         , "Grey25"     , "Black"      , ""                 ) "Default DarkGrey / Black             [OK]
call     <SID>set_colors("PmenuThumb"       , ""           , "White"      , ""                 ) "Default / White                      [OK]
call     <SID>set_colors("Question"         , "Green"      , ""           , ""                 ) "Default LightGreen                   [OK]
call     <SID>set_colors("Search"           , "Yellow"     , "Black"      , "reverse"          ) "Default Yellow / Black (Reverse)     [OK]
call     <SID>set_colors("SpecialKey"       , "Blue"       , ""           , ""                 ) "Default LightBlue                    [OK]
call     <SID>set_colors("TabLine"          , "White"      , "Grey25"     , "NONE"             ) "Default White / DarkGrey (Underline) [No underline]
call     <SID>set_colors("Title"            , "Magenta"    , ""           , ""                 ) "Default LightMagenta                 [OK]
call     <SID>set_colors("Visual"           , ""           , "Grey25"     , ""                 ) "Default DarkGrey                     [OK]
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
if s:gt_eight
    call <SID>set_colors("FoldColumn"       , "Grey50"     , "Grey25"     , ""                 ) "Default Cyan / DarkGrey              [Greyscale only]
    call <SID>set_colors("Folded"           , "Grey50"     , "Grey25"     , ""                 ) "Default Cyan / DarkGrey              [Greyscale only]
else
    " Background needs to be different from foreground
    call <SID>set_colors("FoldColumn"       , "Cyan"       , "Grey25"     , ""                 ) "Default Cyan / DarkGrey              [OK]
    call <SID>set_colors("Folded"           , "Cyan"       , "Grey25"     , ""                 ) "Default Cyan / DarkGrey              [OK]
endif
"" }}}

"" Signs {{{
call     <SID>set_colors("SignColumn"       , "Grey50"     , "Black"      , ""                 ) "Default Cyan / DarkGrey              [More subtle SignColumn]
"" }}}

"" Diff {{{
call     <SID>set_colors("DiffAdd"          , "DarkGreen"  , "NONE"       , "NONE"             ) "Default / LightBlue                  [Git diff highlight]
call     <SID>set_colors("DiffDelete"       , "DarkRed"    , "NONE"       , "NONE"             ) "Default Blue / LightCyan             [Git diff highlight]
call     <SID>set_colors("DiffLine"         , "DarkCyan"   , "NONE"       , "NONE"             ) "Default NONE                         [Git diff highlight]
"" }}}

"" Highlight {{{
call     <SID>set_colors("ColorColumn"      , ""           , "DarkRed"    , ""                 ) "Default / DarkRed                    [OK]
call     <SID>set_colors("CursorColumn"     , ""           , "Grey25"     , ""                 ) "Default / DarkGrey                   [OK]
call     <SID>set_colors("CursorLine"       , ""           , ""           , "NONE"             ) "Default (Underline)                  [Only CursorLineNr is visible]
"" }}}

"" Conceal {{{
call     <SID>set_colors("Conceal"          , "Grey50"     , "Grey25"     , ""                 ) "Default LightGrey / DarkGrey         [OK]
"" }}}

"" Terminal {{{
call     <SID>set_colors("StatusLineTerm"   , "Black"      , "Green"      , "bold"             ) "Default Black / LightGreen (Bold)    [OK]
call     <SID>set_colors("StatusLineTermNC" , "Black"      , "Green"      , ""                 ) "Default Black / LightGreen           [OK]
"" }}}

"" Menu {{{
call <SID>set_colors("ToolbarLine"          , ""           , "Grey50"     , ""                 ) "Default / LightGrey                  [OK]
call <SID>set_colors("ToolbarButton"        , "White"      , "Grey25"     , "bold"             ) "Default White / DarkGrey (Bold)      [OK]
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
    call <SID>set_colors("Todo"             , "Yellow"     , "Black"      , "reverse,italic"   ) "Default Black / Blue on Yellow       [Italic TODO if availible]
else
    call <SID>set_colors("Todo"             , "Yellow"     , "DarkBlue"   , "reverse"          ) "Default Black / Blue on Yellow       [Use blue text if no italic]
endif
call     <SID>set_colors("Error"            , "DarkRed"    , "White"      , "reverse"          ) "Default White on Red (Reverse)       [OK]
" }}}

" Improved defaults (syntax) [dark background only] {{{
if s:gt_eight
    call <SID>set_colors("Comment"          , "Grey50"     , ""           , ""                 ) "Default Cyan                         [Grey Comment if enough colors]
    call <SID>set_colors("Identifier"       , "Cyan"       , ""           , "NONE"             ) "Default Cyan (Bold)                  [Turn off bold if different from Comment]
    call <SID>set_colors("Special"          , "DarkOrange1", ""           , ""                 ) "Default LightRed / Orange            [Orange if enough colors]
else
    call <SID>set_colors("Comment"          , "Cyan"       , ""           , ""                 ) "Default Cyan                         [OK]
    call <SID>set_colors("Identifier"       , "Cyan"       , ""           , "Bold"             ) "Default Cyan (Bold)                  [OK]
    call <SID>set_colors("Special"          , "Red"        , ""           , ""                 ) "Default LightRed / Orange            [OK]
endif
if s:italic
    call <SID>set_colors("Comment"          , ""           , ""           , "italic"           ) "Default Cyan                         [Italic Comments if availible]
endif
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
hi! link diffFile         DiffText
hi! link diffIndexLine    DiffText
hi! link diffNewFile      DiffText
hi! link diffOldFile      DiffText
hi! link diffSubname      DiffText
" }}}

" Clean up {{{
delf     <SID>set_colors
" }}}

" ex: set foldmethod=marker:
