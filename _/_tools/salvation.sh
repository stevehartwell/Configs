#!/bin/sh

NOSAVE_DIR="/Volumes/NoSave/Users/sh/_"
CONFIG_DIR="/Volumes/NoSave/NAS/_Configs@/_"

mdfind -onlyin "${NOSAVE_DIR}" 'tag:Save/Config'

for item in $(mdfind -onlyin "${NOSAVE_DIR}" 'tag:Save/Config')
do
    [[ -L "${item}" ]] && { echo skipping "${item}"; continue; }
    printf "mv: "
    mv -v -i "${item}" "${CONFIG_DIR}"
    printf "ln: "
    ln -v -i -w -s "${CONFIG_DIR}/$(basename "${item}")" "${item}"
done
