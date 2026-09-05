#!/bin/sh
. "$(dirname "$0")/../_global/common.sh"

# The bare pnpm image ships pnpm only; Node.js runtimes are installed by pnpm.
pnpm --version

# Both mounted volumes must be writable, and the store must live inside the one at
# PNPM_HOME — that is what makes it survive a rebuild.
test "$PNPM_HOME" = "$HOME/.local/share/pnpm"
test -w "$PNPM_HOME"
test -w "$HOME/.cache/pnpm"
case "$(pnpm store path)" in
  "$PNPM_HOME"/*) ;;
  *) echo "pnpm store is not under PNPM_HOME" >&2; exit 1 ;;
esac

# Install a runtime into the mounted volume to prove the manager works end to end.
pnpm runtime set node lts -g
node --version
node -e 'console.log("ok")'

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
test "$(pnpm exec greeter)" = "ok"
