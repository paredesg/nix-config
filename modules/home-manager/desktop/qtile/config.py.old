from libqtile import bar, layout
from libqtile.config import Click, Drag, Group, Key, Screen
from libqtile.lazy import lazy
from libqtile.widget import CPU, Clock, GroupBox, Memory, Net, Sep, WindowName

mod = "mod4"
terminal = "kitty"

keys = [
    Key([mod], "Return", lazy.spawn(terminal)),
    Key([mod], "q", lazy.window.kill()),
    Key([mod], "d", lazy.spawn("rofi -show drun")),
    Key([mod, "shift"], "r", lazy.reload_config()),
    Key([mod, "control"], "q", lazy.shutdown()),

    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),

    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),

    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "space", lazy.next_layout()),
]

groups = [Group(i) for i in "123456789"]
for g in groups:
    keys.extend([
        Key([mod], g.name, lazy.group[g.name].toscreen()),
        Key([mod, "shift"], g.name, lazy.window.togroup(g.name)),
    ])

layouts = [
    layout.Columns(border_focus="#89b4fa", border_width=2, margin=6),
    layout.Max(),
    layout.Floating(),
]

widget_defaults = dict(font="sans", fontsize=13, padding=4)

screens = [
    Screen(
        top=bar.Bar(
            [
                GroupBox(**widget_defaults),
                Sep(),
                WindowName(**widget_defaults),
                CPU(format="CPU {load_percent}%", **widget_defaults),
                Memory(format="RAM {MemUsed: .0f}M", **widget_defaults),
                Net(interface="auto", **widget_defaults),
                Clock(format="%d/%m %H:%M", **widget_defaults),
            ],
            26,
        ),
    ),
]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# Nécessaire pour la compatibilité Java
wmname = "LG3D"