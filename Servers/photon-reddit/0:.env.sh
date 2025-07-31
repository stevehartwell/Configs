#!/bin/sh

# These are used by photon-reddit
APP_ID=CFUVye8_LSx2BVOwpemTBw
PORT=8189
REDIRECT_URI=http://localhost:8189/redirect

# These are used only by run scripts
LAUNCHCTL_LABEL=local.shh.photon-reddit
LAUNCHCTL_PLIST="${LAUNCHCTL_LABEL}.plist"
LAUNCHAGENTS_DIR="$HOME/Library/LaunchAgents"
