#!/bin/sh

set -e

source 0:.env.sh

launchctl bootstrap "user/$(id -u)" "${LAUNCHAGENTS_DIR}/${LAUNCHCTL_PLIST}"
