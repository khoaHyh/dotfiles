# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import iwlib
import os
import re
import socket
import subprocess
from typing import List  # noqa: F401
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
#terminal = guess_terminal()
terminal = "termite"

keys = [
    Key([mod, "shift"], "Return",
        lazy.spawn("rofi -show drun"),
        desc='Run Launcher'
        ),
    Key([mod, "shift"], "f",
        lazy.window.toggle_floating(),
        desc="toggle floating"
        ),
    Key([mod], "f",
        lazy.window.toggle_fullscreen(),
        desc="toggle fullscreen"
        ),
    # Switch between windows in current stack pane
    Key([mod], "k", 
        lazy.layout.down(),
        desc="Move focus down in stack pane"
        ),
    Key([mod], "j", 
        lazy.layout.up(),
        desc="Move focus up in stack pane"
        ),

    # Move windows up or down in current stack
    Key([mod, "shift"], "k", 
        lazy.layout.shuffle_down(),
        desc="Move window down in current stack "
        ),
    Key([mod, "shift"], "j", 
        lazy.layout.shuffle_up(),
        desc="Move window up in current stack "
        ),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next(),
        desc="Switch window focus to other pane(s) of stack"
        ),

    # Swap panes of split stack
    Key([mod, "shift"], "space", 
        lazy.layout.rotate(),
        desc="Swap panes of split stack"
        ),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "control"], "Return", 
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"
        ),
    Key([mod], "Return", 
        lazy.spawn(terminal), desc="Launch terminal"
        ),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", 
        lazy.next_layout(), 
        desc="Toggle between layouts"
        ),
    Key([mod, "shift"], "q", 
        lazy.window.kill(), 
        desc="Kill focused window"
        ),

    Key([mod, "shift"], "r", 
        lazy.restart(), 
        desc="Restart qtile"
        ),
    Key([mod, "control"], "q", 
        lazy.shutdown(), 
        desc="Shutdown qtile"
        ),
    Key([mod], "r", 
        lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"
        ),
]

# groups = [Group(i) for i in "asdfuiop"]
# groups = [Group(i) for i in "123456789"]

# Set names for workspaces
def init_group_names():
    return [
            ("1 ", {'layout': 'monadtall'}),
            ("2 ", {'layout': 'monadtall'}),
            ("3 ", {'layout': 'monadtall'}),
            ("4 ", {'layout': 'monadtall'}),
            ("5 ", {'layout': 'monadtall'}),
            ("6 ", {'layout': 'monadtall'}),
            ("7 ", {'layout': 'monadtall'}),
            ("8 ", {'layout': 'monadtall'}),
            ("9 ", {'layout': 'monadtall'}),
            ]

def init_groups():
    return [Group(name, **kwargs) for name, kwargs in group_names]

if __name__ in ["config", "__main__"]:
    group_names = init_group_names()
    groups =  init_groups()

# Make it so that keybindings match position in array
for i, (name, kwargs) in enumerate(group_names, 1):
    # Switch to another group
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    # Send current window to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))

#for i in groups:
#    keys.extend([
#        # mod1 + letter of group = switch to group
#        Key([mod], i.name, lazy.group[i.name].toscreen(),
#            desc="Switch to group {}".format(i.name)),
#
#        # mod1 + shift + letter of group = switch to & move focused window to group
#        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
#            desc="Switch to & move focused window to group {}".format(i.name)),
#        # Or, use below if you prefer not to switch to that group.
#        # # mod1 + shift + letter of group = move focused window to group
#        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
#        #     desc="move focused window to group {}".format(i.name)),
#    ])
layout_theme = {"border_width": 2,
                "margin": 6,
                "border_focus": "#d5c4a1",
                "border_normal": "1d2021"
                }

