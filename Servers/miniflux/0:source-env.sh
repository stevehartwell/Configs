#!/bin/sh

MINIFLUX_GIT=./miniflux-v2_git
MINIFLUX_CONF=./miniflux.conf
MINIFLUX_LOG=$HOME/Library/Logs/miniflux.log
MINIFLUX_EXE="./go/bin/miniflux -config-file $MINIFLUX_CONF"
MINIFLUX_PIDFILE=./miniflux.pid

export PGDATA="$PWD/miniflux-pgdb/"
MINIFLUX_DB_USER=miniflux
MINIFLUX_DB_PASSWD=miniflux
MINIFLUX_DB_NAME=miniflux

