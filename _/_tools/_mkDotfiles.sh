#!/usr/bin/env sh

vis_dotfiles="_"

cd "$HOME"

DOTF_EXCEPTIONS=(
    .CFUserTextEncoding .DS_Store .Trash .cups
    .*_history .stCommitMsg
    .ssh
    .zsh_sessions
)

mkdir -p "$vis_dotfiles"

for dotf in .??*
do
    [[ -L "$dotf" ]] && continue

    for except in "${DOTF_EXCEPTIONS[@]}"; do
        [[ "$dotf" == "$except" ]] && continue 2
    done

    visname="$vis_dotfiles/"$(expr "$dotf" : '\.\(.*\)')

    [[ -e "$visname" ]] && mv "$visname" "${visname}--"

    mv "$dotf" "$visname" && ln -s "$visname" "$dotf"
done
