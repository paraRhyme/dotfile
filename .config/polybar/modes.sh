#!/bin/sh

case $1 in
	1)
		for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
			MONITOR=$m polybar --reload bottom &
		done
		sleep 1;
		i3-msg mode "[l]ogout | [p]ower | [r]eboot";
		;;
	2)
		for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
			MONITOR=$m polybar --reload bottom &
		done
		sleep 1;
		i3-msg mode "resize";
		;;
	3)
		pgrep -xf "polybar --reload tray";
		if [ $? -eq 0 ];
		then
			pkill -xf 'polybar --reload tray';
		else
			for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
				MONITOR=$m polybar --reload tray &
			done
		fi
		;;
esac
