# tomorrow-night
# Author: Chris Kempson (http://chriskempson.com)

set -l color00 '#1d1f21'
set -l color01 '#cc6666'
set -l color02 '#b5bd68'
set -l color03 '#f0c674'
set -l color04 '#81a2be'
set -l color05 '#b294bb'
set -l color06 '#8abeb7'
set -l color07 '#c5c8c6'
set -l color08 '#969896'
set -l color09 '#cc6666'
set -l color0A '#b5bd68'
set -l color0B '#f0c674'
set -l color0C '#81a2be'
set -l color0D '#b294bb'
set -l color0E '#8abeb7'
set -l color0F '#ffffff'

set -U FZF_DEFAULT_OPTS "
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"
