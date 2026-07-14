## Security Hardening

This template applies the shared hardening defaults of Bare Dev Container Templates:

- Runs as the non-root `dev` user.
- Drops all Linux capabilities (`--cap-drop=ALL`) and sets the `no-new-privileges` security option, so processes cannot gain elevated privileges inside the container. Remove `no-new-privileges` from `securityOpt` if you need `su`/`sudo`.
- Starts an init process (`"init": true`) to reap zombie processes.
- The base image `ghcr.io/bare-devcontainer/rust` is a minimal [Bare Dev Container Image](https://github.com/bare-devcontainer/images) that limits trusted upstreams to official sources to reduce supply-chain risk.

After applying the template, we recommend pinning the image to a digest so every rebuild uses exactly the image you expect — see [Pinning Images to a Digest](https://github.com/bare-devcontainer/templates#pinning-images-to-a-digest).

## Persistent Caches

Cargo's registry and git caches are persisted in named volumes, so rebuilding the container to pick up image updates doesn't require re-downloading crates:

| Volume | Mount path | Purpose |
|--------|------------|---------|
| `${devcontainerId}-rust-cargo-registry` | `/home/dev/.cargo/registry` | Cargo registry cache |
| `${devcontainerId}-rust-cargo-git` | `/home/dev/.cargo/git` | Cargo's cache of git-sourced dependencies |

Only `registry/` and `git/` are mounted; `~/.cargo/bin` is intentionally left in the image layer so the toolchain binaries always come from the image.

## Editor Integration

- Installs the `rust-lang.rust-analyzer` VS Code extension, with format-on-save enabled for Rust files.

## Tips

- To use the debugger, uncomment `"capAdd": ["SYS_PTRACE"]` in `devcontainer.json`.
- If you use VS Code, uncomment the `remoteEnv` block in `devcontainer.json` to open `$EDITOR`/`$VISUAL`/`$GIT_EDITOR` (e.g. `git commit`) in a VS Code tab.
