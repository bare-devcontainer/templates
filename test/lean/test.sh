#!/bin/sh
. "$(dirname "$0")/../_global/common.sh"

# The bare lean image ships elan only; users install their own toolchain.
elan --version
elan toolchain list

# The template mounts volumes at ~/.elan/toolchains and ~/.cache/mathlib, which need
# the directories to exist in the image so they belong to "dev" rather than root.
test -w "$HOME/.elan/toolchains"
test -w "$HOME/.cache/mathlib"

# Install the stable toolchain to prove the manager works end to end, then run a
# program without fetching any Lake dependency.
elan toolchain install stable
elan default stable
lean --version
lake --version

cd "$SMOKE_TMP" || exit 1
printf 'def main : IO Unit := IO.println "ok"\n' > Main.lean
lean --run Main.lean
