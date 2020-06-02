#!/usr/bin/zsh

function getStatus() {
	caps_status=$(xset q | grep -i caps | cut -c 22-24)
	echo $caps_status
}

echo $(getStatus)

dunstify -r 124 "Caps Lock: $(getStatus)"
