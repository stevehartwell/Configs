#!/bin/sh

set -e

source 0:source-env.sh
: ${MINIFLUX_PIDFILE:?set to name of running miniflux.pidfile}
: ${PGDATA:?export set to postgresql db cluster directory}

[[ ! -f $MINIFLUX_PIDFILE ]] && {
    echo $0: $MINIFLUX_PIDFILE not found >&2
    exit 1
}
kill -TERM $(< $MINIFLUX_PIDFILE)
rm -f $MINIFLUX_PIDFILE
sleep 5
pg_ctl stop --mode=smart
