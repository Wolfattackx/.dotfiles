#!/usr/bin/zsh

function getBrightness() {
	v=$(xbacklight -get)
	v=${v%.*}
	echo $v
}

case $1 in
	inc)
		xbacklight -inc 1
		dunstify -r 123 "Brightness: $(getBrightness)"
		;;
	dec)
		xbacklight -dec 1
		dunstify -r 123 "Brightness: $(getBrightness)"
esac
