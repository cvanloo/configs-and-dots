alias ls lsd

abbr v nvim
abbr n nvim
abbr lt "ls --tree"
abbr l "ls -lahF"
abbr ll "ls -lhF"
abbr la "ls -lAhF"
abbr yo " yt-dlp"
abbr scramble "exiftool -all="
abbr getpath "find -type f | fzf | sed 's/^..//' | tr -d '\n' | xsel -bi"
abbr p "paru -Syu"
abbr nmpv "mpv --vid=no"
abbr nsmpv "mpv --vid=no --shuffle"
abbr sxiv nsxiv
abbr pr pacman -Rs \(pacman -Qtdq\)
abbr spr 'sudo sh -c \'pacman -Rs $(pacman -Qtdq)\''
