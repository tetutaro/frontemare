" vi:syntax=vim
"" frontemare scheme by tetutaro

"" setup theme
hi clear
if exists('syntac_on')
    syntax reset
endif
syntax reset
let g:colors_name = "frontemare"

"" GUI color definitions
let s:cg00 = "#000000"
let s:cg01 = "#996375"
let s:cg02 = "#639999"
let s:cg03 = "#997563"
let s:cg04 = "#637599"
let s:cg05 = "#756399"
let s:cg06 = "#638799"
let s:cg07 = "#637599"
let s:cg08 = "#8da6d9"
let s:cg09 = "#d98da6"
let s:cg0A = "#8dd9d9"
let s:cg0B = "#d9a68d"
let s:cg0C = "#8da6d9"
let s:cg0D = "#a68dd9"
let s:cg0E = "#8dc0d9"
let s:cg0F = "#d3d5d9"

"" TERMINAL color definitions
let s:ct00 = "00"
let s:ct03 = "08"
let s:ct05 = "07"
let s:ct07 = "15"
let s:ct08 = "01"
let s:ct0A = "03"
let s:ct0B = "02"
let s:ct0C = "06"
let s:ct0D = "04"
let s:ct0E = "05"
if &t_Co == 256
    let s:ct01 = "18"
    let s:ct02 = "19"
    let s:ct04 = "20"
    let s:ct06 = "21"
    let s:ct09 = "16"
    let s:ct0F = "17"
else
    let s:ct01 = "10"
    let s:ct02 = "11"
    let s:ct04 = "12"
    let s:ct06 = "13"
    let s:ct09 = "09"
    let s:ct0F = "14"
endif

" Neovim terminal colours
if has("nvim")
    let g:terminal_color_0 =  "#000000"
    let g:terminal_color_1 =  "#996375"
    let g:terminal_color_2 =  "#639999"
    let g:terminal_color_3 =  "#997563"
    let g:terminal_color_4 =  "#637599"
    let g:terminal_color_5 =  "#756399"
    let g:terminal_color_6 =  "#638799"
    let g:terminal_color_7 =  "#637599"
    let g:terminal_color_8 =  "#8da6d9"
    let g:terminal_color_9 =  "#d98da6"
    let g:terminal_color_10 = "#8dd9d9"
    let g:terminal_color_11 = "#d9a68d"
    let g:terminal_color_12 = "#8da6d9"
    let g:terminal_color_13 = "#a68dd9"
    let g:terminal_color_14 = "#8dc0d9"
    let g:terminal_color_15 = "#d3d5d9"
    let g:terminal_color_background = g:terminal_color_0
    let g:terminal_color_foreground = g:terminal_color_15
elseif has('terminal')
    let g:terminal_ansi_colors = [
        \ "#000000",
        \ "#996375",
        \ "#639999",
        \ "#997563",
        \ "#637599",
        \ "#756399",
        \ "#638799",
        \ "#637599",
        \ "#8da6d9",
        \ "#d98da6",
        \ "#8dd9d9",
        \ "#d9a68d",
        \ "#8da6d9",
        \ "#a68dd9",
        \ "#8dc0d9",
        \ "#d3d5d9",
    \ ]
endif

"" highlighting function
function! s:fHi(grp, gfg, gbg, tfg, tbg, attr)
    let cmd = ""
    if a:gfg != ""
        let cmd = cmd . " guifg=" . a:gfg
    endif
    if a:gbg != ""
        let cmd = cmd . " guibg=" . a:gbg
    endif
    if a:tfg != ""
        let cmd = cmd . " ctermfg=" . a:tfg
    endif
    if a:gbg != ""
        let cmd = cmd . " ctermbg=" . a:tbg
    endif
    if a:attr != ""
        let cmd = cmd . " gui=" . a:attr
        let cmd = cmd . " cterm=" . a:attr
    endif
    if cmd != ""
        execute "hi " . a:grp . cmd
    endif
endfunction

