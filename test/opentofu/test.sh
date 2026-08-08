#!/bin/sh
. "$(dirname "$0")/../_global/common.sh"

tofu version
tofu-ls version

# The plugin cache directory is mounted as a volume, so it must be writable.
test -w "$TF_PLUGIN_CACHE_DIR"

# Validate a provider-less config so everything stays offline.
cd "$SMOKE_TMP" || exit 1
printf 'output "ok" {\n  value = "ok"\n}\n' > main.tf
tofu fmt -check
tofu init -backend=false
tofu validate
