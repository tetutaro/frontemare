# nord
# Author: arcticicestudio (https://www.nordtheme.com/)

set -l color00 '#2e3440'
set -l color01 '#bf616a'
set -l color02 '#a3be8c'
set -l color03 '#ebcb8b'
set -l color04 '#5e81ac'
set -l color05 '#b48ead'
set -l color06 '#88c0d0'
set -l color07 '#4c566a'
set -l color08 '#d8dee9'
set -l color09 '#bf616a'
set -l color0A '#a3be8c'
set -l color0B '#ebcb8b'
set -l color0C '#5e81ac'
set -l color0D '#b48ead'
set -l color0E '#88c0d0'
set -l color0F '#eceff4'

set -U FZF_DEFAULT_OPTS "
  --color=fg:$color0F,bg:$color00,hl:$color0C
  --color=fg+:$color0F,bg+:$color06,gutter:$color00,hl+:$color0C
  --color=prompt:$color0C,pointer:$color0A,marker:$color0A
  --color=spinner:$color09,info:$color0B
"
