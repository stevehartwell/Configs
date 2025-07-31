#!/bin/sh

set -e

: ${1?specify json file arg from IndexedDB export}

source "$(dirname $0)"/0-defs.sh
: ${BANLISTS?}

for banlist in "${BANLISTS[@]}"
do
    jq < "$1" \
        ".[0].photonSettings.${banlist}" \
        | sed -E -e '1d' -e '$d' -e 's/^ +"(.*)",?$/\1/' \
        | sort -f -u \
        > banlists/${banlist}.txt
done
