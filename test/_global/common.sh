# Shared assertions sourced by every test/<template>/test.sh.
set -eux

# Containers must run as the non-root "dev" user.
test "$(id -u)" -ne 0
test "$(id -un)" = "dev"

# Home must exist and be writable (caches, toolchain state).
test -d "$HOME"
test -w "$HOME"

# The image points HISTFILE at a directory it creates; the template mounts a volume there,
# which needs that directory to exist so it belongs to "dev" rather than root.
test "$HISTFILE" = "$HOME/.local/state/bash/history"
test -w "$HOME/.local/state/bash"

# Scratch directory for per-template smoke work.
SMOKE_TMP="$(mktemp -d)"
trap 'rm -rf "$SMOKE_TMP"' EXIT
