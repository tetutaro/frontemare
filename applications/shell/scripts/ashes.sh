
colorBG="1c/20/23"
colorFG="c7/cc/d1"
color00="1c/20/23"
color01="9e/76/8a"
color02="8a/9e/76"
color03="9e/8a/76"
color04="76/8a/9e"
color05="8a/76/9e"
color06="76/9e/8a"
color07="c7/cc/d1"
color08="74/7c/84"
color09="c7/95/ae"
color0A="ae/c7/95"
color0B="c7/ae/95"
color0C="95/ae/c7"
color0D="ae/95/c7"
color0E="95/c7/ae"
color0F="f3/f4/f5"

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
put_template 16 $color01
put_template 17 $color02
put_template 18 $color03
put_template 19 $color04
put_template 20 $color05
put_template 21 $color06

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  put_template_custom Pg c7ccd1 # foreground
  put_template_custom Ph 1c2023 # background
  put_template_custom Pi c7ccd1 # bold color
  put_template_custom Pj 769e8a # selection color
  put_template_custom Pk c7ccd1 # selected text color
  put_template_custom Pl c7ccd1 # cursor
  put_template_custom Pm 1c2023 # cursor text
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
