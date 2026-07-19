
# Python (uv) (uv)

Security-focused Python dev container with uv, hardened defaults, and cached packages.

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| imageVariant | Debian version | string | trixie |

## Getting Started

See [Getting Started](https://github.com/bare-devcontainer/templates#getting-started) in the repository README for how to apply this template.

## Security Hardening

This template applies the shared hardening defaults of Bare Dev Container Templates:

- Builds on `ghcr.io/bare-devcontainer/uv`, a minimal image from [bare-devcontainer/images](https://github.com/bare-devcontainer/images) with pinned digests, SLSA provenance, and an SPDX SBOM for supply-chain transparency.
- Runs as the non-root `dev` user.
- Drops all Linux capabilities (`--cap-drop=ALL`) and sets the `no-new-privileges` security option, so processes cannot gain elevated privileges inside the container. Remove `no-new-privileges` from `securityOpt` if you need `su`/`sudo`.
- Starts an init process (`"init": true`) to reap zombie processes.

After applying the template, we recommend pinning the image to a digest so every rebuild uses exactly the image you expect — see [Pinning Images to a Digest](https://github.com/bare-devcontainer/templates#pinning-images-to-a-digest).

## Persistent Caches

uv's cache is persisted in a named volume, so Python interpreters and packages downloaded by uv survive container rebuilds:

| Volume | Mount path | Purpose |
|--------|------------|---------|
| `${devcontainerId}-uv-cache` | `/home/dev/.cache/uv` | uv's cache of downloaded Python interpreters and packages |

## Usage Notes

[uv](https://docs.astral.sh/uv/) manages Python versions, virtual environments, and packages. For example:

```sh
uv python install 3.13   # install a Python interpreter
uv venv                  # create a virtual environment
uv sync                  # install project dependencies
```

## Editor Integration

- Installs the `ms-python.python` and `charliermarsh.ruff` VS Code extensions, with Ruff as the default formatter and fix-all/organize-imports run on save for Python files.

## Tips

- If you use VS Code, uncomment the `remoteEnv` block in `devcontainer.json` to open `$EDITOR`/`$VISUAL`/`$GIT_EDITOR` (e.g. `git commit`) in a VS Code tab.


---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/bare-devcontainer/templates/blob/main/src/uv/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
