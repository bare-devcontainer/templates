#!/bin/sh
. "$(dirname "$0")/../_global/common.sh"

# The bare uv image ships uv only; Python interpreters are installed via uv.
uv --version

# Install a uv-managed interpreter to prove the manager works end to end.
uv python install
uv run python --version
uv run python -c "print('ok')"

# uv's cache lives in a named volume, on a different filesystem than any environment it installs
# into. Installing a package must not warn about falling back from hardlinks to a full copy.
cd "$SMOKE_TMP"
uv venv
uv pip install packaging >"$SMOKE_TMP/install.log" 2>&1
cat "$SMOKE_TMP/install.log"
if grep -qi "hardlink" "$SMOKE_TMP/install.log"; then
  echo "uv fell back from hardlinking; UV_LINK_MODE is not in effect" >&2
  exit 1
fi
