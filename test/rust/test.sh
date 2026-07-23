#!/bin/sh
. "$(dirname "$0")/../_global/common.sh"

# The bare rust image ships rustup only; users install their own toolchain.
rustup --version
rustup toolchain list

# Install a minimal stable toolchain to prove the manager works end to end,
# then compile and run a program without touching the cargo registry.
rustup toolchain install stable --profile minimal
rustup default stable
rustc --version
cargo --version

cd "$SMOKE_TMP" || exit 1
printf 'fn main() { println!("ok"); }\n' > main.rs
rustc -o smoke main.rs
./smoke
