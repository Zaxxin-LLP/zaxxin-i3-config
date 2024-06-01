#!/bin/bash
I3_CONFIG=~/.i3
DOUBLE=$I3_CONFIG/assets/background/$(ls ${I3_CONFIG}/assets/background/ | grep '^twin' | grep -e \.jpg)
if [ ! "$#" -ne 2 ]; then
MODE=$1
case $2 in
	he)
		WALLPAPER=$I3_CONFIG/assets/background/hen/kasli_NSFW.jpg
	;;
	ga)
		#echo $DOUBLE
		WALLPAPER=$DOUBLE
	;;
	*)
		WALLPAPER=$I3_CONFIG/assets/background/$2
	;;
esac
#Hidden Monitor set as first non-primary monitor
SCREEN=$(xrandr | grep -w connected | awk '!/primary/' | awk  -F'[ \+]' '{print $1}')
#echo $SCREEN
#echo $WALLPAPER

exec xwallpaper --output $SCREEN --$MODE $WALLPAPER
else
	WALLPAPER=$I3_CONFIG/assets/background/default.jpg
	exec xwallpaper --stretch $WALLPAPER
fi
