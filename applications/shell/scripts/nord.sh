#!/bin/sh
# Nord scheme by arcticicestudio (https://www.nordtheme.com/)

color00="2e/34/40"
color01="bf/61/6a"
color02="a3/be/8c"
color03="eb/cb/8b"
color04="5e/81/ac"
color05="b4/8e/ad"
color06="88/c0/d0"
color07="4c/56/6a"
color08="d8/de/e9"
color09="bf/61/6a"
color10="a3/be/8c"
color11="eb/cb/8b"
color12="5e/81/ac"
color13="b4/8e/ad"
color14="88/c0/d0"
color15="ec/ef/f4"

if [ -n "$TMUX" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  put_template() { printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' $@; }
  put_template_var() { printf '\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\' $@; }
  put_template_custom() { printf '\033Ptmux;\033\033]%s%s\033\033\\\033\\' $@; }
elif [ "${TERM%%[-.]*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  put_template() { printf '\033P\033]4;%d;rgb:%s\007\033\\' $@; }
  put_template_var() { printf '\033P\033]%d;rgb:%s\007\033\\' $@; }
  put_template_custom() { printf '\033P\033]%s%s\007\033\\' $@; }
elif [ "${TERM%%-*}" = "linux" ]; then
  put_template() { [ $1 -lt 16 ] && printf "\e]P%x%s" $1 $(echo $2 | sed 's/\///g'); }
  put_template_var() { true; }
  put_template_custom() { true; }
else
  put_template() { printf '\033]4;%d;rgb:%s\033\\' $@; }
  put_template_var() { printf '\033]%d;rgb:%s\033\\' $@; }
  put_template_custom() { printf '\033]%s%s\033\\' $@; }
fi

# 16 color space
put_template 0  $color08
put_template 1  $color09
put_template 2  $color10
put_template 3  $color11
put_template 4  $color12
put_template 5  $color13
put_template 6  $color14
put_template 7  $color15
put_template 8  $color08
put_template 9  $color09
put_template 10 $color10
put_template 11 $color11
put_template 12 $color12
put_template 13 $color13
put_template 14 $color14
put_template 15 $color15

# 256 color space
put_template 16 $color01
put_template 17 $color02
put_template 18 $color03
put_template 19 $color04
put_template 20 $color05
put_template 21 $color06
put_template 22 $color07

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  put_template_custom Pg eceff4 # foreground
  put_template_custom Ph 2e3440 # background
  put_template_custom Pi eceff4 # bold color
  put_template_custom Pj 4c566a # selection color
  put_template_custom Pk eceff4 # selected text color
  put_template_custom Pl eceff4 # cursor
  put_template_custom Pm 2e3440 # cursor text
else
  put_template_var 10 $color15 # foreground
  put_template_var 11 $color00 # background
  if [ "${TERM%%-*}" = "rxvt" ]; then
    put_template_var 708 $color00 # internal border (rxvt)
  fi
  put_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset -f put_template
unset -f put_template_var
unset -f put_template_custom
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background
