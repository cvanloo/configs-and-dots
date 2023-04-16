function open
if count $argv > /dev/null
xdg-open $argv
else if set res (find -type f | fzf)
xdg-open $res
end
end
