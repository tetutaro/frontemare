# ashes
# Author: Jannik Siebert (https://github.com/janniks)

_gen_fzf_default_opts() {

local color00='#1c2023'
local color01='#9e768a'
local color02='#8a9e76'
local color03='#9e8a76'
local color04='#768a9e'
local color05='#8a769e'
local color06='#769e8a'
local color07='#c7ccd1'
local color08='#747c84'
local color09='#c795ae'
local color0A='#aec795'
local color0B='#c7ae95'
local color0C='#95aec7'
local color0D='#ae95c7'
local color0E='#95c7ae'
local color0F='#f3f4f5'

export FZF_DEFAULT_OPTS="
  --color=fg:$color0F,bg:$color00,hl:$color0C
  --color=fg+:$color0F,bg+:$color06,gutter:$color00,hl+:$color0C
  --color=prompt:$color0C,pointer:$color0A,marker:$color0A
  --color=spinner:$color09,info:$color0B
"

}

_gen_fzf_default_opts
