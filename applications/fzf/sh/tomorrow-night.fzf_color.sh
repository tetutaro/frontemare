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
  --color=fg:$color0F,bg:$color00,hl:$color0C
  --color=fg+:$color0F,bg+:$color06,gutter:$color00,hl+:$color0C
  --color=prompt:$color0C,pointer:$color0A,marker:$color0A
  --color=spinner:$color09,info:$color0B
"

}

_gen_fzf_default_opts
