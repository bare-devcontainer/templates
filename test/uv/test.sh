#!/bin/sh
. "$(dirname "$0")/../_global/common.sh"

# The bare uv image ships uv only; Python interpreters are installed via uv.
uv --version

# Install a uv-managed interpreter to prove the manager works end to end.
uv python install
uv run python --version
uv run python -c "print('ok')"
