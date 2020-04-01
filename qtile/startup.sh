#!/bin/sh

xrandr --output eDP-1 --mode 1920x1080
sleep 1
killall feh

feh --bg-fill -randomize ~/.config/wallpaper/* &
