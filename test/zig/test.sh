#!/bin/sh
. "$(dirname "$0")/common.sh"

# zig may live at /usr/local/zig without being on PATH.
zig version || /usr/local/zig/zig version
zls --version
