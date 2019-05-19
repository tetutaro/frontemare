
colorBG="00/00/00"
colorFG="ce/d2/da"
color00="11/14/1a"
color01="99/63/75"
color02="63/90/99"
color03="99/75/63"
color04="63/75/99"
color05="6c/63/99"
color06="63/83/99"
color07="32/3b/4d"
color08="21/27/33"
color09="d9/8d/a6"
color0A="8c/cc/d9"
color0B="d9/a6/8d"
color0C="8d/a6/d9"
color0D="9a/8d/d9"
color0E="8c/b9/d9"
color0F="91/94/9a"

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
  put_template_custom Pg ced2da # foreground
  put_template_custom Ph 000000 # background
  put_template_custom Pi ced2da # bold color
  put_template_custom Pj 323b4d # selection color
  put_template_custom Pk ced2da # selected text color
  put_template_custom Pl ced2da # cursor
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
