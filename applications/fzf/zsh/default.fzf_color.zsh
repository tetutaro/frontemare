# default
# Author: Chris Kempson (http://chriskempson.com)

_gen_fzf_default_opts() {

local color00='#151515'
local color01='#8a3435'
local color02='#738747'
local color03='#c3995e'
local color04='#557f91'
local color05='#885e7f'
local color06='#5e9188'
local color07='#d0d0d0'
local color08='#505050'
local color09='#ac4142'
local color0A='#90a959'
local color0B='#f4bf75'
local color0C='#6a9fb5'
local color0D='#aa759f'
local color0E='#75b5aa'
local color0F='#f5f5f5'

export FZF_DEFAULT_OPTS="
  --color=fg:$color0F,bg:$color00,hl:$color0E
  --color=fg+:$color0F,bg+:$color07,gutter:$color07,hl+:$color0E
  --color=prompt:$color0C,pointer:$color0C,marker:$color0C
  --color=spinner:$color09,header:$color0A
"

}

_gen_fzf_default_opts
