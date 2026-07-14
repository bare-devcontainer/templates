## Security Hardening

This template applies the shared hardening defaults of Bare Dev Container Templates:

- Runs as the non-root `dev` user.
- Drops all Linux capabilities (`--cap-drop=ALL`) and sets the `no-new-privileges` security option, so processes cannot gain elevated privileges inside the container. Remove `no-new-privileges` from `securityOpt` if you need `su`/`sudo`.
- Starts an init process (`"init": true`) to reap zombie processes.
- The base image `ghcr.io/bare-devcontainer/debian` is a minimal [Bare Dev Container Image](https://github.com/bare-devcontainer/images) that limits trusted upstreams to official sources to reduce supply-chain risk.

After applying the template, we recommend pinning the image to a digest so every rebuild uses exactly the image you expect — see [Pinning Images to a Digest](https://github.com/bare-devcontainer/templates#pinning-images-to-a-digest).

## Usage Notes

This template is a minimal Debian base for any development stack — no language toolchain is preinstalled. To add tooling, you can:

- layer [Dev Container Features](https://containers.dev/features) on top of the image,
- extend the image with your own `Dockerfile`, or
- switch to a stack-specific Bare Dev Container template (Go, Rust, Node.js, ...).

## Tips

- If you use VS Code, uncomment the `remoteEnv` block in `devcontainer.json` to open `$EDITOR`/`$VISUAL`/`$GIT_EDITOR` (e.g. `git commit`) in a VS Code tab.
