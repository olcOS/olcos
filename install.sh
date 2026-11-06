#!/bin/bash
# olcOS server installer. The installer itself lives next to the code it installs, in
# https://github.com/olcOS/olcos-ios (scripts/install.sh); this stub fetches the current one and runs it,
# so this repository never holds a second copy that could drift. Settings are the same environment
# variables (OLCOS_NAME, OLCOS_HOST, OLCOS_CARRIER, OLCOS_TRANSPORT, ...), described in that script.
#
#   curl -fsSL https://raw.githubusercontent.com/olcOS/olcos/main/install.sh | sudo bash
set -euo pipefail

URL="https://raw.githubusercontent.com/olcOS/olcos-ios/main/scripts/install.sh"
TMP="$(mktemp)"
trap 'rm -f "$TMP"' EXIT

curl -fsSL "$URL" -o "$TMP"
# A page that is not a shell script (an error page, a captive portal) must not run as root.
head -n 1 "$TMP" | grep -q '^#!.*\(ba\)\?sh' || { echo "olcOS: the installer could not be fetched from $URL" >&2; exit 1; }
exec bash "$TMP" "$@"
