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

set background=dark

if $TERM == 'linux'
    set t_Co=8
else
    set t_Co=256
endif

" Sets the hi ghlighting for the given group. {{{
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

" Set default gui colors
if &background == "dark" && has('gui_running')
    call <SID>set_colors("Normal"           , "White"      , "Black"      , ""                 )
else
    call <SID>set_colors("Normal"           , ""           , ""           , ""                 )
endif

" Improved defaults
if s:gt_eight
    call <SID>set_colors("Comment"          , "Grey50"     , ""           , ""                 ) "Default Cyan                   [Grey Comment if enough colors]
    call <SID>set_colors("Identifier"       , "Cyan"       , ""           , "NONE"             ) "Default Cyan (Bold)            [Turn off bold if different from Comment]
    call <SID>set_colors("Special"          , "DarkOrange1", ""           , ""                 ) "Default LightRed / Orange      [Orange if enough colors]
else
    call <SID>set_colors("Comment"          , "Cyan"       , ""           , ""                 ) "Default Cyan                   [OK]
    " Only turn off bold if we have enough colors
    call <SID>set_colors("Identifier"       , "Cyan"       , ""           , ""                 ) "Default Cyan (Bold)            [OK]
    call <SID>set_colors("Special"          , "Red"        , ""           , ""                 ) "Default LightRed / Orange      [OK]
endif
if s:italic
    call <SID>set_colors("Comment"          , ""           , ""           , "italic"           ) "Default Cyan                   [Italic Comments if availible]
    call <SID>set_colors("Todo"             , "Yellow"     , "Black"      , "reverse,italic"   ) "Default Black / Blue on Yellow [Italic TODO if availible]
else
    call <SID>set_colors("Todo"             , "Yellow"     , "DarkBlue"   , "reverse"          ) "Default Black / Blue on Yellow [Use blue text if no italic]
endif
call     <SID>set_colors("Constant"         , "Magenta"    , ""           , ""                 ) "Default Magenta                [Ok]
call     <SID>set_colors("Error"            , "DarkRed"    , "White"      , "reverse"          ) "Default White on Red (Reverse) [Ok]
call     <SID>set_colors("Ignore"           , "Black"      , ""           , ""                 ) "Default Black                  [Ok]
call     <SID>set_colors("PreProc"          , "Blue"       , ""           , ""                 ) "Default LightBlue              [Ok]
call     <SID>set_colors("Statement"        , "Yellow"     , ""           , ""                 ) "Default Yellow                 [Ok]
call     <SID>set_colors("Type"             , "Green"      , ""           , ""                 ) "Default Green                  [Ok]
call     <SID>set_colors("Underlined"       , "Blue"       , ""           , "underline"        ) "Default LightBlue (Underline)  [Ok]

" Default hi links
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

"Additional hi link
hi! link cIf0             Comment

"Others
if s:gt_eight
    call <SID>set_colors("ColorColumn"      , ""           , "Grey25"     , ""                 )
    call <SID>set_colors("CursorColumn"     , ""           , "Grey25"     , ""                 )
    call <SID>set_colors("CursorLine"       , ""           , ""           , "NONE"             )
    call <SID>set_colors("CursorLineNr"     , "DarkGray"   , ""           , ""                 )
    call <SID>set_colors("PMenuSel"         , "Grey25"     , "Grey50"     , ""                 )
    call <SID>set_colors("FoldColumn"       , "Grey50"     , "Grey25"     , ""                 )
    call <SID>set_colors("Folded"           , "Grey50"     , "Grey25"     , ""                 )
    call <SID>set_colors("SignColumn"       , "Grey50"     , "Grey25"     , ""                 )
    call <SID>set_colors("VertSplit"        , "Grey50"     , "Grey50"     , "NONE"             )
else
    " Needs to be different from Comment
    call <SID>set_colors("ColorColumn"      , "NONE"       , "NONE"       , ""                 )
    call <SID>set_colors("CursorColumn"     , "NONE"       , "NONE"       , ""                 )
    call <SID>set_colors("CursorLine"       , ""           , ""           , "NONE"             )
    " Needs to be different from CursorLine
    call <SID>set_colors("CursorLineNr"     , "LightGray"  , ""           , ""                 )
    " Background needs to be different from foreground
    call <SID>set_colors("FoldColumn"       , "NONE"       , "LightGray"  , ""                 )
    call <SID>set_colors("Folded"           , "NONE"       , "LightGray"  , ""                 )
    call <SID>set_colors("PMenuSel"         , "DarkGray"   , "White"      , ""                 )
    call <SID>set_colors("SignColumn"       , "NONE"       , "LightGray"  , ""                 )
    " Needs to be different from SignColumn
    call <SID>set_colors("VertSplit"        , "White"      , "White"      , "reverse"          )
