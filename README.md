# Bare Dev Container Templates

Minimal, secure, and bloat-free Dev Container templates for various technology stacks.

Each template is built on top of [Bare Dev Container Images] — minimal base images with a reduced attack surface that receive regular security updates. See the [Bare Dev Container Images] repository for details on the design goals and security verification.

## Getting Started

### VS Code

Open the Command Palette (<kbd>F1</kbd>) and run **Dev Containers: Add Dev Container Configuration Files...**. Choose **Show All Definitions...**, then search for `Bare Dev Container` to browse the available templates.

### devcontainer CLI

```sh
devcontainer templates apply --template-id ghcr.io/bare-devcontainer/templates/<template-name>
```

Replace `<template-name>` with one of the names from the [Templates](#templates) section below.

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
