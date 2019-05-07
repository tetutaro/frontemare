# iceberg
# Author: cocopon (https://cocopon.github.io/iceberg.vim/)

_gen_fzf_default_opts() {

local color00='#161821'
local color01='#b56060'
local color02='#909868'
local color03='#b68866'
local color04='#6a809e'
local color05='#80769f'
local color06='#6e939b'
local color07='#272c42'
local color08='#3d425b'
local color09='#e27878'
local color0A='#b4be82'
local color0B='#e4aa80'
local color0C='#84a0c6'
local color0D='#a093c7'
local color0E='#89b8c2'
local color0F='#c6c8d1'

export FZF_DEFAULT_OPTS="
  --color=fg:$color0F,bg:$color00,hl:$color0C
  --color=fg+:$color0F,bg+:$color06,gutter:$color00,hl+:$color0C
  --color=prompt:$color0C,pointer:$color0A,marker:$color0A
  --color=spinner:$color09,info:$color0B
"

}

_gen_fzf_default_opts
