#!/bin/sh

source 0:source-env.sh

if [[ ! -d $MINIFLUX_GIT ]]; then
    git clone --depth=1 https://github.com/miniflux/v2.git $MINIFLUX_GIT
else
    cd $MINIFLUX_GIT; git pull
fi
