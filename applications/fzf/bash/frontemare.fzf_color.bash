# frontemare
# Author: tetutaro

_gen_fzf_default_opts() {

local color00='#000000'
local color01='#996375'
local color02='#639999'
local color03='#997563'
local color04='#637599'
local color05='#756399'
local color06='#638799'
local color07='#637599'
local color08='#8da6d9'
local color09='#d98da6'
local color0A='#8dd9d9'
local color0B='#d9a68d'
local color0C='#8da6d9'
local color0D='#a68dd9'
local color0E='#8dc0d9'
local color0F='#d3d5d9'

export FZF_DEFAULT_OPTS="
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"

}

_gen_fzf_default_opts
