# iceberg
# Author: cocopon (https://cocopon.github.io/iceberg.vim/)

set -l color00 '#161821'
set -l color01 '#b56060'
set -l color02 '#909868'
set -l color03 '#b68866'
set -l color04 '#6a809e'
set -l color05 '#80769f'
set -l color06 '#6e939b'
set -l color07 '#272c42'
set -l color08 '#3d425b'
set -l color09 '#e27878'
set -l color0A '#b4be82'
set -l color0B '#e4aa80'
set -l color0C '#84a0c6'
set -l color0D '#a093c7'
set -l color0E '#89b8c2'
set -l color0F '#c6c8d1'

set -U FZF_DEFAULT_OPTS "
  --color=fg:$color0F,bg:$color00,hl:$color0C
  --color=fg+:$color0F,bg+:$color06,gutter:$color00,hl+:$color0C
  --color=prompt:$color0C,pointer:$color0A,marker:$color0A
  --color=spinner:$color09,info:$color0B
"
