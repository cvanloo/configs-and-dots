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

(def win-id (select-win))

(def loc-prefix ($<_ dmenu -i -l 5 -p "Save to > " < ,default-locations))

(def name ($<_ dmenu -i -p "Name > " < ""))

(def save-path
  (path/abspath (if (= loc-prefix "<other>")
                  name
                  (path/join loc-prefix name))))

(if (not (nil? (os/stat save-path)))
  ($ notify-send -u low "file already exists")
  (do
    (def status
      ($? scrot -f -w ,win-id ,save-path))
    (if status
      ($ notify-send -u low -i ,save-path "-" ,(string/join ["Screenshot saved to "
                                                             "<span color='#acd7e5'>"
                                                             save-path
                                                             "</span>"]))
      ($ notify-send -u low "unable to take screenshot"))))
