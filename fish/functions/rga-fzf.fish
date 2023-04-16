function rga-fzf
set RG_PREFIX "rga --files-with-matches"
set file "$(
FZF_DEFAULT_COMMAND="$RG_PREFIX '$argv'" \
fzf --sort --preview="[ ! -z {} ] && rga --pretty --context 5 {q} {}" \
--phony -q "$argv" \
--bind "change:reload:$RG_PREFIX {q}" \
--preview-window="70%:wrap"
)" &&
echo "opening $file" &&
xdg-open "$file"
end
