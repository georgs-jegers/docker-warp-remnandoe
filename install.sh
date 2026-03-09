#!/bin/bash
#
# Docker WARP Native — Bootstrap Installer
#

set -euo pipefail

SCRIPT_URL="https://raw.githubusercontent.com/georgs-jegers/docker-warp-remnandoe/main/installer/install_warp.sh"

tmpfile=$(mktemp /tmp/install_warp.XXXXXX.sh)
trap 'rm -f "$tmpfile"' EXIT

if ! curl -fsSL "$SCRIPT_URL" -o "$tmpfile"; then
    echo "Error: failed to download installer from $SCRIPT_URL" >&2
    exit 1
fi

exec bash "$tmpfile" "$@"
