
# mise (mise)

Security-focused mise dev container for multiple runtimes, with rebuild-friendly caches.

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| imageVariant | Debian version | string | trixie |

## Base Image

This template builds on `ghcr.io/bare-devcontainer/mise`, a minimal Debian-based image from [bare-devcontainer/images](https://github.com/bare-devcontainer/images) that ships the [mise](https://mise.jdx.dev/) runtime manager (no language runtime is preinstalled) and installs only what that stack needs from official upstreams, with pinned digests, SLSA provenance, and an SPDX SBOM for supply-chain transparency.

## Security Hardening

This template applies the shared hardening defaults of Bare Dev Container Templates:

- Runs as the non-root `dev` user.
- Drops all Linux capabilities (`--cap-drop=ALL`) and sets the `no-new-privileges` security option, so processes cannot gain elevated privileges inside the container. Remove `no-new-privileges` from `securityOpt` if you need `su`/`sudo`.
- Starts an init process (`"init": true`) to reap zombie processes.

After applying the template, we recommend pinning the image to a digest so every rebuild uses exactly the image you expect — see [Pinning Images to a Digest](https://github.com/bare-devcontainer/templates#pinning-images-to-a-digest).

## Persistent Caches

mise's data directory and download cache are persisted in named volumes, so toolchains installed with mise survive container rebuilds and don't need to be re-downloaded:

| Volume | Mount path | Purpose |
|--------|------------|---------|
| `${devcontainerId}-mise-data` | `/home/dev/.local/share/mise` | mise-managed toolchains |
| `${devcontainerId}-mise-cache` | `/home/dev/.cache/mise` | mise's download cache |

## Usage Notes

[mise](https://mise.jdx.dev/) is a polyglot runtime manager. Install and pin the runtimes your project needs, for example:

```sh
mise use node@24
mise use python@3.13
```

The installed runtimes are stored in the persisted data volume, so they remain available after rebuilding the container.

## Tips

- If you use VS Code, uncomment the `remoteEnv` block in `devcontainer.json` to open `$EDITOR`/`$VISUAL`/`$GIT_EDITOR` (e.g. `git commit`) in a VS Code tab.


---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/bare-devcontainer/templates/blob/main/src/mise/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
