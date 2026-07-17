
# Zig (zig)

Security-focused Zig dev container with zls integration and a persistent build cache.

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| imageVariant | Zig version and Debian version | string | 0.16-trixie |

## Base Image

This template builds on `ghcr.io/bare-devcontainer/zig`, a minimal Debian-based image from [bare-devcontainer/images](https://github.com/bare-devcontainer/images) that ships the Zig toolchain and the Zig Language Server (`zls`), installing only what that stack needs from official upstreams, with pinned digests, SLSA provenance, and an SPDX SBOM for supply-chain transparency.

## Security Hardening

This template applies the shared hardening defaults of Bare Dev Container Templates:

- Runs as the non-root `dev` user.
- Drops all Linux capabilities (`--cap-drop=ALL`) and sets the `no-new-privileges` security option, so processes cannot gain elevated privileges inside the container. Remove `no-new-privileges` from `securityOpt` if you need `su`/`sudo`.
- Starts an init process (`"init": true`) to reap zombie processes.

After applying the template, we recommend pinning the image to a digest so every rebuild uses exactly the image you expect — see [Pinning Images to a Digest](https://github.com/bare-devcontainer/templates#pinning-images-to-a-digest).

## Persistent Caches

The Zig global cache is persisted in a named volume, so rebuilding the container to pick up image updates doesn't require re-downloading packages or recompiling dependencies:

| Volume | Mount path | Purpose |
|--------|------------|---------|
| `${devcontainerId}-zig-global-cache` | `/home/dev/.cache/zig` | Zig global cache |

## Editor Integration

- Installs the `ziglang.vscode-zig` VS Code extension, with the `zig` and `zls` paths preconfigured to the binaries shipped in the image and the Zig Language Server (zls) enabled.

## Tips

- To use the debugger, uncomment `"capAdd": ["SYS_PTRACE"]` in `devcontainer.json`.
- If you use VS Code, uncomment the `remoteEnv` block in `devcontainer.json` to open `$EDITOR`/`$VISUAL`/`$GIT_EDITOR` (e.g. `git commit`) in a VS Code tab.


---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/bare-devcontainer/templates/blob/main/src/zig/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
