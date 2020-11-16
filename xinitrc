xrandr --dpi 192 --output "eDP-1" --mode 3840x2160 --scale 2x2 --output "DP-1" --mode 3440x1440

xrdb -merge ~/.Xresources
sxhkd &
exec bspwm
