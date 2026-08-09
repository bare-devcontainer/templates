
# Go (golang)

Security-focused Go dev container with hardened defaults and rebuild-friendly caches.

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| imageVariant | Go and Debian version (trixie = Debian 13, bookworm = Debian 12). Other published tags can be entered. | string | 1.26-trixie |

## Getting Started

See [Getting Started](https://github.com/bare-devcontainer/templates#getting-started) in the repository README for how to apply this template.

## Image Variants

The `imageVariant` option selects the tag of the `ghcr.io/bare-devcontainer/golang` base image, which pairs a Go version with a Debian release: `trixie` is Debian 13 and `bookworm` is Debian 12.

The values offered when applying the template are proposals, not a closed list — any published tag can be entered, including narrower ones such as a Go patch version or a dated build for tighter pinning. See the [published tags](https://github.com/orgs/bare-devcontainer/packages/container/package/golang) for what is currently available.

## Security Hardening

This template applies the shared hardening defaults of Bare Dev Container Templates:

- Builds on `ghcr.io/bare-devcontainer/golang`, a minimal image from [bare-devcontainer/images](https://github.com/bare-devcontainer/images) with pinned digests, SLSA provenance, and an SPDX SBOM for supply-chain transparency.
- Runs as the non-root `dev` user.
- Drops all Linux capabilities (`--cap-drop=ALL`) and sets the `no-new-privileges` security option, so processes cannot gain elevated privileges inside the container. Remove `no-new-privileges` from `securityOpt` if you need `su`/`sudo`.
- Starts an init process (`"init": true`) to reap zombie processes.

After applying the template, we recommend pinning the image to a digest so every rebuild uses exactly the image you expect — see [Pinning Images to a Digest](https://github.com/bare-devcontainer/templates#pinning-images-to-a-digest).

## Persistent Caches

The Go module and build caches are persisted in named volumes, so rebuilding the container to pick up image updates doesn't require re-downloading modules or recompiling packages:

| Volume | Mount path | Purpose |
|--------|------------|---------|
| `${devcontainerId}-golang-pkg-mod` | `/home/dev/go/pkg/mod` | Go module cache (`GOMODCACHE`) |
| `${devcontainerId}-golang-build-cache` | `/home/dev/.cache/go-build` | Go build cache (`GOCACHE`) |

## Editor Integration

- Installs the `golang.go` VS Code extension, with format-on-save and organize-imports enabled for Go files and gopls semantic tokens turned on.
- Automatic updates of the Go tools are disabled (`go.toolsManagement.autoUpdate: false`, update checks are local only), so the editor does not download tools behind your back.
- Zed needs no extension for Go and resolves `gopls` from the image's `PATH` instead of downloading its own. The bundled `.zed/settings.json` runs organize-imports on format, matching the VS Code settings above.

## Tips

- To use the debugger (delve), uncomment `"capAdd": ["SYS_PTRACE"]` in `devcontainer.json`.
- If you use VS Code, uncomment the `remoteEnv` block in `devcontainer.json` to open `$EDITOR`/`$VISUAL`/`$GIT_EDITOR` (e.g. `git commit`) in a VS Code tab.


---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/bare-devcontainer/templates/blob/main/src/golang/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
