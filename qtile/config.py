from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from Xlib import display as xdisplay


def get_num_monitors():
    num_monitors = 0
    try:
        display = xdisplay.Display()
        screen = display.screen()
        resources = screen.root.xrandr_get_screen_resources()

        for output in resources.outputs:
            monitor = display.xrandr_get_output_info(output, resources.config_timestamp)
            preferred = False
            if hasattr(monitor, "preferred"):
                preferred = monitor.preferred
            elif hasattr(monitor, "num_preferred"):
                preferred = monitor.num_preferred
            if preferred:
                num_monitors += 1
    except Exception as e:
        # always setup at least one monitor
        return 1
    else:
        return num_monitors

num_monitors = get_num_monitors()

screens = [
    Screen(
        top=bar.Bar(
            [widget.TextBox(text = "Can")]
            bar_size=24,
            opacity=0.8,
        ),
    )
]

if num_monitors > 1:
    for m in range(num_monitors - 1):
        screens.append(
            Screen(
                top=bar.Bar(
                    [...],  # other screens widgets
                    bar_size=24,
                    opacity=0.8,
                ),
            )
        )

@hook.subscribe.client_new
def dialogs(window):
    if(window.window.get_wm_type() == 'dialog'
        or window.window.get_wm_transient_for()):
        window.floating = True

@hook.subscribe.client_new
def idle_dialogues(window):
    if((window.window.get_name() == 'Search Dialog') or
           (window.window.get_name() == 'Module') or
           (window.window.get_name() == 'Goto') or
           (window.window.get_name() == 'IDLE Preferences')):
        window.floating = True


mod = "mod4"
alt = "mod1"

keys = [
    Key([mod, "shift"], "q",
        lazy.shutdown()),
    Key([mod, "shift"],  "r",
        lazy.restart()),
    Key([mod], "q",
        lazy.window.kill()),

   # Key([mod], "f",
    #     lazy.window.toggle_floating()),
    Key([mod], "f",
        lazy.window.toggle_fullscreen()),
    Key([mod], "h",
        lazy.layout.left()),
    Key([mod], "l",
        lazy.layout.right()),
    Key([mod], "k",
        lazy.layout.up()),
    Key([mod], "j",
        lazy.layout.down()),
    Key([mod], "Tab", lazy.nextlayout()),

    # interact with prompts
    Key([mod], "r",              lazy.spawncmd()),
    Key([mod], "g",              lazy.switchgroup()),

    # start specific apps
    Key([mod], "Return",         lazy.spawn("alacritty")),
    Key([mod], "d", lazy.spawn("rofi -show drun")),

    # Change the volume if your keyboard has special volume keys.
    Key(
        [], "XF86AudioRaiseVolume",
        lazy.spawn("amixer -c 0 -q set Master 2dB+")
    ),
    Key(
        [], "XF86AudioLowerVolume",
        lazy.spawn("amixer -c 0 -q set Master 2dB-")
    ),
    Key(
        [], "XF86AudioMute",
        lazy.spawn("amixer -c 0 -q set Master toggle")
    ),

    # Also allow changing volume the old fashioned way.
    Key([mod], "equal", lazy.spawn("amixer -c 0 -q set Master 2dB+")),
    Key([mod], "minus", lazy.spawn("amixer -c 0 -q set Master 2dB-")),
]

# This allows you to drag windows around with the mouse if you want.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
        start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
        start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

# Next, we specify group names, and use the group name list to generate an appropriate
# set of bindings for group switching.
groups = []
for i in ["1", "2", "3", "4", "u", "i", "o", "p"]:
    groups.append(Group(i))
    keys.append(
        Key([mod], i, lazy.group[i].toscreen())
    )
    keys.append(
        Key([mod, "shift"], i, lazy.window.togroup(i))
    )

layout_defaults = dict(
    border_focus = "#1ABB9B",
    border_normal = "#222D32",
    grow_amount = 10,
    lower_right = True,
    border_width = 5,
    margin = 10)

layouts = [
    layout.Bsp(fair = True, **layout_defaults),
]

main = None
follow_mouse_focus = True

import os, subprocess, re

def is_running(process):
    s = subprocess.Popen(["ps", "axuw"], stdout=subprocess.PIPE)
    for x in s.stdout:
        if re.search(process, x):
            return True
    return False

def execute_once(process):
    if not is_running(process):
        return subprocess.Popen(process.split())

# start the applications at Qtile startup
@hook.subscribe.startup
def startup():
    home = os.path.expanduser("~/.config/qtile/startup.sh")
    subprocess.call([home])
