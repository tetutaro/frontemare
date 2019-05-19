
colorBG="2e/34/40"
colorFG="ec/ef/f4"
color00="3b/42/52"
color01="bf/61/6a"
color02="8f/bc/bb"
color03="d0/87/70"
color04="5e/81/ac"
color05="b4/8e/ad"
color06="88/c0/d0"
color07="4c/56/6a"
color08="43/4c/5e"
color09="bf/61/6a"
color0A="a3/be/8c"
color0B="eb/cb/8b"
color0C="81/a1/c1"
color0D="b4/8e/ad"
color0E="88/c0/d0"
color0F="d8/de/e9"

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
  put_template_custom Pg eceff4 # foreground
  put_template_custom Ph 2e3440 # background
  put_template_custom Pi eceff4 # bold color
  put_template_custom Pj 4c566a # selection color
  put_template_custom Pk eceff4 # selected text color
  put_template_custom Pl eceff4 # cursor
  put_template_custom Pm 2e3440 # cursor text
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
