function fcd
if set res (find -type d | fzf)
cd $res
end
end
