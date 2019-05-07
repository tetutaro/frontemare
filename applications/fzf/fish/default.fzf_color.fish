# default
# Author: Chris Kempson (http://chriskempson.com)

set -l color00 '#151515'
set -l color01 '#8a3435'
set -l color02 '#738747'
set -l color03 '#c3995e'
set -l color04 '#557f91'
set -l color05 '#885e7f'
set -l color06 '#5e9188'
set -l color07 '#d0d0d0'
set -l color08 '#505050'
set -l color09 '#ac4142'
set -l color0A '#90a959'
set -l color0B '#f4bf75'
set -l color0C '#6a9fb5'
set -l color0D '#aa759f'
set -l color0E '#75b5aa'
set -l color0F '#f5f5f5'

set -U FZF_DEFAULT_OPTS "
  --color=fg:$color0F,bg:$color00,hl:$color0C
  --color=fg+:$color0F,bg+:$color06,gutter:$color00,hl+:$color0C
  --color=prompt:$color0C,pointer:$color0A,marker:$color0A
  --color=spinner:$color09,info:$color0B
"
