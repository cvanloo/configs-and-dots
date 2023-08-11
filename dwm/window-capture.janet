#!/usr/bin/env janet
(use sh)
(import spork/path)

# cp window-capture.janet ~/.local/bin/__window-capture && chmod a+x ~/.local/bin/__window-capture

(def default-locations `
/run/media/prince/STOW/Documents/
/run/media/prince/STOW/Pictures/
/home/prince/Pictures/
/home/prince/Documents/
<other>
`)

(defn select-win
  []
  (first (peg/match '(some (+ (* "Window id: " (<- :w+)) 1))
                    ($< xwininfo))))

(defn capture-window
 [save-path]
 ($? scrot -f -w ,(select-win) ,save-path))

(defn capture-selection
  [save-path]
  ($? scrot -fs ,save-path))

# 1. Ask what to capture
(def capture-fun
  (case ($<_ dmenu -i -p "Capture > " < "Window\nSelection")
    "Window" capture-window
    "Selection" capture-selection))

# 2. Ask where to save to
(def loc-prefix ($<_ dmenu -i -l 5 -p "Save to > " < ,default-locations))

(def name ($<_ dmenu -i -p "Name > " < ""))

(def save-path
  (path/abspath (if (= loc-prefix "<other>")
                  name
                  (path/join loc-prefix name))))

# 3. Do the capturing
(if (not (nil? (os/stat save-path)))
  ($ notify-send -u low "file already exists")
  (if (capture-selection save-path)
    ($ notify-send -u low -i ,save-path "-" ,(string/join ["Screenshot saved to "
                                                           "<span color='#acd7e5'>"
                                                           save-path
                                                           "</span>"]))
    ($ notify-send -u low "unable to take screenshot")))
