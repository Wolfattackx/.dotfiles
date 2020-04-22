#!/bin/sh

# Import the colors
. "${HOME}/.cache/wal/colors.sh"

dmenu -fn Tamsyn:pixelsize=17 -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -i
