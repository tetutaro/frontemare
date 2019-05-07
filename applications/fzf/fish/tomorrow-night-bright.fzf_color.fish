# tomorrow-night-bright
# Author: Chris Kempson (http://chriskempson.com)

set -l color00 '#000000'
set -l color01 '#d54e53'
set -l color02 '#b9ca4a'
set -l color03 '#e78c45'
set -l color04 '#7aa6da'
set -l color05 '#c397d8'
set -l color06 '#70c0b1'
set -l color07 '#424242'
set -l color08 '#969896'
set -l color09 '#d54e53'
set -l color0A '#b9ca4a'
set -l color0B '#e78c45'
set -l color0C '#7aa6da'
set -l color0D '#c397d8'
set -l color0E '#70c0b1'
set -l color0F '#eaeaea'

set -U FZF_DEFAULT_OPTS "
  --color=fg:$color0F,bg:$color00,hl:$color0C
  --color=fg+:$color0F,bg+:$color06,gutter:$color00,hl+:$color0C
  --color=prompt:$color0C,pointer:$color0A,marker:$color0A
  --color=spinner:$color09,info:$color0B
"
