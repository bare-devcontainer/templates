#!/bin/sh
. "$(dirname "$0")/../_global/common.sh"

bun --version
bun -e 'console.log("ok")'
