# Backlight

```sh
pacman -Syu acpilight
gpasswd -a $(whoami) video

# Get the correct key codes using `xbindkeys -k`
cat >> ~/.xbindkeysrc <<EOF
"xbacklight -dec 5"
    m:0x0 + c:232
    XF86MonBrightnessDown

"xbacklight -inc 5"
    m:0x0 + c:233
    XF86MonBrightnessUp
EOF

reboot
```