endif
call     <SID>set_colors("Conceal"          , ""           , "NONE"       , ""                 )
call     <SID>set_colors("Cursor"           , "NONE"       , "NONE"       , "reverse"          )
call     <SID>set_colors("CursorIM"         , ""           , ""           , ""                 )
call     <SID>set_colors("DiffAdd"          , "DarkGreen"  , "NONE"       , ""                 )
call     <SID>set_colors("DiffDelete"       , "DarkRed"    , "NONE"       , ""                 )
call     <SID>set_colors("DiffLine"         , "DarkCyan"   , "NONE"       , ""                 )
call     <SID>set_colors("DiffText"         , "White"      , "NONE"       , "bold"             )
hi! link diffFile         DiffText
hi! link diffIndexLine    DiffText
hi! link diffNewFile      DiffText
hi! link diffOldFile      DiffText
hi! link diffSubname      DiffText
call     <SID>set_colors("Directory"        , "Blue"       , ""           , ""                 )
call     <SID>set_colors("ErrorMsg"         , "White"      , "DarkRed"    , ""                 )
call     <SID>set_colors("IncSearch"        , "Yellow"     , "Black"      , "reverse"          )
call     <SID>set_colors("InfoPopup"        , "White"      , "Grey25"     , ""                 )
call     <SID>set_colors("MatchParen"       , ""           , "NONE"       , "underline,bold"   )
call     <SID>set_colors("ModeMsg"          , "Magenta"    , ""           , ""                 )
call     <SID>set_colors("MoreMsg"          , "Magenta"    , ""           , ""                 )
call     <SID>set_colors("NonText"          , "Grey25"     , ""           , ""                 )
hi! link EndOfBuffer      NonText
hi! link LineNr           NonText
call     <SID>set_colors("PMenu"            , "White"      , "Grey25"     , ""                 )
call     <SID>set_colors("PMenuSbar"        , "White"      , "Grey25"     , ""                 )
call     <SID>set_colors("PMenuThumb"       , "White"      , "Grey25"     , ""                 )
call     <SID>set_colors("Question"         , "Magenta"    , ""           , ""                 )
call     <SID>set_colors("Search"           , "Yellow"     , "Black"      , "reverse"          )
call     <SID>set_colors("SpecialKey"       , "Blue"       , ""           , ""                 )
call     <SID>set_colors("SpellBad"         , "DarkRed"    , "White"      , "reverse"          )
call     <SID>set_colors("SpellCap"         , ""           , "DarkRed"    , "reverse"          )
call     <SID>set_colors("SpellLocal"       , ""           , "DarkRed"    , "reverse"          )
call     <SID>set_colors("SpellRare"        , "DarkRed"    , "White"      , "reverse"          )
call     <SID>set_colors("StatusLine"       , ""           , ""           , "reverse"          )
call     <SID>set_colors("StatusLineNC"     , "Grey25"     , ""           , ""                 )
call     <SID>set_colors("StatusLineTerm"   , "Magenta"    , "NONE"       , "reverse"          )
call     <SID>set_colors("StatusLineTermNC" , "DarkMagenta", "NONE"       , "reverse"          )
call     <SID>set_colors("TabLine"          , "White"      , "Grey25"     , "NONE"             )
call     <SID>set_colors("TabLineFill"      , "Grey25"     , "Grey50"     , ""                 )
call     <SID>set_colors("TabLineSel"       , ""           , ""           , "NONE"             )
call     <SID>set_colors("Title"            , "Magenta"    , ""           , "Bold"             )
call     <SID>set_colors("Visual"           , ""           , "Grey25"     , ""                 )
call     <SID>set_colors("VisualNOS"        , "Grey25"     , ""           , ""                 )
call     <SID>set_colors("WarningMsg"       , "DarkRed"    , "NONE"       , ""                 )
call     <SID>set_colors("WildMenu"         , "Magenta"    , "Grey25"     , ""                 )
call     <SID>set_colors("logBrackets"      , "DarkCyan"   , ""           , ""                 )

" Clean up
delf     <SID>set_colors

" ex: set foldmethod=marker:
