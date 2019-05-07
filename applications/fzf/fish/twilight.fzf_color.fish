# twilight
# Author: David Hart (https://github.com/hartbit)

set -l color00 '#1e1e1e'
set -l color01 '#cf6a4c'
set -l color02 '#8f9d6a'
set -l color03 '#f9ee98'
set -l color04 '#7587a6'
set -l color05 '#9b859d'
set -l color06 '#afc4db'
set -l color07 '#a7a7a7'
set -l color08 '#5f5a60'
set -l color09 '#cf6a4c'
set -l color0A '#8f9d6a'
set -l color0B '#f9ee98'
set -l color0C '#7587a6'
set -l color0D '#9b859d'
set -l color0E '#afc4db'
set -l color0F '#ffffff'

set -U FZF_DEFAULT_OPTS "
  --color=fg:$color0F,bg:$color00,hl:$color0C
  --color=fg+:$color0F,bg+:$color06,gutter:$color00,hl+:$color0C
  --color=prompt:$color0C,pointer:$color0A,marker:$color0A
  --color=spinner:$color09,info:$color0B
"
