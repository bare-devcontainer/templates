## Security Hardening

This template applies the shared hardening defaults of Bare Dev Container Templates:

- Runs as the non-root `dev` user.
- Drops all Linux capabilities (`--cap-drop=ALL`) and sets the `no-new-privileges` security option, so processes cannot gain elevated privileges inside the container. Remove `no-new-privileges` from `securityOpt` if you need `su`/`sudo`.
- Starts an init process (`"init": true`) to reap zombie processes.
- The base image `ghcr.io/bare-devcontainer/terraform` is a minimal [Bare Dev Container Image](https://github.com/bare-devcontainer/images) that limits trusted upstreams to official sources to reduce supply-chain risk.

After applying the template, we recommend pinning the image to a digest so every rebuild uses exactly the image you expect — see [Pinning Images to a Digest](https://github.com/bare-devcontainer/templates#pinning-images-to-a-digest).

## Persistent Caches

The Terraform plugin cache directory is persisted in a named volume, so rebuilding the container to pick up image updates doesn't require re-downloading providers:

| Volume | Mount path | Purpose |
|--------|------------|---------|
| `${devcontainerId}-terraform-plugin-cache` | `/home/dev/.terraform.d/plugin-cache` | Terraform provider plugin cache |

## Editor Integration

- Installs the `hashicorp.terraform` and `hashicorp.hcl` VS Code extensions, with the language server paths preconfigured to the `terraform-ls` and `terraform` binaries shipped in the image, and format-on-save enabled for `.tf` and `.tfvars` files.

## Tips

- If you use VS Code, uncomment the `remoteEnv` block in `devcontainer.json` to open `$EDITOR`/`$VISUAL`/`$GIT_EDITOR` (e.g. `git commit`) in a VS Code tab.
