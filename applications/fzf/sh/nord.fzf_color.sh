# nord
# Author: arcticicestudio (https://www.nordtheme.com/)

_gen_fzf_default_opts() {

local color00='#2e3440'
local color01='#bf616a'
local color02='#a3be8c'
local color03='#ebcb8b'
local color04='#5e81ac'
local color05='#b48ead'
local color06='#88c0d0'
local color07='#4c566a'
local color08='#d8dee9'
local color09='#bf616a'
local color0A='#a3be8c'
local color0B='#ebcb8b'
local color0C='#5e81ac'
local color0D='#b48ead'
local color0E='#88c0d0'
local color0F='#eceff4'

export FZF_DEFAULT_OPTS="
  --color=fg:$color0F,bg:$color00,hl:$color0C
  --color=fg+:$color0F,bg+:$color06,gutter:$color00,hl+:$color0C
  --color=prompt:$color0C,pointer:$color0A,marker:$color0A
  --color=spinner:$color09,info:$color0B
"

}

_gen_fzf_default_opts
