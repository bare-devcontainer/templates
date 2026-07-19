
# Bun (bun)

Security-focused Bun dev container for JS/TS with hardened defaults and cached installs.

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| imageVariant | Bun version and Debian version | string | 1-trixie |

## Getting Started

See [Getting Started](https://github.com/bare-devcontainer/templates#getting-started) in the repository README for how to apply this template.

## Security Hardening

This template applies the shared hardening defaults of Bare Dev Container Templates:

- Builds on `ghcr.io/bare-devcontainer/bun`, a minimal image from [bare-devcontainer/images](https://github.com/bare-devcontainer/images) with pinned digests, SLSA provenance, and an SPDX SBOM for supply-chain transparency.
- Runs as the non-root `dev` user.
- Drops all Linux capabilities (`--cap-drop=ALL`) and sets the `no-new-privileges` security option, so processes cannot gain elevated privileges inside the container. Remove `no-new-privileges` from `securityOpt` if you need `su`/`sudo`.
- Starts an init process (`"init": true`) to reap zombie processes.

After applying the template, we recommend pinning the image to a digest so every rebuild uses exactly the image you expect — see [Pinning Images to a Digest](https://github.com/bare-devcontainer/templates#pinning-images-to-a-digest).

## Persistent Caches

Bun's global install cache is persisted in a named volume, so rebuilding the container to pick up image updates doesn't require re-downloading packages:

| Volume | Mount path | Purpose |
|--------|------------|---------|
| `${devcontainerId}-bun-install-cache` | `/home/dev/.bun/install/cache` | Bun's global install cache |

## Editor Integration

- Installs the `oven.bun-vscode` VS Code extension, with `bun.runtime` preconfigured to the Bun binary shipped in the image (`/usr/local/bin/bun`).

## Tips

- If you use VS Code, uncomment the `remoteEnv` block in `devcontainer.json` to open `$EDITOR`/`$VISUAL`/`$GIT_EDITOR` (e.g. `git commit`) in a VS Code tab.


---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/bare-devcontainer/templates/blob/main/src/bun/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
