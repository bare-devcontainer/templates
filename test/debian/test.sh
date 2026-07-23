#!/bin/sh
. "$(dirname "$0")/common.sh"

. /etc/os-release
test "$ID" = "debian"

dpkg --version
apt-get --version
