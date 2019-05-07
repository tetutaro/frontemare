# frontemare
# Author: tetutaro

set -l color00 '#000000'
set -l color01 '#996375'
set -l color02 '#639999'
set -l color03 '#997563'
set -l color04 '#637599'
set -l color05 '#756399'
set -l color06 '#638799'
set -l color07 '#637599'
set -l color08 '#8da6d9'
set -l color09 '#d98da6'
set -l color0A '#8dd9d9'
set -l color0B '#d9a68d'
set -l color0C '#8da6d9'
set -l color0D '#a68dd9'
set -l color0E '#8dc0d9'
set -l color0F '#d3d5d9'

set -U FZF_DEFAULT_OPTS "
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"
