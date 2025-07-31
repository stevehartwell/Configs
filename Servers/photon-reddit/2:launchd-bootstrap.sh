#!/bin/sh

set -e

source 0:.env.sh

if [[ ! -f "${LAUNCHAGENTS_DIR}/${LAUNCHCTL_PLIST}" ]]
then
    chflags nouchg "${LAUNCHAGENTS_DIR}"
    trap 'chflags uchg "${LAUNCHAGENTS_DIR}"' EXIT

    cp -f "${LAUNCHCTL_PLIST}" "${LAUNCHAGENTS_DIR}"
    chmod u=r,go= "${LAUNCHAGENTS_DIR}/${LAUNCHCTL_PLIST}"

    launchctl bootstrap \
        "user/$(id -u)" \
        "${LAUNCHAGENTS_DIR}/${LAUNCHCTL_PLIST}"
fi

