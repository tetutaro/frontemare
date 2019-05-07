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
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"

}

_gen_fzf_default_opts
