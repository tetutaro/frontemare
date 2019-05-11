# hybrid
# Author: Andrew Wong (https://github.com/w0ng)

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

local color00='#1d1f21'
local color01='#cc6666'
local color02='#b5bd68'
local color03='#f0c674'
local color04='#81a2be'
local color05='#b294bb'
local color06='#8abeb7'
local color07='#282a2e'
local color08='#373b41'
local color09='#a54242'
local color0A='#8c9440'
local color0B='#de935f'
local color0C='#5f819d'
local color0D='#85678f'
local color0E='#5e8d87'
local color0F='#c5c8c6'

export FZF_DEFAULT_OPTS="\
    --color=fg:$color0F,bg:$color00,hl:$color0C\
    --color=fg+:$color0F,bg+:$color06,gutter:$color00,hl+:$color0C\
    --color=prompt:$color0C,pointer:$color0A,marker:$color0A\
    --color=spinner:$color09,info:$color0B\
    --tac --cycle --layout=reverse --select-1 --exit-0\
"

}

_gen_fzf_default_opts
