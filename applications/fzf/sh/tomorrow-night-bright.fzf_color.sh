# tomorrow-night-bright
# Author: Chris Kempson (http://chriskempson.com)

_gen_fzf_default_opts() {

local color00='#000000'
local color01='#d54e53'
local color02='#b9ca4a'
local color03='#e78c45'
local color04='#7aa6da'
local color05='#c397d8'
local color06='#70c0b1'
local color07='#424242'
local color08='#969896'
local color09='#d54e53'
local color0A='#b9ca4a'
local color0B='#e78c45'
local color0C='#7aa6da'
local color0D='#c397d8'
local color0E='#70c0b1'
local color0F='#eaeaea'

export FZF_DEFAULT_OPTS="
  --color=fg:$color0F,bg:$color00,hl:$color0C
  --color=fg+:$color0F,bg+:$color06,gutter:$color00,hl+:$color0C
  --color=prompt:$color0C,pointer:$color0A,marker:$color0A
  --color=spinner:$color09,info:$color0B
"

}

_gen_fzf_default_opts
