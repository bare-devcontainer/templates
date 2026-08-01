## Getting Started

See [Getting Started](https://github.com/bare-devcontainer/templates#getting-started) in the repository README for how to apply this template.

## Image Variants

The `imageVariant` option selects the tag of the `ghcr.io/bare-devcontainer/debian` base image, which tracks the Debian release: `trixie` is Debian 13 and `bookworm` is Debian 12.

The values offered when applying the template are proposals, not a closed list — any published tag can be entered, including date-stamped builds for tighter pinning. See the [published tags](https://github.com/orgs/bare-devcontainer/packages/container/package/debian) for what is currently available.

## Security Hardening

This template applies the shared hardening defaults of Bare Dev Container Templates:

- Builds on `ghcr.io/bare-devcontainer/debian`, a minimal image from [bare-devcontainer/images](https://github.com/bare-devcontainer/images) with pinned digests, SLSA provenance, and an SPDX SBOM for supply-chain transparency.
- Runs as the non-root `dev` user.
- Drops all Linux capabilities (`--cap-drop=ALL`) and sets the `no-new-privileges` security option, so processes cannot gain elevated privileges inside the container. Remove `no-new-privileges` from `securityOpt` if you need `su`/`sudo`.
- Starts an init process (`"init": true`) to reap zombie processes.

After applying the template, we recommend pinning the image to a digest so every rebuild uses exactly the image you expect — see [Pinning Images to a Digest](https://github.com/bare-devcontainer/templates#pinning-images-to-a-digest).

## Usage Notes

This template is a minimal Debian base for any development stack — no language toolchain is preinstalled. To add tooling, you can:

- layer [Dev Container Features](https://containers.dev/features) on top of the image,
- extend the image with your own `Dockerfile`, or
- switch to a stack-specific Bare Dev Container template (Go, Rust, Node.js, ...).

## Tips

- If you use VS Code, uncomment the `remoteEnv` block in `devcontainer.json` to open `$EDITOR`/`$VISUAL`/`$GIT_EDITOR` (e.g. `git commit`) in a VS Code tab.
