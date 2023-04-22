#!/usr/bin/env janet

# cp keyboard-switcher.janet ~/.local/bin/__keyboard-switcher && chmod a+x ~/.local/bin/__keyboard-switcher

(use sh)

(def layouts `
dvorak
us dvp
ch
`)

# -i case insensitive search
# -p prompt string
# dmenu reads list of options from stdin and prints chosen option to stdout
(let [selection ($<_ dmenu -i -p "Keyboard Layout > " < ,layouts)
      cmd (array/concat @["setxkbmap"] (string/split " " selection))]
  ($* cmd))
