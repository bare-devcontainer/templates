
# Python (uv) (uv)

Security-focused Python dev container with uv, hardened defaults, and cached packages.

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| imageVariant | Debian version (trixie = Debian 13, bookworm = Debian 12). Other published tags can be entered. | string | trixie |

## Getting Started

See [Getting Started](https://github.com/bare-devcontainer/templates#getting-started) in the repository README for how to apply this template.

## Image Variants

The `imageVariant` option selects the tag of the `ghcr.io/bare-devcontainer/uv` base image, which tracks the Debian release: `trixie` is Debian 13 and `bookworm` is Debian 12.

The values offered when applying the template are proposals, not a closed list — any published tag can be entered, including narrower ones such as a uv version or a dated build for tighter pinning. See the [published tags](https://github.com/orgs/bare-devcontainer/packages/container/package/uv) for what is currently available.

## Security Hardening

This template applies the shared hardening defaults of Bare Dev Container Templates:

- Builds on `ghcr.io/bare-devcontainer/uv`, a minimal image from [bare-devcontainer/images](https://github.com/bare-devcontainer/images) with pinned digests, SLSA provenance, and an SPDX SBOM for supply-chain transparency.
- Runs as the non-root `dev` user.
- Drops all Linux capabilities (`--cap-drop=ALL`) and sets the `no-new-privileges` security option, so processes cannot gain elevated privileges inside the container. Remove `no-new-privileges` from `securityOpt` if you need `su`/`sudo`.
- Starts an init process (`"init": true`) to reap zombie processes.

After applying the template, we recommend pinning the image to a digest so every rebuild uses exactly the image you expect — see [Pinning Images to a Digest](https://github.com/bare-devcontainer/templates#pinning-images-to-a-digest).

## Usage Notes

[uv](https://docs.astral.sh/uv/) manages Python versions, virtual environments, and packages. For example:

```sh
uv python install 3.13   # install a Python interpreter
uv venv                  # create a virtual environment
uv sync                  # install project dependencies
```

## Persistent Caches

uv's cache is persisted in a named volume, so Python interpreters and packages downloaded by uv survive container rebuilds:

| Volume | Mount path | Purpose |
|--------|------------|---------|
| `${devcontainerId}-uv-cache` | `/home/dev/.cache/uv` | uv's cache of downloaded Python interpreters and packages |

The cache volume and the bind-mounted workspace folder are different filesystems, so uv cannot hardlink packages from the cache into the project's virtual environment. The template sets `UV_LINK_MODE=copy` in `containerEnv` so uv copies them instead of warning `Failed to hardlink files; falling back to full copy` on every install.

## Editor Integration

- Installs the `ms-python.python` and `charliermarsh.ruff` VS Code extensions, with Ruff as the default formatter and fix-all/organize-imports run on save for Python files.

## Tips

- If you use VS Code, uncomment the `remoteEnv` block in `devcontainer.json` to open `$EDITOR`/`$VISUAL`/`$GIT_EDITOR` (e.g. `git commit`) in a VS Code tab.
- The `UV_LINK_MODE=copy` default above costs some time and disk space on every install. To get hardlinking back, keep uv's cache and the project environment on the same volume: mount `${devcontainerId}-uv` at `/home/dev/.uv`, and replace `UV_LINK_MODE` in `containerEnv` with `"UV_CACHE_DIR": "/home/dev/.uv/cache"` and `"UV_PROJECT_ENVIRONMENT": "/home/dev/.uv/venv"`. The environment then lives outside the workspace folder, so point your editor at `/home/dev/.uv/venv/bin/python` (`python.defaultInterpreterPath` in VS Code).


---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/bare-devcontainer/templates/blob/main/src/uv/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
