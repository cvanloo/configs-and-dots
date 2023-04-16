function fullpath
if count $argv > /dev/null
readlink -f $argv[1] | tr -d '\n' | xsel -bi
else if set res (find | fzf)
readlink -f $res | tr -d '\n' | xsel -bi
end
end
