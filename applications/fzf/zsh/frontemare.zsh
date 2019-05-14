# frontemare
# Author: tetutaro

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

local colorBG='#000000'
local colorFG='#d3d5d9'
local color00='#000000'
local color01='#996375'
local color02='#639999'
local color03='#997563'
local color04='#637599'
local color05='#756399'
local color06='#638799'
local color07='#637599'
local color08='#8da6d9'
local color09='#d98da6'
local color0A='#8dd9d9'
local color0B='#d9a68d'
local color0C='#8da6d9'
local color0D='#a68dd9'
local color0E='#8dc0d9'
local color0F='#d3d5d9'

export FZF_DEFAULT_OPTS="\
    --color=fg:$colorFG,bg:$colorBG,hl:$color0C\
    --color=fg+:$colorFG,bg+:$color06,gutter:$color00,hl+:$color0C\
    --color=prompt:$color0C,pointer:$color0A,marker:$color0A\
    --color=spinner:$color09,info:$color0B\
    --tac --cycle --layout=reverse --select-1 --exit-0\
"

}

_gen_fzf_default_opts
