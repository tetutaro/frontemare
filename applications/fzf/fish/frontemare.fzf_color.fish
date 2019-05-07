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
  --color=fg:$color0F,bg:$color00,hl:$color0C
  --color=fg+:$color0F,bg+:$color06,gutter:$color00,hl+:$color0C
  --color=prompt:$color0C,pointer:$color0A,marker:$color0A
  --color=spinner:$color09,info:$color0B
"
