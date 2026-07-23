#!/bin/sh
. "$(dirname "$0")/../_global/common.sh"

deno --version
deno eval 'console.log("ok")'
