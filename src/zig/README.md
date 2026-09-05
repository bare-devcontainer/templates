
# Zig (zig)

Security-focused Zig dev container with zls integration and a persistent build cache.

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| imageVariant | Zig and Debian version (trixie = Debian 13, bookworm = Debian 12). Other published tags can be entered. | string | 0.16-trixie |

## Getting Started

See [Getting Started](https://github.com/bare-devcontainer/templates#getting-started) in the repository README for how to apply this template.

## Image Variants

The `imageVariant` option selects the tag of the `ghcr.io/bare-devcontainer/zig` base image, which pairs a Zig version with a Debian release: `trixie` is Debian 13 and `bookworm` is Debian 12.

`master-trixie` tracks Zig's master branch rather than a release: it carries the master build ziglang.org currently publishes together with the matching zls build, is refreshed daily, and is published for `trixie` only. An unpinned master tag therefore moves under you, so pin the image to a digest when you need a reproducible toolchain.

The values offered when applying the template are proposals, not a closed list — any published tag can be entered, including narrower ones such as a Zig patch version or a dated build for tighter pinning. See the [published tags](https://github.com/orgs/bare-devcontainer/packages/container/package/zig) for what is currently available.

## Security Hardening

This template applies the shared hardening defaults of Bare Dev Container Templates:

- Builds on `ghcr.io/bare-devcontainer/zig`, a minimal image from [bare-devcontainer/images](https://github.com/bare-devcontainer/images) with pinned digests, SLSA provenance, and an SPDX SBOM for supply-chain transparency.
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
- Forks of VS Code (Cursor, Windsurf, VSCodium, code-server) read the same `customizations.vscode` block, but resolve extension IDs against [Open VSX](https://open-vsx.org/) rather than the Visual Studio Marketplace, where availability depends on the publisher having opted in.
- Editors without dev container integration (Neovim, Helix, Emacs, ...) can attach to the running container with `devcontainer exec --workspace-folder . <command>` and use the tooling in the image directly: `zls` at `/usr/local/bin/zls` and `zig` at `/usr/local/zig/zig`.

## Tips

- To use the debugger, uncomment `"capAdd": ["SYS_PTRACE"]` in `devcontainer.json`.
- If you use VS Code, uncomment the `remoteEnv` block in `devcontainer.json` to open `$EDITOR`/`$VISUAL`/`$GIT_EDITOR` (e.g. `git commit`) in a VS Code tab.


---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/bare-devcontainer/templates/blob/main/src/zig/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
