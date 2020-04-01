killall compton
killall redshift
killall feh
sleep 1

xrandr --output eDP-1 --mode 1920x1080
xrandr --output DP-1 --mode 3440x1440 --left-of eDP-1
compton &
sxhkd &
redshift &
$HOME/.config/polybar/launch.sh
feh --bg-fill --randomize ~/.config/wallpaper/*
