

PROXY_BIN  := /usr/local/sbin/dnscrypt-proxy
CONFIG_DIR := /usr/local/etc
##DAEMON_DIR := /Library/LaunchDaemons

AUX_DIRS := \
	/Library/Caches/Homebrew/dnscrypt-proxy \
	/Library/Logs/Homebrew/dnscrypt-proxy

INSTALL_BLOCKLIST := domains-blocklist-blocked-names@.txt

INSTALL_CONFIG := $(CONFIG_DIR)/dnscrypt-proxy.toml

install: $(INSTALL_BLOCKLIST) | $(PROXY_BIN) $(INSTALL_CONFIG) $(AUX_DIRS)

$(PROXY_BIN):
	brew install dnscrypt-proxy

$(INSTALL_CONFIG):
	ln -s "${PWD}/dnscrypt-proxy@.toml" $@

$(AUX_DIRS):
	sudo mkdir -p $@ && sudo chown -R adminit $@

BLOCKLIST_FILES := \
	domains-blocklist-allowed-names@.txt \
	domains-blocklist@.conf

$(INSTALL_BLOCKLIST): $(BLOCKLIST_FILES)
	sh -x generate-domains-blocklist@.sh
