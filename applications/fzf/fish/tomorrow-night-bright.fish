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
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"
