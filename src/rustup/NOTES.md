## Getting Started

See [Getting Started](https://github.com/bare-devcontainer/templates#getting-started) in the repository README for how to apply this template.

## Image Variants

The `imageVariant` option selects the tag of the `ghcr.io/bare-devcontainer/rustup` base image, which tracks the Debian release: `trixie` is Debian 13 and `bookworm` is Debian 12.

The values offered when applying the template are proposals, not a closed list — any published tag can be entered, including narrower ones such as a rustup version or a dated build for tighter pinning. See the [published tags](https://github.com/orgs/bare-devcontainer/packages/container/package/rustup) for what is currently available.

## Security Hardening

This template applies the shared hardening defaults of Bare Dev Container Templates:

- Builds on `ghcr.io/bare-devcontainer/rustup`, a minimal image from [bare-devcontainer/images](https://github.com/bare-devcontainer/images) with pinned digests, SLSA provenance, and an SPDX SBOM for supply-chain transparency.
- Runs as the non-root `dev` user.
- Drops all Linux capabilities (`--cap-drop=ALL`) and sets the `no-new-privileges` security option, so processes cannot gain elevated privileges inside the container. Remove `no-new-privileges` from `securityOpt` if you need `su`/`sudo`.
- Starts an init process (`"init": true`) to reap zombie processes.

After applying the template, we recommend pinning the image to a digest so every rebuild uses exactly the image you expect — see [Pinning Images to a Digest](https://github.com/bare-devcontainer/templates#pinning-images-to-a-digest).

## Usage Notes

The image ships `rustup` without a Rust toolchain, and `postCreateCommand` installs one when the container is created:

- If the project pins a toolchain in `rust-toolchain.toml`, that toolchain is installed, with the profile and components the file names.
- Otherwise, stable is installed with the `minimal` profile plus `clippy`, `rustfmt`, and `rust-analyzer`, and set as the default. The `minimal` profile leaves out the offline documentation (`rust-docs`), which is most of the size of the `default` profile.
- Either way, `rust-src` is added, which rust-analyzer needs to resolve the standard library.

`postCreateCommand` passes `--no-self-update`, so the `rustup` binary stays the one the image verified at build time. `rustup update` updates `rustup` itself as well; run `rustup update --no-self-update` instead to update toolchains only.

## Persistent Caches

Installed toolchains and Cargo's registry and git caches are persisted in named volumes, so rebuilding the container to pick up image updates doesn't require re-downloading toolchains or crates. Bash history is persisted the same way, so a rebuild doesn't clear it:

| Volume | Mount path | Purpose |
|--------|------------|---------|
| `${devcontainerId}-rustup-home` | `/home/dev/.rustup` | Installed toolchains and rustup settings |
| `${devcontainerId}-rustup-cargo-registry` | `/home/dev/.cargo/registry` | Cargo registry cache |
| `${devcontainerId}-rustup-cargo-git` | `/home/dev/.cargo/git` | Cargo's cache of git-sourced dependencies |
| `${devcontainerId}-bash-history` | `/home/dev/.local/state/bash` | Bash history file that `HISTFILE` points at |

Because the toolchains live in a volume, a rebuild keeps them as they are:

- A rebuild does not reset the toolchains. Anything that runs in the container as `dev`, such as a build script or a procedural macro, can modify them, and a modification persists until the volume is removed. Remove the `/home/dev/.rustup` mount from `devcontainer.json` to have every rebuild download them afresh.
- A rebuild re-runs `postCreateCommand`, which updates only the toolchain the project pins or the default. Run `rustup update --no-self-update` to update the others.
- Toolchains no longer in use stay in the volume until removed with `rustup toolchain uninstall <toolchain>`.
- Rustup settings, such as the default toolchain, are kept in the volume too, so changes the image makes to `~/.rustup` do not reach an existing volume.

`~/.cargo/bin` stays in the image layer, which holds `rustup` and its `cargo`/`rustc` proxies, so a rebuild picks up the `rustup` of the new image; binaries installed there with `cargo install` do not survive a rebuild.

The image sets `HISTFILE` to `/home/dev/.local/state/bash/history` rather than the default `~/.bash_history`, so bash writes into the volume.

## Editor Integration

- Installs the `rust-lang.rust-analyzer` VS Code extension, with format-on-save enabled for Rust files.
- Installs `tamasfe.even-better-toml` for completion and validation in `Cargo.toml` and `rust-toolchain.toml`.
- Installs `vadimcn.vscode-lldb` (CodeLLDB) for debugging; it bundles its own LLDB, so the image needs no debugger. Debugging also needs `SYS_PTRACE`, see [Tips](#tips).
- Forks of VS Code (Cursor, Windsurf, VSCodium, code-server) read the same `customizations.vscode` block, but resolve extension IDs against [Open VSX](https://open-vsx.org/) rather than the Visual Studio Marketplace, where availability depends on the publisher having opted in.
- Editors without dev container integration (Neovim, Helix, Emacs, ...) can attach to the running container with `devcontainer exec --workspace-folder . <command>` and use the tooling in the image directly. The `rust-analyzer` component that `postCreateCommand` installs with stable resolves through `/home/dev/.cargo/bin`, which is on `PATH`; for a toolchain pinned in `rust-toolchain.toml`, list `rust-analyzer` in its `components` or add it with `rustup component add rust-analyzer`.

## Tips

- To use the debugger, uncomment `"capAdd": ["SYS_PTRACE"]` in `devcontainer.json`.
- To start over with fresh toolchains, remove the `<id>-rustup-home` volume (`docker volume ls` lists it) while the container is stopped, then rebuild.
- If you use VS Code, uncomment the `remoteEnv` block in `devcontainer.json` to open `$EDITOR`/`$VISUAL`/`$GIT_EDITOR` (e.g. `git commit`) in a VS Code tab.
- To add a directory to `PATH` through `remoteEnv`, keep `/home/dev/.cargo/bin` in the value, as in `"PATH": "/home/dev/.cargo/bin:<your-dir>:${containerEnv:PATH}"`. The image puts `/home/dev/.cargo/bin` on `PATH` through a `remoteEnv` entry of its own, which a `PATH` set in `devcontainer.json` replaces rather than extends.
