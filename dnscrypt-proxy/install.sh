#!/bin/sh

DEST_LIB=/Library/LaunchDaemons
DEST_ETC=/usr/local/etc/dnscrypt-proxy

cp -X LaunchDaemons/local.homebrew.dnscrypt-proxy.plist "$DEST_LIB"/

mkdir -p "$DEST_ETC"

cp -X dnscrypt-proxy.toml \
    allowed-names.txt blocked-names.txt \
    LaunchDaemons/local.homebrew.dnscrypt-proxy.sh \
    "$DEST_ETC"/
