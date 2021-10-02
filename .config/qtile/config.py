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

import os
import socket
import subprocess

from typing import List  # noqa: F401
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen 
# from libqtile.lazy import lazy
from libqtile.command import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()

mod = "mod4"
terminal = "alacritty"

keys = [
    Key([mod, "shift"], "l",
        lazy.spawn("i3lock -t -i ~/Wallpapers/groot-i-am-root-qhd-1920x1080.png"),
        desc='launch i3lock and lock the screen'
        ),
    Key([mod, "shift"], "p",
        lazy.spawn("/home/ka9/.config/rofi/powermenu/powermenu.sh"),
        desc='launch rofi power menu'
        ),
    Key([mod], "l",
        lazy.layout.grow(),
        lazy.layout.increase_nmaster(),
        desc='Expand window (MonadTall), increase number in master pane (Tile)'
        ),
    Key([mod], "h",
        lazy.layout.shrink(),
        lazy.layout.decrease_nmaster(),
        desc='Shrink window (MonadTall), decrease number in master pane (Tile)'
        ),
    Key([mod], "n",
        lazy.layout.normalize(),
        desc='normalize window size ratios'
        ),
    Key([mod], "m",
        lazy.layout.maximize(),
        desc='toggle window between minimum and maximum sizes'
        ),
    Key([mod, "shift"], "Return",
        lazy.spawn("/home/ka9/.config/rofi/bin/launcher_colorful"),
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
    ### Switch focus to specific monitor (out of two)
    Key([mod], "w",
        lazy.to_screen(0),
        desc='Keyboard focus to monitor 1'
        ),
    Key([mod], "e",
        lazy.to_screen(1),
        desc='Keyboard focus to monitor 2'
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

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

## MULTIPLE DISPLAY ##
# pinned_groups = ['12345', '67890']
# all_groups = ''.join(pinned_groups)
# 
# groups = [Group(i) for i in all_groups]
# 
# for j, names in enumerate(pinned_groups):
#     keys.extend(Key([mod], i, lazy.to_screen(j), lazy.group[i].toscreen()) for i in names)
# 
# keys.extend(Key([mod, 'shift'], i, lazy.window.togroup(i)) for i in all_groups)
## MULTIPLE DISPLAY END ##

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
        font = "FuraCode Nerd Font, Bold",
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

colors = [["#1d2021", "#1d2021"], # bg0_h | 0
          ["#C7CEEA", "#C7CEEA"], # crayola's periwinkle | 1
          ["#E2F0CB", "#E2F0CB"], # dirty white | 2
          ["#FFDAC1", "#FFDAC1"], # yellow | 3
          ["#B5EAD7", "#B5EAD7"], # magic mint | 4
          ["#FFB7B2", "#FFB7B2"], # melon | 5
          ["#FF9AA2", "#FF9AA2"], # pink salmon | 6
          ["#ebdbb2", "#ebdbb2"], # fg | 7
          ["#3c3836", "#3c3836"]] # bg1 | 8


prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

widget_defaults = dict(
    font='FuraCode Nerd Font, Bold',
    fontsize=12,
    padding=5,
    background=colors[0]
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(
                        lineWidth = 0,
                        padding = 6,
                        foreground = colors[0],
                        background = colors[0]
                        ),
                widget.GroupBox(
                        fontsize = 12,
                        margin_y = 5,
                        margin_x = 0,
                        padding_y = 3,
                        padding_x = 5,
                        borderwidth = 3,
                        active = colors[7],
                        inactive = colors[7],
                        rounded = False,
                        block_highlight_text_color = colors[0],
                        highlight_color = colors[7],
                        highlight_method = "line",
                        foreground = colors[7],
                        background = colors[0]
                        ),
                widget.Prompt(
                        prompt = prompt,
                        padding = 10,
                        foreground = colors[7],
                        background = colors[0]
                        ),
                widget.Sep(
                        linewidth = 0,
                        padding = 30,
                        foreground = colors[7],
                        background = colors[0]
                        ),
                widget.WindowName(
                        foreground = colors[7],
                        background = colors[0],
                        padding = 0
                        ),
                widget.Sep(
                        linewidth = 0,
                        padding = 30,
                        foreground = colors[7],
                        background = colors[0]
                        ),
                widget.Systray(
                        background = colors[0],
                        padding = 5,
                        icon_size = 18
                        ),
                widget.Sep(
                        linewidth = 1,
                        padding = 10,
                        foreground = colors[7],
                        background = colors[0]
                        ),
                widget.CurrentLayoutIcon(
                        scale = 0.75,
                        foreground = colors[7],
                        background = colors[6]
                        ),
                widget.CurrentLayout(
                        foreground = colors[6],
                        background = colors[8],
                        padding = 5
                        ),
                widget.Sep(
                        linewidth = 0,
                        padding = 5,
                        foreground = colors[7],
                        background = colors[0]
                        ),
                widget.Net(
                        interface = "wlp3s0",
                        format = '{down}',
                        foreground = colors[5],
                        background = colors[8],
                        padding = 5
                        ),
                widget.TextBox(
                        text = "祝",
                        fontsize = 16,
                        padding = 5,
                        foreground = colors[8],
                        background = colors[5]
                        ),
                widget.Net(
                        interface = "wlp3s0",
                        format = '{up}',
                        foreground = colors[5],
                        background = colors[8],
                        padding = 5
                        ),
                widget.Sep(
                        linewidth = 0,
                        padding = 5,
                        foreground = colors[7],
                        background = colors[0]
                        ),
                widget.Battery(
                        battery = "BAT1",
                        charge_char = '',
                        discharge_char = "",
                        empty_char = "",
                        full_char = "",
                        unknown_char = "",
                        low_foreground = colors[6],
                        low_percentage = 0.25,
                        notify_below = 0.21,
                        show_short_text = False,
                        update_interval = 5,
                        fontsize = 16,
                        format ='{char}',
                        padding = 5,
                        foreground = colors[8],
                        background = colors[3]
                        ),
                widget.Battery(
                        battery = "BAT1",
                        update_interval = 5,
                        format ='{percent:2.0%}',
                        padding = 5,
                        foreground = colors[3],
                        background = colors[8]
                        ),
                widget.Sep(
                        linewidth = 0,
                        padding = 5,
                        foreground = colors[7],
                        background = colors[0]
                        ),
                widget.TextBox(
                        text = "  ",
                        font = "feather",
                        fontsize = 12,
                        foreground = colors[0],
                        background = colors[2],
                        padding = 0
                        ),
                widget.Volume(
                        foreground = colors[2],
                        background = colors[8],
                        padding = 5
                        ),
                widget.Sep(
                        linewidth = 0,
                        padding = 5,
                        foreground = colors[7],
                        background = colors[0]
                        ),
                widget.TextBox(
                        text = "直",
                        fontsize = 12,
                        padding = 5,
                        foreground = colors[8],
                        background = colors[4]
                        ),
                widget.Wlan(
                        interface = "wlp3s0",
                        format = '{essid}',
                        foreground = colors[4],
                        background = colors[8],
                        padding = 5
                        ),
                widget.Sep(
                        linewidth = 0,
                        padding = 5,
                        foreground = colors[7],
                        background = colors[0]
                        ),
                widget.TextBox(
                        text = "",
                        fontsize = 16,
                        padding = 5,
                        foreground = colors[8],
                        background = colors[1]
                        ),
                widget.Clock(
                        foreground = colors[1],
                        background = colors[8],
                        padding = 5,
                        format = "%A, %B %d - %H:%M"
                        ),
                widget.Sep(
                        linewidth = 0,
                        padding = 5,
                        foreground = colors[0],
                        background = colors[8]
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
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

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
