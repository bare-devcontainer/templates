#!/bin/sh
. "$(dirname "$0")/../_global/common.sh"

# The bare pnpm image ships pnpm only; Node.js runtimes are installed by pnpm.
pnpm --version

# Both mount targets must be writable, since everything below is written into them.
test "$PNPM_HOME" = "$HOME/.local/share/pnpm"
test -w "$PNPM_HOME"
test -w "$HOME/.cache/pnpm"

# cacheDir follows XDG_CACHE_HOME, so the mount target can drift from the directory pnpm
# actually caches into, leaving the volume empty while the mount itself still looks fine.
cache_dir="$(pnpm cache path)"
case "$cache_dir" in
  "$HOME/.cache/pnpm"|"$HOME/.cache/pnpm"/*) ;;
  *) echo "pnpm cache resolved outside the persisted volume: $cache_dir" >&2; exit 1 ;;
esac

# pnpm places its store wherever hard links work, so where it lands depends on the
# filesystems in play rather than on this template. Record it instead of asserting it.
echo "pnpm store path: $(pnpm store path)"

# The runtime is the expensive thing the PNPM_HOME volume exists to keep, so it has to
# land inside that volume rather than in a container layer thrown away on rebuild.
pnpm runtime set node lts -g
node --version
node -e 'console.log("ok")'
node_bin="$(command -v node)"
case "$node_bin" in
  "$PNPM_HOME"/*) ;;
  *) echo "node resolved outside the persisted volume: $node_bin" >&2; exit 1 ;;
esac

# Install and run a dependency, to prove pnpm drives a project with the volumes in place.
# The dependency is authored here rather than pulled from the registry, to keep this smoke
# test off the npm supply chain.
mkdir -p "$SMOKE_TMP/greeter" "$SMOKE_TMP/project"
cat > "$SMOKE_TMP/greeter/package.json" <<'JSON'
{
  "name": "greeter",
  "version": "1.0.0",
  "bin": { "greeter": "./cli.js" }
}
JSON
cat > "$SMOKE_TMP/greeter/cli.js" <<'JS'
#!/usr/bin/env node
console.log("ok");
JS
chmod +x "$SMOKE_TMP/greeter/cli.js"
cat > "$SMOKE_TMP/project/package.json" <<'JSON'
{
  "name": "smoke",
  "version": "1.0.0",
  "private": true
}
JSON

cd "$SMOKE_TMP/project" || exit 1
pnpm add ../greeter
greeting="$(pnpm exec greeter)"
test "$greeting" = "ok" || { echo "unexpected output: $greeting" >&2; exit 1; }
