# Touchpad

```sh
sudoedit /etc/X11/xorg.conf.d/30-touchpad.conf
---
Section "InputClass"
    Identifier "touchpad"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "TappingButtonMap" "lrm" # Button 1/2/3 map to 1-finger/2-finger/3-finger tap
EndSection
```
