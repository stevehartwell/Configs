#!/bin/sh

set -e

source 0:source-env.sh
: ${PGDATA:?export set to postgresql db cluster directory}
: ${MINIFLUX_CONF:?specify miniflux.conf file name}
: ${MINIFLUX_LOG:?set to miniflux --log filename}
: ${MINIFLUX_EXE:?set to path to miniflux executable plus --config-file param }

cat <<EOF > $MINIFLUX_CONF
# miniflux -config-file $MINIFLUX_CONF
#
DATABASE_URL=user=$MINIFLUX_DB_USER password=$MINIFLUX_DB_PASSWD dbname=$MINIFLUX_DB_NAME sslmode=disable
# DATABASE_URL=postgres://USER:PASSWORD@HOST/DBNAME?OPTIONS
# DATABASE_URL=postgres://$MINIFLUX_DB_USER:$MINIFLUX_DB_PASSWD@localhost/$MINIFLUX_DB_NAME?sslmode=disable

HTTPS=false
BASE_URL=http://localhost
LISTEN_ADDR=127.0.0.1:8184
PORT=8184

LOG_DATE_TIME=true
LOG_FILE=$MINIFLUX_LOG
# LOG_FILE=stderr
LOG_FORMAT=text
# LOG_LEVEL= debug | info | warning | error
LOG_LEVEL=debug
EOF

pg_ctl start
$MINIFLUX_EXE -migrate
$MINIFLUX_EXE -create-admin
# Enter Username: adminit
# Enter Password: adminit

pg_ctl stop --mode=smart


# Usage of ./miniflux-v2_git/miniflux-darwin-amd64:
#   -c string
#         Load configuration file
#   -config-dump
#         Print parsed configuration values
#   -config-file string
#         Load configuration file
#   -create-admin
#         Create an admin user from an interactive terminal
#   -debug
#         Show debug logs
#   -export-user-feeds string
#         Export user feeds (provide the username as argument)
#   -flush-sessions
#         Flush all sessions (disconnect users)
#   -healthcheck string
#         Perform a health check on the given endpoint (the value "auto" try to guess the health check endpoint).
#   -i    Show build information
#   -info
#         Show build information
#   -migrate
#         Run SQL migrations
#   -refresh-feeds
#         Refresh a batch of feeds and exit
#   -reset-feed-errors
#         Clear all feed errors for all users
#   -reset-feed-next-check-at
#         Reset the next check time for all feeds
#   -reset-password
#         Reset user password
#   -run-cleanup-tasks
#         Run cleanup tasks (delete old sessions and archives old entries)
#   -v    Show application version
#   -version
#         Show application version