layouts = [
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Columns(),
    # layout.Matrix(),
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    # layout.MonadWide(),
    # layout.RatioTile(),
    layout.Tile(shift_windows=True, **layout_theme),
    layout.Stack(num_stacks=2),
    layout.TreeTab(
        font = "Hack Nerd Font",
        fontsize = 10,
        sections = ["FIRST", "SECOND"],
        section_fontsize = 11,
        bg_color = "141414",
        active_bg = "90C435",
        active_fg = "000000",
        inactive_bg = "384323",
        inactive_fg = "a0a0a0",
        padding_y = 5,
        section_top = 10,
        panel_width = 320
        ),
    layout.Floating(**layout_theme)
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

colors = [["#282828", "#282828"], # dark bg
          ["#b8bb26", "#b8bb26"], # gruvbox green
          ["#ebdbb2", "#ebdbb2"], # fg
          ["#83a598", "#83a598"], # gruvbox blue
          ["#d3869b", "#d3869b"], # gruvbox purple
          ["#fabd2f", "#fabd2f"], # gruvbox yellow
          ["#fe8019", "#fe8019"], # gruvbox orange
          ["#8ec07c", "#8ec07c"]] # gruvbox aqua


prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

widget_defaults = dict(
    font='Hack Nerd Font',
    fontsize=12,
    padding=2,
    background=colors[2]
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(
                        lineWidth = 0,
                        padding = 6,
                        foreground = colors[2],
                        background = colors[0]
                        ),
                widget.GroupBox(
                        font = "Hack Nerd Font Bold",
                        fontsize = 10,
                        margin_y = 3,
                        margin_x = 0,
                        padding_y = 5,
                        padding_x = 3,
                        borderwidth = 3,
                        active = colors[2],
                        inactive = colors[2],
                        rounded = False,
                        highlight_method = "block",
                        foreground = colors[2],
                        background = colors[0]
                        ),
                widget.Prompt(
                        prompt = prompt,
                        font = "Hack Nerd Font",
                        padding = 10,
                        foreground = colors[3],
                        background = colors[0]
                        ),
                widget.Sep(
                        linewidth = 0,
                        padding = 40,
                        foreground = colors[2],
                        background = colors[0]
                        ),
                widget.WindowName(
                        foreground = colors[5],
                        background = colors[0],
                        padding = 0
                        ),
                widget.Systray(
                        background = colors[0],
                        padding = 5,
                        icon_size = 18
                        ),
                widget.TextBox(
                        text = "",
                        font = "UbuntuMono Nerd Font",
                        foreground = colors[4],
                        background = colors[0],
                        padding = -3,
                        fontsize = 37
                        ),
                widget.CurrentLayout(
                        foreground = colors[0],
                        background = colors[4],
                        padding = 5
                        ),
                widget.TextBox(
                        text = "",
                        font = "UbuntuMono Nerd Font",
                        foreground = colors[3],
                        background = colors[4],
                        padding = -3,
                        fontsize = 37
                        ),
                widget.Net(
                        interface = "wlp3s0",
                        format = '{down} 祝{up}',
                        foreground = colors[0],
                        background = colors[3],
                        padding = 5
                        ),
                widget.TextBox(
                        text = "",
                        font = "UbuntuMono Nerd Font",
                        foreground = colors[7],
                        background = colors[3],
                        padding = -3,
                        fontsize = 37
                        ),
                widget.Wlan(
                        interface = "wlp3s0",
                        format = '直 {essid} {percent:2.0%}',
                        foreground = colors[0],
                        background = colors[7],
                        padding = 5
                        ),
                widget.TextBox(
                        text = "",
                        font = "UbuntuMono Nerd Font",
                        foreground = colors[1],
                        background = colors[7],
                        padding = -3,
                        fontsize = 37
                        ),
                widget.Volume(
                        theme_path = '/home/ka9/.config/qtile/volume-icons',
                        foreground = colors[0],
                        background = colors[1],
                        padding = 0
                        ),
                widget.Volume(
                        foreground = colors[0],
                        background = colors[1],
                        padding = 5
                        ),
                widget.TextBox(
                        text = "",
                        font = "UbuntuMono Nerd Font",
                        foreground = colors[5],
                        background = colors[1],
                        padding = -3,
                        fontsize = 37
                        ),
                widget.BatteryIcon(
                        battery = "BAT1",
                        theme_path = '/home/ka9/.config/qtile/battery-icons',
                        padding = 0,
                        update_interval = 5,
                        background = colors[5]
                        ),
                widget.Battery(
                        battery = "BAT1",
                        charge_char = '',
                        discharge_char = "",
                        #format ='{char} {percent:2.0%} {hour:d}h:{min:02d}m',
                        format ='{percent:2.0%} {hour:d}h:{min:02d}m',
                        foreground = colors[0],
                        padding = 5,
                        background = colors[5]
                        ),
                widget.TextBox(
                        text = "",
                        font = "UbuntuMono Nerd Font",
                        foreground = colors[6],
                        background = colors[5],
                        padding = -3,
                        fontsize = 37
                        ),
                widget.Clock(
                        foreground = colors[0],
                        background = colors[6],
                        # format = "%Y-%m-%d %a %I:%M %p"
                        format = " %A, %B %d - %H:%M"
                        ),
                widget.Sep(
                        linewidth = 0,
                        padding = 10,
                        foreground = colors[0],
                        background = colors[6]
                        ),
            ],
            20,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
