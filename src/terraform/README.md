
# Terraform (terraform)

Security-focused Terraform dev container with terraform-ls and a plugin cache volume.

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| imageVariant | Terraform and Debian version (trixie = Debian 13, bookworm = Debian 12). Other published tags can be entered. | string | 1-trixie |

## Getting Started

See [Getting Started](https://github.com/bare-devcontainer/templates#getting-started) in the repository README for how to apply this template.

## Image Variants

The `imageVariant` option selects the tag of the `ghcr.io/bare-devcontainer/terraform` base image, which pairs a Terraform version with a Debian release: `trixie` is Debian 13 and `bookworm` is Debian 12.

The values offered when applying the template are proposals, not a closed list — any published tag can be entered, including narrower ones such as a Terraform patch version or a dated build for tighter pinning. See the [published tags](https://github.com/orgs/bare-devcontainer/packages/container/package/terraform) for what is currently available.

## Security Hardening

This template applies the shared hardening defaults of Bare Dev Container Templates:

- Builds on `ghcr.io/bare-devcontainer/terraform`, a minimal image from [bare-devcontainer/images](https://github.com/bare-devcontainer/images) with pinned digests, SLSA provenance, and an SPDX SBOM for supply-chain transparency.
- Runs as the non-root `dev` user.
- Drops all Linux capabilities (`--cap-drop=ALL`) and sets the `no-new-privileges` security option, so processes cannot gain elevated privileges inside the container. Remove `no-new-privileges` from `securityOpt` if you need `su`/`sudo`.
- Starts an init process (`"init": true`) to reap zombie processes.

After applying the template, we recommend pinning the image to a digest so every rebuild uses exactly the image you expect — see [Pinning Images to a Digest](https://github.com/bare-devcontainer/templates#pinning-images-to-a-digest).

## Persistent Caches

The Terraform plugin cache directory is persisted in a named volume, so rebuilding the container to pick up image updates doesn't require re-downloading providers:

| Volume | Mount path | Purpose |
|--------|------------|---------|
| `${devcontainerId}-terraform-plugin-cache` | `/home/dev/.terraform.d/plugin-cache` | Terraform provider plugin cache |

## Editor Integration

- Installs the `hashicorp.terraform` and `hashicorp.hcl` VS Code extensions, with the language server paths preconfigured to the `terraform-ls` and `terraform` binaries shipped in the image.
- Applies the [formatting settings recommended by the Terraform extension](https://marketplace.visualstudio.com/items?itemName=hashicorp.terraform), so every Terraform language mode formats on save.

## Tips

- If you use VS Code, uncomment the `remoteEnv` block in `devcontainer.json` to open `$EDITOR`/`$VISUAL`/`$GIT_EDITOR` (e.g. `git commit`) in a VS Code tab.


---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/bare-devcontainer/templates/blob/main/src/terraform/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
