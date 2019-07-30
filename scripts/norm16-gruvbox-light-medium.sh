#!/bin/sh
# Gruvbox light, medium extended colors. NOT a base16 colorscheme
# Base16 Shell template by Chris Kempson (http://chriskempson.com)
# Gruvbox light, medium scheme by Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox), rutom

color00="fb/f1/c7" # light0

color01="cc/24/1d" # neutral_red
color02="98/97/1a" # neutral_green
color03="d7/99/21" # neutral_yellow
color04="45/85/88" # neutral_blue
color05="b1/62/86" # neutral_purple
color06="68/9d/6a" # neutral_aqua

color07="7c/6f/64" # dark4
color08="92/83/74" # gray_244

color09="9d/00/06" # faded_red
color10="79/74/0e" # faded_green
color11="b5/76/14" # faded_yellow
color12="07/66/78" # faded_blue
color13="8f/3f/71" # faded_purple
color14="42/7b/58" # faded_aqua

color15="3c/38/36" # dark1

color16="d6/5d/0e" # neutral_orange
color17="af/3a/03" # faded_orange

color18="d5/c4/a1" # light2
color19="bd/ae/93" # light3
color20="a8/99/84" # light4
color21="66/5c/54" # dark3

if [ -n "$TMUX" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  put_template() { printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' $@; }
elif [ "${TERM%%[-.]*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  put_template() { printf '\033P\033]4;%d;rgb:%s\007\033\\' $@; }
elif [ "${TERM%%-*}" = "linux" ]; then
  put_template() { [ $1 -lt 16 ] && printf "\e]P%x%s" $1 $(echo $2 | sed 's/\///g'); }
else
  put_template() { printf '\033]4;%d;rgb:%s\033\\' $@; }
fi

# 16 color space
put_template 0  $color00
put_template 1  $color01
put_template 2  $color02
put_template 3  $color03
put_template 4  $color04
put_template 5  $color05
put_template 6  $color06
put_template 7  $color07
put_template 8  $color08
put_template 9  $color09
put_template 10 $color10
put_template 11 $color11
put_template 12 $color12
put_template 13 $color13
put_template 14 $color14
put_template 15 $color15

# 256 color space
put_template 16 $color16
put_template 17 $color17
put_template 18 $color18
put_template 19 $color19
put_template 20 $color20
put_template 21 $color21

# clean up
unset -f put_template
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
