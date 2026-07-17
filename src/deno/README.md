
# Deno (deno)

Security-focused Deno dev container for JS/TS with hardened defaults and cached modules.

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| imageVariant | Deno version and Debian version | string | 2-trixie |

## Security Hardening

This template applies the shared hardening defaults of Bare Dev Container Templates:

- Runs as the non-root `dev` user.
- Drops all Linux capabilities (`--cap-drop=ALL`) and sets the `no-new-privileges` security option, so processes cannot gain elevated privileges inside the container. Remove `no-new-privileges` from `securityOpt` if you need `su`/`sudo`.
- Starts an init process (`"init": true`) to reap zombie processes.
- The base image `ghcr.io/bare-devcontainer/deno` is a minimal [Bare Dev Container Image](https://github.com/bare-devcontainer/images) that limits trusted upstreams to official sources to reduce supply-chain risk.

After applying the template, we recommend pinning the image to a digest so every rebuild uses exactly the image you expect — see [Pinning Images to a Digest](https://github.com/bare-devcontainer/templates#pinning-images-to-a-digest).

## Persistent Caches

Deno's cache directory (`DENO_DIR`) is persisted in a named volume, so rebuilding the container to pick up image updates doesn't require re-downloading remote modules or npm packages:

| Volume | Mount path | Purpose |
|--------|------------|---------|
| `${devcontainerId}-deno-cache` | `/home/dev/.cache/deno` | Deno's cache (`DENO_DIR`): remote modules and npm packages |

## Editor Integration

- Installs the `denoland.vscode-deno` VS Code extension with `deno.enable` turned on for the workspace, and `deno.path` preconfigured to the Deno binary shipped in the image (`/usr/local/bin/deno`).

## Tips

- If you use VS Code, uncomment the `remoteEnv` block in `devcontainer.json` to open `$EDITOR`/`$VISUAL`/`$GIT_EDITOR` (e.g. `git commit`) in a VS Code tab.


---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/bare-devcontainer/templates/blob/main/src/deno/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
