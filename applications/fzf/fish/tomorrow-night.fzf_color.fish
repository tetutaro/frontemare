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
  --color=fg:$color0F,bg:$color00,hl:$color0C
  --color=fg+:$color0F,bg+:$color06,gutter:$color00,hl+:$color0C
  --color=prompt:$color0C,pointer:$color0A,marker:$color0A
  --color=spinner:$color09,info:$color0B
"
