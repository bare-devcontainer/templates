#!/bin/sh
. "$(dirname "$0")/common.sh"

uv --version
python --version
uv run python -c "print('ok')"
