## Base Image

This template builds on `ghcr.io/bare-devcontainer/node`, a minimal Debian-based image from [bare-devcontainer/images](https://github.com/bare-devcontainer/images) that ships the Node.js runtime and installs only what that stack needs from official upstreams, with pinned digests, SLSA provenance, and an SPDX SBOM for supply-chain transparency.

## Security Hardening

This template applies the shared hardening defaults of Bare Dev Container Templates:

- Runs as the non-root `dev` user.
- Drops all Linux capabilities (`--cap-drop=ALL`) and sets the `no-new-privileges` security option, so processes cannot gain elevated privileges inside the container. Remove `no-new-privileges` from `securityOpt` if you need `su`/`sudo`.
- Starts an init process (`"init": true`) to reap zombie processes.

After applying the template, we recommend pinning the image to a digest so every rebuild uses exactly the image you expect — see [Pinning Images to a Digest](https://github.com/bare-devcontainer/templates#pinning-images-to-a-digest).

## Tips

- To keep npm's download cache across container rebuilds, add a named volume to `mounts` in `devcontainer.json`:

  ```json
  {
    "source": "${devcontainerId}-npm-cache",
    "target": "/home/dev/.npm",
    "type": "volume"
  }
  ```

- If you use VS Code, uncomment the `remoteEnv` block in `devcontainer.json` to open `$EDITOR`/`$VISUAL`/`$GIT_EDITOR` (e.g. `git commit`) in a VS Code tab.
