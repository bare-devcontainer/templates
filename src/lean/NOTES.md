## Getting Started

See [Getting Started](https://github.com/bare-devcontainer/templates#getting-started) in the repository README for how to apply this template.

## Image Variants

The `imageVariant` option selects the tag of the `ghcr.io/bare-devcontainer/lean` base image, which tracks the Debian release: `trixie` is Debian 13 and `bookworm` is Debian 12.

The values offered when applying the template are proposals, not a closed list — any published tag can be entered, including narrower ones such as an elan version or a dated build for tighter pinning. See the [published tags](https://github.com/orgs/bare-devcontainer/packages/container/package/lean) for what is currently available.

## Security Hardening

This template applies the shared hardening defaults of Bare Dev Container Templates:

- Builds on `ghcr.io/bare-devcontainer/lean`, a minimal image from [bare-devcontainer/images](https://github.com/bare-devcontainer/images) with pinned digests, SLSA provenance, and an SPDX SBOM for supply-chain transparency.
- Runs as the non-root `dev` user.
- Drops all Linux capabilities (`--cap-drop=ALL`) and sets the `no-new-privileges` security option, so processes cannot gain elevated privileges inside the container. Remove `no-new-privileges` from `securityOpt` if you need `su`/`sudo`.
- Starts an init process (`"init": true`) to reap zombie processes.

After applying the template, we recommend pinning the image to a digest so every rebuild uses exactly the image you expect — see [Pinning Images to a Digest](https://github.com/bare-devcontainer/templates#pinning-images-to-a-digest).

## Usage Notes

The image ships no Lean toolchain, only the toolchain manager `elan`. A toolchain pinned in `lean-toolchain` is installed on the first `lean` or `lake` run; otherwise, install one with `elan default stable`.

A project depending on Mathlib can download its prebuilt files with `lake exe cache get` instead of compiling Mathlib locally.

## Persistent Caches

Installed toolchains and Mathlib's download cache are persisted in named volumes, so rebuilding the container to pick up image updates doesn't require re-downloading them. Bash history is persisted the same way, so a rebuild doesn't clear it:

| Volume | Mount path | Purpose |
|--------|------------|---------|
| `${devcontainerId}-lean-elan-toolchains` | `/home/dev/.elan/toolchains` | Installed toolchains |
| `${devcontainerId}-lean-mathlib-cache` | `/home/dev/.cache/mathlib` | Prebuilt Mathlib files downloaded by `lake exe cache get` |
| `${devcontainerId}-bash-history` | `/home/dev/.local/state/bash` | Bash history file that `HISTFILE` points at |

A rebuild keeps the toolchains as they are, so it neither updates them nor discards changes made to them from inside the container, for example by a build script. To download them afresh on every rebuild, remove the `/home/dev/.elan/toolchains` mount.

Only the toolchains are persisted, not all of `~/.elan`: `~/.elan/bin` holds `elan` itself, which a rebuild replaces with the one in the updated image. The default toolchain set with `elan default` is stored outside the volume as well, so set it again after a rebuild; a project's `lean-toolchain` is unaffected.

Each project's Lake dependencies and build outputs live in its own `.lake` directory, inside the workspace, so they survive a rebuild without a volume.

The image sets `HISTFILE` to `/home/dev/.local/state/bash/history` rather than the default `~/.bash_history`, so bash writes into the volume.

## Editor Integration

- Installs the official `leanprover.lean4` VS Code extension, which runs the Lean language server of the toolchain the project pins.
- Forks of VS Code (Cursor, Windsurf, VSCodium, code-server) read the same `customizations.vscode` block, but resolve extension IDs against [Open VSX](https://open-vsx.org/) rather than the Visual Studio Marketplace, where availability depends on the publisher having opted in.
- Editors without dev container integration (Neovim, Helix, Emacs, ...) can attach to the running container with `devcontainer exec --workspace-folder . <command>` and use the tooling in the image directly. The language server is started with `lake serve`, which resolves through `/home/dev/.elan/bin`, which is on `PATH`.

## Tips

- To use the debugger, uncomment `"capAdd": ["SYS_PTRACE"]` in `devcontainer.json`.
- If you use VS Code, uncomment the `remoteEnv` block in `devcontainer.json` to open `$EDITOR`/`$VISUAL`/`$GIT_EDITOR` (e.g. `git commit`) in a VS Code tab.
- To add a directory to `PATH` through `remoteEnv`, keep `/home/dev/.elan/bin` in the value, as in `"PATH": "/home/dev/.elan/bin:<your-dir>:${containerEnv:PATH}"`. The image puts `/home/dev/.elan/bin` on `PATH` through a `remoteEnv` entry of its own, which a `PATH` set in `devcontainer.json` replaces rather than extends.
