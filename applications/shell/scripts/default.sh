#!/bin/sh
# Default Dark scheme by Chris Kempson (http://chriskempson.com)

colorBG="15/15/15"
colorFG="d0/d0/d0"
color00="15/15/15"
color01="8a/34/35"
color02="73/87/47"
color03="c3/99/5e"
color04="55/7f/91"
color05="88/5e/7f"
color06="5e/91/88"
color07="d0/d0/d0"
color08="50/50/50"
color09="ac/41/42"
color10="90/a9/59"
color11="f4/bf/75"
color12="6a/9f/b5"
color13="aa/75/9f"
color14="75/b5/aa"
color15="f5/f5/f5"

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
  put_template_custom Pg d0d0d0 # foreground
  put_template_custom Ph 151515 # background
  put_template_custom Pi d0d0d0 # bold color
  put_template_custom Pj d0d0d0 # selection color
  put_template_custom Pk d0d0d0 # selected text color
  put_template_custom Pl d0d0d0 # cursor
  put_template_custom Pm 151515 # cursor text
else
  put_template_var 10 $colorFG # foreground
  put_template_var 11 $colorBG # background
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
