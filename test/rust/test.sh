#!/bin/sh
. "$(dirname "$0")/common.sh"

rustc --version
cargo --version
rust-analyzer --version

# Compile and run a program without touching the network or cargo registry.
cd "$SMOKE_TMP" || exit 1
printf 'fn main() { println!("ok"); }\n' > main.rs
rustc -o smoke main.rs
./smoke
