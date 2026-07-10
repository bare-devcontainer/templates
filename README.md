# Bare Dev Container Templates

Minimal, secure, and bloat-free Dev Container templates for various technology stacks.

Each template is built on top of [Bare Dev Container Images] — minimal base images with a reduced attack surface that receive regular security updates. See the [Bare Dev Container Images] repository for details on the design goals and security verification.

## Goals

- **Supply-chain security** — built on [Bare Dev Container Images], which limit trusted upstreams to official sources to minimize supply-chain risk.
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
| [Bun](src/bun) | `ghcr.io/bare-devcontainer/templates/bun` | A JavaScript/TypeScript development environment based on the bare-devcontainer Bun image, with the Bun runtime installed. |
| [Debian](src/debian) | `ghcr.io/bare-devcontainer/templates/debian` | A minimal Debian development environment based on the bare-devcontainer Debian image. |
| [Go](src/golang) | `ghcr.io/bare-devcontainer/templates/golang` | A Go development environment based on the bare-devcontainer Go image. |
| [mise](src/mise) | `ghcr.io/bare-devcontainer/templates/mise` | A development environment with mise (polyglot runtime manager) on Debian, for managing multiple language runtimes per project. |
| [Node.js](src/node) | `ghcr.io/bare-devcontainer/templates/node` | A Node.js development environment based on the bare-devcontainer Node.js image. |
| [Rust](src/rust) | `ghcr.io/bare-devcontainer/templates/rust` | A Rust development environment based on the bare-devcontainer Rust image, with Rust installed via rustup. |
| [Terraform](src/terraform) | `ghcr.io/bare-devcontainer/templates/terraform` | An infrastructure-as-code development environment based on the bare-devcontainer Terraform image, with the Terraform CLI and terraform-ls installed. |
| [uv](src/uv) | `ghcr.io/bare-devcontainer/templates/uv` | A Python development environment based on the bare-devcontainer uv image, with uv installed for managing Python versions and packages. |
| [Zig](src/zig) | `ghcr.io/bare-devcontainer/templates/zig` | A Zig development environment based on the bare-devcontainer Zig image. |

## License

[MIT](LICENSE)

[Bare Dev Container Images]: https://github.com/bare-devcontainer/images
