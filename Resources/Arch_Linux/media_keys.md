# Media Keys

Get media keys working using `xbindkeys`.

```sh
# Installation
paru -Syu xbindkeys

# Get key codes
# 1. Run this cmd
xbindkeys --key
# 2. Enter any key combination
# 3. Copy the key codes (usually _two_ lines!) from the terminal.

# Now create the config file
vim ~/.xbindkeysrc
# Syntax:
# "command to execute"
#     key codes
```

Example configuration for volume control using multimedia keys:

```txt
# Increase volume
"pactl set-sink-volume @DEFAULT_SINK@ +1000"
    m:0x0 + c:123
    XF86AudioRaiseVolume 

# Decrease volume
"pactl set-sink-volume @DEFAULT_SINK@ -1000"
    m:0x0 + c:122
    XF86AudioLowerVolume 

# Mute volume
"pactl set-sink-mute @DEFAULT_SINK@ toggle"
    m:0x0 + c:121
    XF86AudioMute 
```

Reload after configuration changes:

`xbindkeys --poll-rc`

Put this line in your `~/.xinitrc`, before the `exec ...` line:

`xbindkeys`
