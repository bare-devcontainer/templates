# Bare Dev Container Templates

Development containers are part of the trusted development environment, yet unverified base images, excessive privileges, and costly rebuilds can expand both software supply-chain and runtime risk—and delay the adoption of security updates.

Bare Dev Container Templates offers opinionated, ready-to-use configurations built on [Bare Dev Container Images]. They combine hardened defaults, persistent toolchain caches, and stack-specific editor integration so projects can rebuild frequently without sacrificing day-to-day usability.

## Goals

- **Supply-chain security** — built on [Bare Dev Container Images], which limit trusted upstreams to official sources to minimize supply-chain risk.
- **Security hardening** — each template follows container security best practices such as running as a non-root user and restricting container privileges, minimizing the attack surface of the development environment.
- **Fast, frequent rebuilds** — each toolchain's primary cache directories are persisted as volumes, so rebuilding to pick up security updates doesn't require re-downloading or recompiling dependencies.
- **Out-of-the-box editor support** — compilers/toolchains are paired with the relevant LSP and official VS Code extensions/settings, so the environment is ready to use immediately.

## Getting Started

### VS Code

Open the Command Palette (<kbd>F1</kbd>) and run **Dev Containers: Add Dev Container Configuration Files...**. Choose **Show All Definitions...**, then search for `Bare Dev Container` to browse the available templates.

### devcontainer CLI

```sh
devcontainer templates apply --template-id ghcr.io/bare-devcontainer/templates/<template-name>
```

Replace `<template-name>` with one of the names from the [Templates](#templates) section below.

## Pinning Images to a Digest

After applying a template, we recommend pinning the `image` in your `.devcontainer/devcontainer.json` to a specific digest:

```json
"image": "ghcr.io/bare-devcontainer/debian:trixie@sha256:<digest>"
```

VS Code does not re-pull a tag-only image on **Rebuild Container** or **Rebuild Container Without Cache**, so updates pushed under the same tag are silently ignored ([open issue](https://github.com/microsoft/vscode-remote-release/issues/7104)). A digest-pinned reference ensures each rebuild uses exactly the image you expect.

If you use [Renovate](https://docs.renovatebot.com/) or Dependabot, they can automatically update digest-pinned image references when a new image is published.

## Templates

| Template | Registry | Description |
|----------|----------|-------------|
| [Bun](src/bun) | `ghcr.io/bare-devcontainer/templates/bun` | Security-focused Bun dev container for JS/TS with hardened defaults and cached installs. |
| [Debian](src/debian) | `ghcr.io/bare-devcontainer/templates/debian` | Security-focused minimal Debian base for any stack, with hardened container defaults. |
| [Go](src/golang) | `ghcr.io/bare-devcontainer/templates/golang` | Security-focused Go dev container with hardened defaults and rebuild-friendly caches. |
| [mise](src/mise) | `ghcr.io/bare-devcontainer/templates/mise` | Security-focused mise dev container for multiple runtimes, with rebuild-friendly caches. |
| [Node.js](src/node) | `ghcr.io/bare-devcontainer/templates/node` | Security-focused Node.js dev container for JS/TS with hardened, non-root defaults. |
| [Rust](src/rust) | `ghcr.io/bare-devcontainer/templates/rust` | Security-focused Rust dev container with rust-analyzer and persistent Cargo caches. |
| [Terraform](src/terraform) | `ghcr.io/bare-devcontainer/templates/terraform` | Security-focused Terraform dev container with terraform-ls and rebuild-friendly caching. |
| [uv](src/uv) | `ghcr.io/bare-devcontainer/templates/uv` | Security-focused Python dev container with uv, hardened defaults, and cached packages. |
| [Zig](src/zig) | `ghcr.io/bare-devcontainer/templates/zig` | Security-focused Zig dev container with zls integration and a persistent build cache. |

## License

[MIT](LICENSE)

[Bare Dev Container Images]: https://github.com/bare-devcontainer/images
