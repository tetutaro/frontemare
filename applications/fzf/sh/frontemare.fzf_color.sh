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
  --color=fg:$color0F,bg:$color00,hl:$color0C
  --color=fg+:$color0F,bg+:$color06,gutter:$color00,hl+:$color0C
  --color=prompt:$color0C,pointer:$color0A,marker:$color0A
  --color=spinner:$color09,info:$color0B
"

}

_gen_fzf_default_opts
