#!/bin/sh

set -e

source 0:source-env.sh
: ${PGDATA:?export set to postgresql db cluster directory}
: ${MINIFLUX_EXE:?set to path to miniflux executable plus --config-file param }
: ${MINIFLUX_PIDFILE:?set to name of running miniflux.pidfile}

pg_ctl start --options="-c logging_collector=on"

nohup $MINIFLUX_EXE < /dev/null > $MINIFLUX_LOG 2>&1 &
echo $! > $MINIFLUX_PIDFILE

