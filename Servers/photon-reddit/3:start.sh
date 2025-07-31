#!/bin/sh

set -e

source 0:.env.sh

launchctl start ${LAUNCHCTL_LABEL}
