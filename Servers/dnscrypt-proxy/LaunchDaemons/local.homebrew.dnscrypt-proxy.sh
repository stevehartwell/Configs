#!/bin/sh

LOGDIR="/Library/Logs/Homebrew/dnscrypt-proxy"
DNSCRYPT_PROXY="/usr/local/opt/dnscrypt-proxy/sbin/dnscrypt-proxy"

mkdir -p "${LOGDIR}"
chmod a+rX "${LOGDIR}"

echo $0: $(date) "$@"

# launchctl may run this before the network interfaces are "up"
# MacAdmins say that a sleep 5 before the "ipconfig waitall" is needed.
#
/bin/sleep 5
/usr/sbin/ipconfig waitall

## while true; do
 	exec "${DNSCRYPT_PROXY}" "$@"
## 	echo dnscrypt-proxy EXIT: $(date) > "${LOGDIR}/launchctl-err.log"
## 	sleep 10
## done
## sleep 99999
