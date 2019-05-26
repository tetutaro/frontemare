
colorBG="00/00/00"
colorFG="c3/ca/d9"
color00="11/14/1a"
color01="5a/42/66"
color02="42/66/4e"
color03="66/5a/42"
color04="4a/58/73"
color05="4a/4a/73"
color06="42/5a/66"
color07="32/3b/4d"
color08="21/27/33"
color09="bf/8d/d8"
color0A="74/b3/74"
color0B="cc/9c/84"
color0C="95/b0/e6"
color0D="9d/9d/f2"
color0E="7c/bf/bf"
color0F="95/9a/a6"

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
put_template 0  $colorBG
put_template 1  $color09
put_template 2  $color0A
put_template 3  $color0B
put_template 4  $color0C
put_template 5  $color0D
put_template 6  $color0E
put_template 7  $colorFG
put_template 8  $colorBG
put_template 9  $color09
put_template 10 $color0A
put_template 11 $color0B
put_template 12 $color0C
put_template 13 $color0D
put_template 14 $color0E
put_template 15 $colorFG

# 256 color space
put_template 16 $color00
put_template 17 $color01
put_template 18 $color02
put_template 19 $color03
put_template 20 $color04
put_template 21 $color05
put_template 22 $color06
put_template 23 $color07
put_template 24 $color08
put_template 25 $color0F

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  put_template_custom Pg c3cad9 # foreground
  put_template_custom Ph 000000 # background
  put_template_custom Pi c3cad9 # bold color
  put_template_custom Pj 323b4d # selection color
  put_template_custom Pk c3cad9 # selected text color
  put_template_custom Pl c3cad9 # cursor
  put_template_custom Pm 000000 # cursor text
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
unset colorBG
unset colorFG
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color0A
unset color0B
unset color0C
unset color0D
unset color0E
unset color0F
