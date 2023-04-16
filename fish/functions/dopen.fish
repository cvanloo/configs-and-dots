function dopen
if count $argv > /dev/null
devour xdg-open $argv
else if set res (find -type f | fzf)
devour xdg-open $res
end
end
