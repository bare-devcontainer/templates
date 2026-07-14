## Security Hardening

This template applies the shared hardening defaults of Bare Dev Container Templates:

- Runs as the non-root `dev` user.
- Drops all Linux capabilities (`--cap-drop=ALL`) and sets the `no-new-privileges` security option, so processes cannot gain elevated privileges inside the container. Remove `no-new-privileges` from `securityOpt` if you need `su`/`sudo`.
- Starts an init process (`"init": true`) to reap zombie processes.
- The base image `ghcr.io/bare-devcontainer/mise` is a minimal [Bare Dev Container Image](https://github.com/bare-devcontainer/images) that limits trusted upstreams to official sources to reduce supply-chain risk.

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
