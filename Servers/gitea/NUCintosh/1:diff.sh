#!/bin/sh

ORIG='/usr/local/Cellar/gitea/1.23.4/homebrew.mxcl.gitea.plist'

diff --context=1 "$ORIG" ./homebrew.shh.gitea.plist