"" default highlighting groups
call <SID>fHi("ColorColumn",  "",     s:cg07, "",     s:ct07, "")
call <SID>fHi("Conceal",      s:cg0C, "",     s:ct0C, "",     "")
call <SID>fHi("CusorColumn",  "",     s:cg07, "",     s:ct07, "NONE")
call <SID>fHi("CursorLine",   "",     s:cg07, "",     s:ct07, "NONE")
call <SID>fHi("Directory",    s:cg0C, "",     s:ct0C, "",     "bold")
call <SID>fHi("DiffAdd",      "",     s:cg02, "",     s:ct02, "NONE")
call <SID>fHi("DiffChange",   "",     s:cg03, "",     s:ct03, "NONE")
call <SID>fHi("DiffDelete",   "",     s:cg01, "",     s:ct01, "NONE")
call <SID>fHi("DiffText",     s:cg09, "",     s:ct09, "",     "bold")
call <SID>fHi("EndOfBuffer",  s:cg0F, s:cg00, s:ct0F, s:ct00, "")
call <SID>fHi("ErrorMsg",     s:cg0F, s:cg01, s:ct0F, s:ct01, "")
call <SID>fHi("VertSplit",    s:cg07, s:cg07, s:ct07, s:ct07, "NONE")
call <SID>fHi("Folded",       s:cg0F, s:cg04, s:ct0F, s:ct04, "")
call <SID>fHi("FoldColumn",   s:cg0F, s:cg04, s:ct0F, s:ct04, "")
call <SID>fHi("SignColumn",   s:cg0F, s:cg04, s:ct0F, s:ct04, "")
call <SID>fHi("IncSearch",    "",     s:cg06, "",     s:ct06, "NONE")
call <SID>fHi("LineNr",       s:cg0F, s:cg00, s:ct0F, s:ct00, "NONE")
call <SID>fHi("CursorLineNr", s:cg0F, s:cg07, s:ct0F, s:ct07, "NONE")
call <SID>fHi("MatchParen",   "",     s:cg06, "",     s:ct06, "NONE")
call <SID>fHi("ModeMsg",      s:cg0C, "",     s:ct0C, "",     "NONE")
call <SID>fHi("MoreMsg",      s:cg0C, "",     s:ct0C, "",     "NONE")
call <SID>fHi("NonText",      s:cg08, "",     s:ct08, "",     "NONE")
call <SID>fHi("Normal",       s:cg0F, s:cg00, s:ct0F, s:ct00, "")
call <SID>fHi("Pmenu",        s:cg0F, s:cg05, s:ct0F, s:ct05, "")
call <SID>fHi("PmenuSel",     s:cg0F, s:cg00, s:ct0F, s:ct00, "")
call <SID>fHi("PmenuSbar",    "",     s:cg05, "",     s:ct05, "")
call <SID>fHi("PmenuThumb",   "",     s:cg07, "",     s:ct07, "")
call <SID>fHi("Question",     s:cg0A, "",     s:ct0A, "",     "")
call <SID>fHi("QuickFixLine", "",     s:cg06, "",     s:ct06, "NONE")
call <SID>fHi("Search",       "",     s:cg06, "",     s:ct06, "NONE")
call <SID>fHi("SpecialKey",   s:cg0C, "",     s:ct0C, "",     "")
call <SID>fHi("SpellBad",     "",     s:cg01, "",     s:ct01, "NONE")
call <SID>fHi("SpellCap",     "",     s:cg03, "",     s:ct03, "NONE")
call <SID>fHi("SpellLocal",   "",     s:cg05, "",     s:ct05, "NONE")
call <SID>fHi("SpellRare",    "",     s:cg02, "",     s:ct02, "NONE")
call <SID>fHi("StatusLine",   s:cg0F, s:cg07, s:ct0F, s:ct07, "NONE")
call <SID>fHi("StatusLineNC", s:cg0F, s:cg00, s:ct0F, s:ct00, "NONE")
call <SID>fHi("StatusLineTerm", s:cg0F, s:cg07, s:ct0F, s:ct07, "NONE")
call <SID>fHi("StatusLineTermNC", s:cg0F, s:cg00, s:ct0F, s:ct00, "NONE")
call <SID>fHi("TabLine",      s:cg0F, s:cg00, s:ct0F, s:ct00, "NONE")
call <SID>fHi("TabLineFill",  s:cg0F, s:cg00, s:ct0F, s:ct00, "NONE")
call <SID>fHi("TabLineSel",   s:cg0F, s:cg07, s:ct0F, s:ct07, "NONE")
call <SID>fHi("Terminal",     s:cg0F, s:cg00, s:ct0F, s:ct00, "NONE")
call <SID>fHi("Title",        s:cg0C, "",     s:ct0C, "",     "")
call <SID>fHi("Visual",       "",     s:cg07, "",     s:ct07, "")
call <SID>fHi("VisualNOS",    "",     s:cg07, "",     s:ct07, "")
call <SID>fHi("WarningMsg",   "",     s:cg03, "",     s:ct03, "")
call <SID>fHi("WildMenu",     "",     s:cg06, "",     s:ct06, "")

