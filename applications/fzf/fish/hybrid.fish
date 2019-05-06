# hybrid
# Author: Andrew Wong (https://github.com/w0ng)

set -l color00 '#1d1f21'
set -l color01 '#cc6666'
set -l color02 '#b5bd68'
set -l color03 '#f0c674'
set -l color04 '#81a2be'
set -l color05 '#b294bb'
set -l color06 '#8abeb7'
set -l color07 '#282a2e'
set -l color08 '#373b41'
set -l color09 '#a54242'
set -l color0A '#8c9440'
set -l color0B '#de935f'
set -l color0C '#5f819d'
set -l color0D '#85678f'
set -l color0E '#5e8d87'
set -l color0F '#c5c8c6'

set -U FZF_DEFAULT_OPTS "
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"
