# twilight
# Author: David Hart (https://github.com/hartbit)

_gen_fzf_default_opts() {

local color00='#1e1e1e'
local color01='#cf6a4c'
local color02='#8f9d6a'
local color03='#f9ee98'
local color04='#7587a6'
local color05='#9b859d'
local color06='#afc4db'
local color07='#a7a7a7'
local color08='#5f5a60'
local color09='#cf6a4c'
local color0A='#8f9d6a'
local color0B='#f9ee98'
local color0C='#7587a6'
local color0D='#9b859d'
local color0E='#afc4db'
local color0F='#ffffff'

export FZF_DEFAULT_OPTS="
  --color=fg:$color0F,bg:$color00,hl:$color0E
  --color=fg+:$color0F,bg+:$color07,gutter:$color07,hl+:$color0E
  --color=prompt:$color0C,pointer:$color0C,marker:$color0C
  --color=spinner:$color09,header:$color0A
"

}

_gen_fzf_default_opts
