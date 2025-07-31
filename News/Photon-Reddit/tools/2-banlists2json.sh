#!/bin/sh

set -e

source "$(dirname $0)"/0-defs.sh
: ${BANLISTS?}

for banlist in "${BANLISTS[@]}"
do
    echo "${banlist}:"
    sed < banlists/${banlist}.txt \
        -e '/^$/d' -e 's/^/- "/' -e 's/$/"/'
done | yq -o json
