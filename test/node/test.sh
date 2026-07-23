#!/bin/sh
. "$(dirname "$0")/../_global/common.sh"

# The bare node image ships the node binary only (no npm/npx/corepack).
node --version
node -e 'console.log("ok")'
