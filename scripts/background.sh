#!/bin/bash
if [ ! "$#" -ne 2 ]; then
MODE=$1
case $2 in
	he)
		WALLPAPER=~/.i3/assets/background/twin_kaslis.jpg
	;;
	ga)
		WALLPAPER=~/.i3/assets/background/
	;;
	*)
		WALLPAPER=~/.i3/assets/background/$2
	;;
esac
SCREEN=$(xrandr | grep -w connected\ primary | awk -F'[ \+]' '{print $1}')
echo $SCREEN
echo $WALLPAPER

exec xwallpaper --output $SCREEN --$MODE $WALLPAPER
else
	WALLPAPER=~/.i3/assets/background/default.jpg
	exec xwallpaper --stretch $WALLPAPER
fi
