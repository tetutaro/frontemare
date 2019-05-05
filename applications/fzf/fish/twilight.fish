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
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"
