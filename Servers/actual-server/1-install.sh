#!/bin/sh

set -e

source 0:.env.sh

npm install @actual-app/sync-server

chflags nouchg "${LAUNCHAGENTS_DIR}"
trap 'chflags uchg "${LAUNCHAGENTS_DIR}"' EXIT

cp -f "${LAUNCHCTL_PLIST}" "${LAUNCHAGENTS_DIR}"
chmod u=r,go= "${LAUNCHAGENTS_DIR}/${LAUNCHCTL_PLIST}"
