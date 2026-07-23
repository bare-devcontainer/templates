#!/bin/sh
. "$(dirname "$0")/common.sh"

deno --version
deno eval 'console.log("ok")'
