" vi:syntax=vim
"" Hybrid scheme by Andrew Wong (https://github.com/w0ng)

"" setup theme
hi clear
if exists('syntac_on')
    syntax reset
endif
syntax reset
let g:colors_name = "hybrid"

"" GUI color definitions
let s:cgBG = "#1d1f21"
let s:cgFG = "#c5c8c6"
let s:cg00 = "#282a2e"
let s:cg01 = "#cc6666"
let s:cg02 = "#b5bd68"
let s:cg03 = "#f0c674"
let s:cg04 = "#81a2be"
let s:cg05 = "#b294bb"
let s:cg06 = "#8abeb7"
let s:cg07 = "#707880"
let s:cg08 = "#373b41"
let s:cg09 = "#a54242"
let s:cg0A = "#8c9440"
let s:cg0B = "#de935f"
let s:cg0C = "#5f819d"
let s:cg0D = "#85678f"
let s:cg0E = "#5e8d87"
let s:cg0F = "#c5c8c6"

"" TERMINAL color definitions
let s:ctBG = "00"
let s:ctFG = "15"
let s:ct00 = "16"
let s:ct01 = "17"
let s:ct02 = "18"
let s:ct03 = "19"
let s:ct04 = "20"
let s:ct05 = "21"
let s:ct06 = "22"
let s:ct07 = "23"
let s:ct08 = "24"
let s:ct09 = "01"
let s:ct0A = "02"
let s:ct0B = "03"
let s:ct0C = "04"
let s:ct0D = "05"
let s:ct0E = "06"
let s:ct0F = "25"

" Neovim terminal colours
if has("nvim")
    let g:terminal_color_0 =  "#1d1f21"
    let g:terminal_color_1 =  "#a54242"
    let g:terminal_color_2 =  "#8c9440"
    let g:terminal_color_3 =  "#de935f"
    let g:terminal_color_4 =  "#5f819d"
    let g:terminal_color_5 =  "#85678f"
    let g:terminal_color_6 =  "#5e8d87"
    let g:terminal_color_7 =  "#c5c8c6"
    let g:terminal_color_8 =  "#1d1f21"
    let g:terminal_color_9 =  "#a54242"
    let g:terminal_color_10 = "#8c9440"
    let g:terminal_color_11 = "#de935f"
    let g:terminal_color_12 = "#5f819d"
    let g:terminal_color_13 = "#85678f"
    let g:terminal_color_14 = "#5e8d87"
    let g:terminal_color_15 = "#c5c8c6"
    let g:terminal_color_background = "#1d1f21"
    let g:terminal_color_foreground = "#c5c8c6"
elseif has('terminal')
    let g:terminal_ansi_colors = [
        \ "#1d1f21",
        \ "#a54242",
        \ "#8c9440",
        \ "#de935f",
        \ "#5f819d",
        \ "#85678f",
        \ "#5e8d87",
        \ "#c5c8c6",
        \ "#1d1f21",
        \ "#a54242",
        \ "#8c9440",
        \ "#de935f",
        \ "#5f819d",
        \ "#85678f",
        \ "#5e8d87",
        \ "#c5c8c6",
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
call <SID>fHi("ColorColumn",  "",     s:cg08, "",     s:ct08, "")
call <SID>fHi("Conceal",      s:cg0C, s:cgBG, s:ct0C, s:ctBG, "")
call <SID>fHi("CusorColumn",  "",     s:cg07, "",     s:ct07, "NONE")
call <SID>fHi("CursorLine",   "",     s:cg07, "",     s:ct07, "NONE")
call <SID>fHi("Directory",    s:cg0C, "",     s:ct0C, "",     "bold")
call <SID>fHi("DiffAdd",      s:cgFG, s:cg02, s:ctFG, s:ct02, "NONE")
call <SID>fHi("DiffChange",   s:cgFG, s:cg03, s:ctFG, s:ct03, "NONE")
call <SID>fHi("DiffDelete",   s:cgFG, s:cg01, s:ctFG, s:ct01, "NONE")
call <SID>fHi("DiffText",     s:cg09, s:cg06, s:ct09, s:ct06, "bold")
call <SID>fHi("EndOfBuffer",  s:cgFG, s:cgBG, s:ctFG, s:ctBG, "")
call <SID>fHi("ErrorMsg",     s:cgFG, s:cg01, s:ctFG, s:ct01, "")
call <SID>fHi("VertSplit",    s:cg08, s:cg08, s:ct08, s:ct08, "NONE")
call <SID>fHi("Folded",       s:cgFG, s:cg04, s:ctFG, s:ct04, "")
call <SID>fHi("FoldColumn",   s:cgFG, s:cg04, s:ctFG, s:ct04, "")
call <SID>fHi("SignColumn",   s:cgFG, s:cg04, s:ctFG, s:ct04, "")
call <SID>fHi("IncSearch",    s:cgFG, s:cg06, s:ctFG, s:ct06, "NONE")
call <SID>fHi("LineNr",       s:cg0F, s:cg00, s:ct0F, s:ct00, "NONE")
call <SID>fHi("CursorLineNr", s:cg0C, s:cg00, s:ct0C, s:ct00, "NONE")
call <SID>fHi("MatchParen",   "",     s:cg06, "",     s:ct06, "NONE")
call <SID>fHi("ModeMsg",      s:cg0C, "",     s:ct0C, "",     "NONE")
call <SID>fHi("MoreMsg",      s:cg0C, "",     s:ct0C, "",     "NONE")
call <SID>fHi("NonText",      s:cg0F, "",     s:ct0F, "",     "NONE")
call <SID>fHi("Normal",       s:cgFG, s:cgBG, s:ctFG, s:ctBG, "")
call <SID>fHi("Pmenu",        s:cgFG, s:cg00, s:ctFG, s:ct00, "")
call <SID>fHi("PmenuSel",     s:cgFG, s:cg07, s:ctFG, s:ct07, "")
call <SID>fHi("PmenuSbar",    "",     s:cg08, "",     s:ct08, "")
call <SID>fHi("PmenuThumb",   "",     s:cg06, "",     s:ct06, "")
call <SID>fHi("Question",     s:cg0A, "",     s:ct0A, "",     "")
call <SID>fHi("QuickFixLine", "",     s:cg06, "",     s:ct06, "NONE")
call <SID>fHi("Search",       s:cgFG, s:cg06, s:ctFG, s:ct06, "NONE")
call <SID>fHi("SpecialKey",   s:cg0C, "",     s:ct0C, "",     "")
call <SID>fHi("SpellBad",     "",     s:cg01, "",     s:ct01, "NONE")
call <SID>fHi("SpellCap",     "",     s:cg03, "",     s:ct03, "NONE")
call <SID>fHi("SpellLocal",   "",     s:cg05, "",     s:ct05, "NONE")
call <SID>fHi("SpellRare",    "",     s:cg02, "",     s:ct02, "NONE")
call <SID>fHi("StatusLine",   s:cgFG, s:cg07, s:ctFG, s:ct07, "NONE")
call <SID>fHi("StatusLineNC", s:cgFG, s:cg00, s:ctFG, s:ct00, "NONE")
call <SID>fHi("StatusLineTerm", s:cgFG, s:cg07, s:ctFG, s:ct07, "NONE")
call <SID>fHi("StatusLineTermNC", s:cgFG, s:cg00, s:ctFG, s:ct00, "NONE")
call <SID>fHi("TabLine",      s:cgFG, s:cgBG, s:ctFG, s:ctBG, "NONE")
call <SID>fHi("TabLineFill",  s:cgFG, s:cgBG, s:ctFG, s:ctBG, "NONE")
call <SID>fHi("TabLineSel",   s:cgFG, s:cg07, s:ctFG, s:ct07, "NONE")
call <SID>fHi("Terminal",     s:cgFG, s:cgBG, s:ctFG, s:ctBG, "NONE")
call <SID>fHi("Title",        s:cg0C, "",     s:ct0C, "",     "")
call <SID>fHi("Visual",       "",     s:cg07, "",     s:ct07, "")
call <SID>fHi("VisualNOS",    "",     s:cg07, "",     s:ct07, "NONE")
call <SID>fHi("WarningMsg",   s:cgFG, s:cg03, s:ctFG, s:ct03, "")
call <SID>fHi("WildMenu",     s:cgFG, s:cg06, s:ctFG, s:ct06, "")

"" highlighting groups that are common for many languages
" Comment group
call <SID>fHi("Comment",      s:cg0F, "",     s:ct0F, "",     "")
" Constant group
call <SID>fHi("Constant",     s:cg0E, "",     s:ct0E, "",     "")
call <SID>fHi("String",       s:cg0E, "",     s:ct0E, "",     "")
call <SID>fHi("Character",    s:cg0E, "",     s:ct0E, "",     "")
call <SID>fHi("Number",       s:cg0E, "",     s:ct0E, "",     "")
call <SID>fHi("Boolean",      s:cg0E, "",     s:ct0E, "",     "")
call <SID>fHi("Float",        s:cg0E, "",     s:ct0E, "",     "")
" Identifier group
call <SID>fHi("Identifier",   s:cg0C, "",     s:ct0C, "",     "NONE")
call <SID>fHi("Function",     s:cg0C, "",     s:ct0C, "",     "NONE")
" Statement group
call <SID>fHi("Statement",    s:cg0A, "",     s:ct0A, "",     "")
call <SID>fHi("Conditional",  s:cg0A, "",     s:ct0A, "",     "")
call <SID>fHi("Repeat",       s:cg0A, "",     s:ct0A, "",     "")
call <SID>fHi("Label",        s:cg0A, "",     s:ct0A, "",     "")
call <SID>fHi("Operator",     s:cg0A, "",     s:ct0A, "",     "")
call <SID>fHi("Keyword",      s:cg0A, "",     s:ct0A, "",     "")
call <SID>fHi("Exception",    s:cg0A, "",     s:ct0A, "",     "")
" Preprocessor group
call <SID>fHi("PreProc",      s:cg0C, "",     s:ct0C, "",     "")
call <SID>fHi("Include",      s:cg0C, "",     s:ct0C, "",     "")
call <SID>fHi("Define",       s:cg0C, "",     s:ct0C, "",     "")
call <SID>fHi("Macro",        s:cg0C, "",     s:ct0C, "",     "")
call <SID>fHi("PreCondit",    s:cg0C, "",     s:ct0C, "",     "")
" Type group
call <SID>fHi("Type",         s:cg0A, "",     s:ct0A, "",     "")
call <SID>fHi("StorageClass", s:cg0A, "",     s:ct0A, "",     "")
call <SID>fHi("Structure",    s:cg0A, "",     s:ct0A, "",     "")
call <SID>fHi("Typedef",      s:cg0A, "",     s:ct0A, "",     "")
" Special group
call <SID>fHi("Special",      s:cg0B, "",     s:ct0B, "",     "")
call <SID>fHi("SpecialChar",  s:cg0B, "",     s:ct0B, "",     "")
call <SID>fHi("Tag",          s:cg0B, "",     s:ct0B, "",     "")
call <SID>fHi("Delimiter",    s:cg0B, "",     s:ct0B, "",     "")
call <SID>fHi("SpecialComment", s:cg0B, "",   s:ct0B, "",     "")
call <SID>fHi("Debug",        s:cg0B,  "",    s:ct0B, "",     "")
" Underlined group
call <SID>fHi("Underlined",   s:cg0D, "",     s:ct0D, "",     "")
" Ignore group
call <SID>fHi("Ignore",       s:cg0F, "",     s:ct0F, "",     "")
" Error group
call <SID>fHi("Error",        s:cg09, s:cgBG, s:ct09, s:ctBG, "")
" Todo group
call <SID>fHi("Todo",         s:cg0B, s:cgBG, s:ct0B, s:ctBG, "")

"" Highlight groups for plugins
call <SID>fHi("IndentGuidesOdd", "",  s:cg08, "",     s:ct08, "")
call <SID>fHi("IndentGuidesEven", "", s:cg00, "",     s:ct00, "")
call <SID>fHi("GitGutterAdd", s:cg0A, s:cg00, s:ct0A, s:ct00, "")
call <SID>fHi("GitGutterChange", s:cg0B, s:cg00, s:ct0B, s:ct00, "")
call <SID>fHi("GitGutterDelete", s:cg09, s:cg00, s:ct09, s:ct00, "")
call <SID>fHi("GitGutterChangeDelete", s:cg0B, s:cg00, s:ct0B, s:ct00, "")
call <SID>fHi("ExtraWhitespace", "",  s:cg01, "",     s:ct01, "")
call <SID>fHi("lspReference", s:cgFG, s:cg04, s:ctFG, s:ct04, "")

let g:rainbow_conf = {
    \ 'guifgs': [s:cg09, s:cg0A, s:cg0B, s:cg0C, s:cg0D, s:cg0E],
    \ 'ctermfgs': [s:ct09, s:ct0A, s:ct0B, s:ct0C, s:ct0D, s:ct0E],
\ }

"" Remove functions
delf <SID>fHi

"" Remove color variables
unlet s:cg00 s:cg01 s:cg02 s:cg03 s:cg04 s:cg05 s:cg06 s:cg07 s:cg08 s:cg09 s:cg0A s:cg0B s:cg0C s:cg0D s:cg0E s:cg0F
unlet s:ct00 s:ct01 s:ct02 s:ct03 s:ct04 s:ct05 s:ct06 s:ct07 s:ct08 s:ct09 s:ct0A s:ct0B s:ct0C s:ct0D s:ct0E s:ct0F
