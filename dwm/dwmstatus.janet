#!/usr/bin/env janet
(use sh)

# sudo cp dwmstatus.janet /usr/local/bin/dwmstatus
# sudo chmod 755 /usr/local/bin/dwmstatus

(defn parse-fun
  [prop]
  (peg/compile ~(any (+ (* (? "\n") ,prop ":" :s* (<- (some (+ (set ":,_") :w+))) (? "\n")) 1))))

(def parse-layout (parse-fun "layout"))
(def parse-variant (parse-fun "variant"))
(def parse-volume (peg/compile '(any (+ (<- (* :d+ "%")) 1))))
(def parse-ip4 '(any (+ (* "inet " (<- (* :d+ (repeat 3 (* "." :d+)))) "/24") 1)))

(def sep " | ")

(defn format-status
  []
  (let [date ($<_ date "+%a %d %b %Y %H:%M %Z")
        keymap ($< setxkbmap -query)
        layout (first (peg/match parse-layout keymap))
        variant (peg/match parse-variant keymap)
        volume ($< pactl get-sink-volume @DEFAULT_SINK@)
        volume (first (peg/match parse-volume volume))
        ip4    ($< ip -4 addr)
        ip4    (first (peg/match parse-ip4 ip4))
        muted  (if (= "true" ($<_ dunstctl is-paused))
                 "mute | "
                 "")]
    (string/join [muted
                  ip4 sep
                  volume sep
                  (if (empty? variant)
                    layout
                    (string/join [layout ":" (first variant)])) sep
                  date])))

(while ($? xsetroot -name ,(let [[ok res] (protect (format-status))]
                             (if ok res "<error occurred>")))
  (os/sleep 0.5))
