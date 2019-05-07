# hybrid
# Author: Andrew Wong (https://github.com/w0ng)

_gen_fzf_default_opts() {

local color00='#1d1f21'
local color01='#cc6666'
local color02='#b5bd68'
local color03='#f0c674'
local color04='#81a2be'
local color05='#b294bb'
local color06='#8abeb7'
local color07='#282a2e'
local color08='#373b41'
local color09='#a54242'
local color0A='#8c9440'
local color0B='#de935f'
local color0C='#5f819d'
local color0D='#85678f'
local color0E='#5e8d87'
local color0F='#c5c8c6'

export FZF_DEFAULT_OPTS="
  --color=fg:$color0F,bg:$color00,hl:$color0E
  --color=fg+:$color0F,bg+:$color07,gutter:$color07,hl+:$color0E
  --color=prompt:$color0C,pointer:$color0C,marker:$color0C
  --color=spinner:$color09,header:$color0A
"

}

_gen_fzf_default_opts
