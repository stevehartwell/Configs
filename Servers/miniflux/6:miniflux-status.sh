#!/bin/sh

set -e

source 0:source-env.sh
: ${PGDATA:?export set to postgresql db cluster directory}
: ${MINIFLUX_DB_LOG:?set to postgresql db log file name}
: ${MINIFLUX_EXE:?set to path to miniflux executable plus --config-file param}
: ${MINIFLUX_LOG:?set to stderr or path to miniflux log file}
: ${MINIFLUX_PIDFILE:?set to name of running miniflux.pidfile}

echo '#----- miniflux:'
echo miniflux PID is $(< $MINIFLUX_PIDFILE)
$MINIFLUX_EXE -healthcheck auto
tail $MINIFLUX_LOG

echo '#----- postgresql database:'
pg_ctl status
tail $MINIFLUX_DB_LOG


