#!/bin/sh
. "$(dirname "$0")/../_global/common.sh"

rustup --version

# The template mounts a volume at ~/.rustup, which needs the directory to exist in
# the image so it belongs to "dev" rather than root.
test -w "$HOME/.rustup"

# With no rust-toolchain.toml in the workspace, postCreateCommand installs stable
# with the components rust-analyzer needs and makes it the default.
rustup default | grep -q '^stable-'
installed="$(rustup component list --installed)"
for component in clippy rustfmt rust-analyzer rust-src; do
  echo "$installed" | grep -q "^${component}"
done
rustc --version
cargo --version
cargo clippy --version
cargo fmt --version
rust-analyzer --version

# Compile and run a program without touching the cargo registry.
cd "$SMOKE_TMP" || exit 1
printf 'fn main() { println!("ok"); }\n' > main.rs
rustc -o smoke main.rs
./smoke
