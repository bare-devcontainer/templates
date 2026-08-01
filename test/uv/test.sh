#!/bin/sh
. "$(dirname "$0")/../_global/common.sh"

# The bare uv image ships uv only; Python interpreters are installed via uv.
uv --version

# Install a uv-managed interpreter to prove the manager works end to end.
uv python install
uv run python --version
uv run python -c "print('ok')"

# The cache volume and the workspace bind mount are different filesystems, so uv must copy
# instead of falling back from hardlinking with a warning on every install.
test "${UV_LINK_MODE}" = "copy"
