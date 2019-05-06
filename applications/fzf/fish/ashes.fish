# ashes
# Author: Jannik Siebert (https://github.com/janniks)

set -l color00 '#1c2023'
set -l color01 '#9e768a'
set -l color02 '#8a9e76'
set -l color03 '#9e8a76'
set -l color04 '#768a9e'
set -l color05 '#8a769e'
set -l color06 '#769e8a'
set -l color07 '#c7ccd1'
set -l color08 '#747c84'
set -l color09 '#c795ae'
set -l color0A '#aec795'
set -l color0B '#c7ae95'
set -l color0C '#95aec7'
set -l color0D '#ae95c7'
set -l color0E '#95c7ae'
set -l color0F '#f3f4f5'

set -U FZF_DEFAULT_OPTS "
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"
