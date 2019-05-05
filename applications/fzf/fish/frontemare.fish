# frontemare
# Author: tetutaro

set -l color00 '#000000'
set -l color01 '#637599'
set -l color02 '#ffffff'
set -l color03 '#8da6d9'
set -l color04 '#ffffff'
set -l color05 '#d3d5d9'
set -l color06 '#ffffff'
set -l color07 '#ffffff'
set -l color08 '#d98da6'
set -l color09 '#ffffff'
set -l color0A '#d9a68d'
set -l color0B '#8dd9d9'
set -l color0C '#8dc0d9'
set -l color0D '#8da6d9'
set -l color0E '#a68dd9'
set -l color0F '#ffffff'

set -U FZF_DEFAULT_OPTS "
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"
