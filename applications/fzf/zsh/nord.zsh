# nord
# Author: arcticicestudio (https://www.nordtheme.com/)

# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
    export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# fzf + ag configuration
# ------------
export FZF_DEFAULT_COMMAND='ag --ignore "Library" --ignore "Applications" --ignore "Pictures" --ignore "Music" --ignore "Movies" --ignore "__pycache__" --nocolor -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'head -100 {}' --preview-window down:50%:hidden:wrap --bind '?:toggle-preview'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_ALT_C_COMMAND="command find -L . -mindepth 1 \\( -path '*/\\.*' -or -fstype 'sysfs' -or -fstype 'devfs' -or -fstype 'devtmpfs' -or -fstype 'proc' -or -path '*/Library' -or -path '*/Applications' -or -path '*/Pictures' -or -path '*/Music' -or -path '*/Movies' -or -path '*/__pycache__' \\) -prune -or -type d -print 2>/dev/null | cut -b3-"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -100' --preview-window down:50%:hidden:wrap --bind '?:toggle-preview'"

_gen_fzf_default_opts() {

local colorBG='#2e3440'
local colorFG='#eceff4'
local color00='#3b4252'
local color01='#bf616a'
local color02='#8fbcbb'
local color03='#d08770'
local color04='#5e81ac'
local color05='#b48ead'
local color06='#88c0d0'
local color07='#4c566a'
local color08='#434c5e'
local color09='#bf616a'
local color0A='#a3be8c'
local color0B='#ebcb8b'
local color0C='#81a1c1'
local color0D='#b48ead'
local color0E='#88c0d0'
local color0F='#d8dee9'

export FZF_DEFAULT_OPTS="\
    --color=fg:$colorFG,bg:$colorBG,hl:$color0C\
    --color=fg+:$colorFG,bg+:$color06,gutter:$color00,hl+:$color0C\
    --color=prompt:$color0C,pointer:$color0A,marker:$color0A\
    --color=spinner:$color09,info:$color0B\
    --tac --cycle --layout=reverse --select-1 --exit-0\
"

}

_gen_fzf_default_opts