"" highlighting groups that are common for many languages
" Comment group
call <SID>fHi("Comment",      s:cg08, "",     s:ct08, "",     "")
" Constant group
call <SID>fHi("Constant",     s:cg0E, "",     "",     "",     "")
call <SID>fHi("String",       s:cg0E, "",     "",     "",     "")
call <SID>fHi("Character",    s:cg0E, "",     "",     "",     "")
call <SID>fHi("Number",       s:cg0E, "",     "",     "",     "")
call <SID>fHi("Boolean",      s:cg0E, "",     "",     "",     "")
call <SID>fHi("Float",        s:cg0E, "",     "",     "",     "")
" Identifier group
call <SID>fHi("Identifier",   s:cg0C, "",     "",     "",     "")
call <SID>fHi("Function",     s:cg0C, "",     "",     "",     "")
" Statement group
call <SID>fHi("Statement",    s:cg0A, "",     "",     "",     "")
call <SID>fHi("Conditional",  s:cg0A, "",     "",     "",     "")
call <SID>fHi("Repeat",       s:cg0A, "",     "",     "",     "")
call <SID>fHi("Label",        s:cg0A, "",     "",     "",     "")
call <SID>fHi("Operator",     s:cg0A, "",     "",     "",     "")
call <SID>fHi("Keyword",      s:cg0A, "",     "",     "",     "")
call <SID>fHi("Exception",    s:cg0A, "",     "",     "",     "")
" Preprocessor group
call <SID>fHi("PreProc",      s:cg0C, "",     "",     "",     "")
call <SID>fHi("Include",      s:cg0C, "",     "",     "",     "")
call <SID>fHi("Define",       s:cg0C, "",     "",     "",     "")
call <SID>fHi("Macro",        s:cg0C, "",     "",     "",     "")
call <SID>fHi("PreCondit",    s:cg0C, "",     "",     "",     "")
" Type group
call <SID>fHi("Type",         "",     "",     "",     "",     "")
call <SID>fHi("StorageClass", "",     "",     "",     "",     "")
call <SID>fHi("Structure",    "",     "",     "",     "",     "")
call <SID>fHi("Typedef",      "",     "",     "",     "",     "")
" Special group
call <SID>fHi("Special",      "",     "",     "",     "",     "")
call <SID>fHi("SpecialChar",  "",     "",     "",     "",     "")
call <SID>fHi("Tag",          "",     "",     "",     "",     "")
call <SID>fHi("Delimiter",    "",     "",     "",     "",     "")
call <SID>fHi("SpecialComment", "",   "",     "",     "",     "")
call <SID>fHi("Debug",        "",     "",     "",     "",     "")
" Underlined group
call <SID>fHi("Underlined",   s:cg0D, "",     "",     "",     "")
" Ignore group
call <SID>fHi("Ignore",       s:cg08, "",     "",     "",     "")
" Error group
call <SID>fHi("Error",        s:cg09, "",     "",     "",     "")
" Todo group
call <SID>fHi("Todo",         s:cg0B, "",     "",     "",     "")


"" Remove functions
delf <SID>fHi

"" Remove color variables
unlet s:cg00 s:cg01 s:cg02 s:cg03 s:cg04 s:cg05 s:cg06 s:cg07 s:cg08 s:cg09 s:cg0A s:cg0B s:cg0C s:cg0D s:cg0E s:cg0F
unlet s:ct00 s:ct01 s:ct02 s:ct03 s:ct04 s:ct05 s:ct06 s:ct07 s:ct08 s:ct09 s:ct0A s:ct0B s:ct0C s:ct0D s:ct0E s:ct0F
