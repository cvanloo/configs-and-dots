# LightDM

Install the display manager and greeter.

```sh
paru -Syu lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
```

Configure X keyboard layout.

```sh
man xkeyboard-config
localectl --no-convert set-x11-keymap us,dvorak pc105 dvp, caps:escape,compose:ralt,grp:win_space_toggle
```

Or use Xmodmap (which didn't work for me).

```sh
cat <<EOF
-model pc105 -layout us,dvorak -variant dvp, -option caps:escape -option compose:ralt -option grp:win_space_toggle
EOF > ~/.Xmodmap # or /etc/X11/Xmodmap
```

Enable autologin (I do this when I've already setup full-disk encryption).

```sh
cat <<EOF
[Seat:*]
autologin-user=prince
EOF > /etc/lightdm/lightdm.conf

groupadd -r autologin
gpasswd -a prince autologin
```

Configure the X session (window manager) to use when auto login.

```sh
# find valid session names
ls -lahF /usr/share/xsessions/*.desktop
ls -lahF /usr/share/wayland-sessions/*.desktop

cat <<EOF
xfce4
EOF > ~/.dmrc
```
