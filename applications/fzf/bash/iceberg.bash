# iceberg
# Author: cocopon (https://cocopon.github.io/iceberg.vim/)

# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
    export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.bash"

# fzf + ag configuration
# ------------
export FZF_DEFAULT_COMMAND='ag --ignore "Library" --ignore "Applications" --ignore "Pictures" --ignore "Music" --ignore "Movies" --ignore "__pycache__" --nocolor -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'head -100 {}' --preview-window down:50% --bind '?:toggle-preview'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:50% --bind '?:toggle-preview'"
export FZF_ALT_C_COMMAND="command find -L . -mindepth 1 \\( -path '*/\\.*' -or -fstype 'sysfs' -or -fstype 'devfs' -or -fstype 'devtmpfs' -or -fstype 'proc' -or -path '*/Library' -or -path '*/Applications' -or -path '*/Pictures' -or -path '*/Music' -or -path '*/Movies' -or -path '*/__pycache__' \\) -prune -or -type d -print 2>/dev/null | cut -b3-"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -100' --preview-window down:50% --bind '?:toggle-preview'"

_gen_fzf_default_opts() {

local colorBG='#161821'
local colorFG='#c6c8d1'
local color00='#161821'
local color01='#b56060'
local color02='#909868'
local color03='#b68866'
local color04='#6a809e'
local color05='#80769f'
local color06='#6e939b'
local color07='#272c42'
local color08='#3d425b'
local color09='#e27878'
local color0A='#b4be82'
local color0B='#e4aa80'
local color0C='#84a0c6'
local color0D='#a093c7'
local color0E='#89b8c2'
local color0F='#c6c8d1'

export FZF_DEFAULT_OPTS="\
    --color=fg:$colorFG,bg:$colorBG,hl:$color0C\
    --color=fg+:$colorFG,bg+:$color06,gutter:$color00,hl+:$color0C\
    --color=prompt:$color0C,pointer:$color0A,marker:$color0A\
    --color=spinner:$color09,info:$color0B\
    --tac --cycle --layout=reverse --select-1 --exit-0\
"

}

_gen_fzf_default_opts
