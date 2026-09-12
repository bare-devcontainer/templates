## Getting Started

See [Getting Started](https://github.com/bare-devcontainer/templates#getting-started) in the repository README for how to apply this template.

## Image Variants

The `imageVariant` option selects the tag of the `ghcr.io/bare-devcontainer/mise` base image, which tracks the Debian release: `trixie` is Debian 13 and `bookworm` is Debian 12.

The values offered when applying the template are proposals, not a closed list — any published tag can be entered, including narrower ones such as a mise version or a dated build for tighter pinning. See the [published tags](https://github.com/orgs/bare-devcontainer/packages/container/package/mise) for what is currently available.

## Security Hardening

This template applies the shared hardening defaults of Bare Dev Container Templates:

- Builds on `ghcr.io/bare-devcontainer/mise`, a minimal image from [bare-devcontainer/images](https://github.com/bare-devcontainer/images) with pinned digests, SLSA provenance, and an SPDX SBOM for supply-chain transparency.
- Runs as the non-root `dev` user.
- Drops all Linux capabilities (`--cap-drop=ALL`) and sets the `no-new-privileges` security option, so processes cannot gain elevated privileges inside the container. Remove `no-new-privileges` from `securityOpt` if you need `su`/`sudo`.
- Starts an init process (`"init": true`) to reap zombie processes.

After applying the template, we recommend pinning the image to a digest so every rebuild uses exactly the image you expect — see [Pinning Images to a Digest](https://github.com/bare-devcontainer/templates#pinning-images-to-a-digest).

## Usage Notes

[mise](https://mise.jdx.dev/) is a polyglot runtime manager. Install and pin the runtimes your project needs, for example:

```sh
mise use node@24
mise use python@3.13
```

The installed runtimes are stored in the persisted data volume, so they remain available after rebuilding the container.

## Persistent Caches

mise's data directory and download cache are persisted in named volumes, so toolchains installed with mise survive container rebuilds and don't need to be re-downloaded. Bash history is persisted the same way, so a rebuild doesn't clear it:

| Volume | Mount path | Purpose |
|--------|------------|---------|
| `${devcontainerId}-mise-data` | `/home/dev/.local/share/mise` | mise-managed toolchains |
| `${devcontainerId}-mise-cache` | `/home/dev/.cache/mise` | mise's download cache |
| `${devcontainerId}-bash-history` | `/home/dev/.local/state/bash` | Bash history file that `HISTFILE` points at |

The image sets `HISTFILE` to `/home/dev/.local/state/bash/history` rather than the default `~/.bash_history`, so bash writes into the volume. It also appends each command as it is entered, so stopping the container to rebuild it keeps the history of open terminals too.

## Tips

- If you use VS Code, uncomment the `remoteEnv` block in `devcontainer.json` to open `$EDITOR`/`$VISUAL`/`$GIT_EDITOR` (e.g. `git commit`) in a VS Code tab.
