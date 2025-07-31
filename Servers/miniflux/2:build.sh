#!/bin/sh

set -e

source 0:source-env.sh

export GOPATH="$PWD/go"

cd $MINIFLUX_GIT
make darwin-amd64
mkdir -p $GOPATH/bin
mv miniflux-darwin-amd64 $GOPATH/bin/miniflux
