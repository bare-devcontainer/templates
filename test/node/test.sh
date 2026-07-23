#!/bin/sh
. "$(dirname "$0")/common.sh"

node --version
npm --version
node -e 'console.log("ok")'
npx --yes tsc --version
