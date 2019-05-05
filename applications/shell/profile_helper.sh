#!/usr/bin/env bash
if [ -s $BASH ]; then
    file_name=${BASH_SOURCE[0]}
elif [ -s $ZSH_NAME ]; then
    file_name=${(%):-%x}
fi
script_dir=$(cd $(dirname $file_name) && pwd)

. $script_dir/realpath/realpath.sh

if [ -f ~/.frontemare_theme ]; then
  script_name=$(basename "$(realpath ~/.frontemare_theme)" .sh)
  echo "export FRONTEMARE_THEME=${script_name}"
  echo ". ~/.frontemare_theme"
fi
cat <<'FUNC'
_frontemare()
{
  local script=$1
  local theme=$2
  [ -f $script ] && . $script
  ln -fs $script ~/.frontemare_theme
  export FRONTEMARE_THEME=${theme}
  if [ -s $VIMRC_COLOR ]; then
    echo -e "if \0041exists('g:colors_name') || g:colors_name != '$theme'\n  colorscheme $theme\nendif" >| $VIMRC_COLOR
  fi
  if [ -n ${FRONTEMARE_SHELL_HOOKS:+s} ] && [ -d "${FRONTEMARE_SHELL_HOOKS}" ]; then
    for hook in $FRONTEMARE_SHELL_HOOKS/*; do
      [ -f "$hook" ] && [ -x "$hook" ] && "$hook"
    done
  fi
}
FUNC
for script in $script_dir/scripts/*.sh; do
  script_name=${script##*/}
  theme=${script_name%.sh}
  func_name="frontemare_${theme}"
  echo "alias $func_name=\"_frontemare \\\"$script\\\" $theme\""
done;
