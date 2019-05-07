# ocean
# Author: Chris Kempson (http://chriskempson.com)

set -l color00 '#2b303b'
set -l color01 '#bf616a'
set -l color02 '#a3be8c'
set -l color03 '#ebcb8b'
set -l color04 '#8fa1b3'
set -l color05 '#b48ead'
set -l color06 '#96b5b4'
set -l color07 '#c0c5ce'
set -l color08 '#65737e'
set -l color09 '#bf616a'
set -l color0A '#a3be8c'
set -l color0B '#ebcb8b'
set -l color0C '#8fa1b3'
set -l color0D '#b48ead'
set -l color0E '#96b5b4'
set -l color0F '#eff1f5'

set -U FZF_DEFAULT_OPTS "
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"
