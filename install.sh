#!/bin/bash
# olcOS server installer. The installer lives in olcOS/olcos-core (server/install.sh), next to the
# server script and the agent it installs. This stub runs the installer of one tested core commit and
# has it fetch its files from the same commit, so the command below always installs one known version.
# Settings are environment variables (OLCOS_NAME, OLCOS_CARRIER, OLCOS_TRANSPORT, OLCOS_VP8_FPS,
# OLCOS_VP8_BATCH, OLCOS_JITSI_URL, ...), described at the top of that script.
#
#   curl -fsSL https://raw.githubusercontent.com/olcOS/olcos/main/install.sh | sudo bash
set -euo pipefail

CORE_COMMIT="fbce2389845f1359ae3814d126ad1cf2486f89ae"
SOURCE="https://raw.githubusercontent.com/olcOS/olcos-core/$CORE_COMMIT"
URL="$SOURCE/server/install.sh"
TMP="$(mktemp)"
trap 'rm -f "$TMP"' EXIT

curl -fsSL "$URL" -o "$TMP" || { echo "olcOS: the installer could not be fetched from $URL" >&2; exit 1; }
# A page that is not a shell script (an error page, a captive portal) must not run as root.
head -n 1 "$TMP" | grep -q '^#!.*\(ba\)\?sh' || { echo "olcOS: the installer could not be fetched from $URL" >&2; exit 1; }
OLCOS_SOURCE="${OLCOS_SOURCE:-$SOURCE}" bash "$TMP" "$@" < /dev/null
