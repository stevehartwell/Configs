#!/bin/sh

set -e

./:NoSave@/src/utils/generate-domains-blocklist/generate-domains-blocklist.py \
    --config domains-blocklist@.conf \
    --allowlist domains-blocklist-allowed-names@.txt \
    --time-restricted /dev/null \
    --output-file domains-blocklist-output.txt

mv domains-blocklist-output.txt ./:NoSave@/domains-blocklist-blocked-names.txt

# % ./generate-domains-blocklist.py --help
# usage: generate-domains-blocklist.py [-h] [-c CONFIG] [-a ALLOWLIST] [-r TIME_RESTRICTED] [-i]
#                                      [-o OUTPUT_FILE] [-t TIMEOUT]

# Create a unified blocklist from a set of local and remote files

# options:
#   -h, --help            show this help message and exit
#   -c CONFIG, --config CONFIG
#                         file containing blocklist sources
#   -a ALLOWLIST, --allowlist ALLOWLIST
#                         file containing a set of names to exclude from the blocklist
#   -r TIME_RESTRICTED, --time-restricted TIME_RESTRICTED
#                         file containing a set of names to be time restricted
#   -i, --ignore-retrieval-failure
#                         generate list even if some urls couldn't be retrieved
#   -o OUTPUT_FILE, --output-file OUTPUT_FILE
#                         save generated blocklist to a text file with the provided file name
#   -t TIMEOUT, --timeout TIMEOUT
#                         URL open timeout
