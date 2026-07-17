
# Debian (debian)

Security-focused minimal Debian base for any stack, with hardened container defaults.

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| imageVariant | Debian version | string | trixie |

## Base Image

This template builds on `ghcr.io/bare-devcontainer/debian`, a minimal Debian-based image from [bare-devcontainer/images](https://github.com/bare-devcontainer/images) with no language toolchain preinstalled, installing only what a general-purpose base needs from official upstreams, with pinned digests, SLSA provenance, and an SPDX SBOM for supply-chain transparency.

## Security Hardening

This template applies the shared hardening defaults of Bare Dev Container Templates:

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


---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/bare-devcontainer/templates/blob/main/src/debian/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
