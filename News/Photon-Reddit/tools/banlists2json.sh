#!/bin/sh

BANLISTS=(
    'subredditBlacklist'
    'userBlacklist'
    'tileTextBlacklist'
##    'flairTextBlacklist'
)

for banlist in "${BANLISTS[@]}"
do
    echo "${banlist}:"
    sed < banlists/${banlist}.txt \
        -e '/^$/d' -e 's/^/- "/' -e 's/$/"/'
done | yq -o json
