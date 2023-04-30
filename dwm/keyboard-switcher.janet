#!/usr/bin/env janet

# cp keyboard-switcher.janet ~/.local/bin/__keyboard-switcher && chmod a+x ~/.local/bin/__keyboard-switcher

(use sh)

(def layouts `
dvorak
us dvp
ch
`)

(def selection ($<_ dmenu -i -p "Keyboard Layout > " < ,layouts))
($ "setxkbmap" ;(string/split " " selection))

