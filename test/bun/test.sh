#!/bin/sh
. "$(dirname "$0")/common.sh"

bun --version
bun -e 'console.log("ok")'
