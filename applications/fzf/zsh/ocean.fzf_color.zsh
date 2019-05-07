# ocean
# Author: Chris Kempson (http://chriskempson.com)

_gen_fzf_default_opts() {

local color00='#2b303b'
local color01='#bf616a'
local color02='#a3be8c'
local color03='#ebcb8b'
local color04='#8fa1b3'
local color05='#b48ead'
local color06='#96b5b4'
local color07='#c0c5ce'
local color08='#65737e'
local color09='#bf616a'
local color0A='#a3be8c'
local color0B='#ebcb8b'
local color0C='#8fa1b3'
local color0D='#b48ead'
local color0E='#96b5b4'
local color0F='#eff1f5'

export FZF_DEFAULT_OPTS="
  --color=fg:$color0F,bg:$color00,hl:$color0E
  --color=fg+:$color0F,bg+:$color07,gutter:$color07,hl+:$color0E
  --color=prompt:$color0C,pointer:$color0C,marker:$color0C
  --color=spinner:$color09,header:$color0A
"

}

_gen_fzf_default_opts
