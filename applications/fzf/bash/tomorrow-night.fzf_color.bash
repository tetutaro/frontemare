# tomorrow-night
# Author: Chris Kempson (http://chriskempson.com)

_gen_fzf_default_opts() {

local color00='#1d1f21'
local color01='#cc6666'
local color02='#b5bd68'
local color03='#f0c674'
local color04='#81a2be'
local color05='#b294bb'
local color06='#8abeb7'
local color07='#c5c8c6'
local color08='#969896'
local color09='#cc6666'
local color0A='#b5bd68'
local color0B='#f0c674'
local color0C='#81a2be'
local color0D='#b294bb'
local color0E='#8abeb7'
local color0F='#ffffff'

export FZF_DEFAULT_OPTS="
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"

}

_gen_fzf_default_opts
