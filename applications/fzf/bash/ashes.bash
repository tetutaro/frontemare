# ashes
# Author: Jannik Siebert (https://github.com/janniks)

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

local color00='#1c2023'
local color01='#9e768a'
local color02='#8a9e76'
local color03='#9e8a76'
local color04='#768a9e'
local color05='#8a769e'
local color06='#769e8a'
local color07='#c7ccd1'
local color08='#747c84'
local color09='#c795ae'
local color0A='#aec795'
local color0B='#c7ae95'
local color0C='#95aec7'
local color0D='#ae95c7'
local color0E='#95c7ae'
local color0F='#f3f4f5'

export FZF_DEFAULT_OPTS="\
    --color=fg:$color0F,bg:$color00,hl:$color0C\
    --color=fg+:$color0F,bg+:$color06,gutter:$color00,hl+:$color0C\
    --color=prompt:$color0C,pointer:$color0A,marker:$color0A\
    --color=spinner:$color09,info:$color0B\
    --tac --cycle --layout=reverse --select-1 --exit-0\
"

}

_gen_fzf_default_opts
