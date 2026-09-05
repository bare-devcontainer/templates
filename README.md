# Bare Dev Container Templates

Opinionated [dev container](https://containers.dev/) configurations built on [Bare Dev Container Images], combining hardened defaults, persistent toolchain caches, and stack-specific editor integration.

Development containers are part of the trusted development environment, yet unverified base images, excessive privileges, and costly rebuilds can expand both software supply-chain and runtime risk—and delay the adoption of security updates. These templates are designed so that projects can rebuild frequently, and pick up security updates promptly, without sacrificing day-to-day usability.

## Goals

- **Supply-chain security** — built on [Bare Dev Container Images], which limit trusted upstreams to official sources to minimize supply-chain risk.
- **Security hardening** — each template follows container security best practices such as running as a non-root user and restricting container privileges, minimizing the attack surface of the development environment.
- **Fast, frequent rebuilds** — each toolchain's primary cache directories are persisted as volumes, so rebuilding to pick up security updates doesn't require re-downloading or recompiling dependencies.
- **Out-of-the-box editor support** — compilers/toolchains are paired with the relevant LSP and official VS Code extensions/settings, so the environment is ready to use immediately.

## Templates

Each template targets a single toolchain and corresponds to one `ghcr.io/bare-devcontainer/<image>` base image. If your stack isn't listed — or you prefer to compose your own with [Dev Container Features](https://containers.dev/features) — start with **Debian**.

| Template | Registry | Description |
|----------|----------|-------------|
| [Bun](src/bun) | `ghcr.io/bare-devcontainer/templates/bun` | Security-focused Bun dev container for JS/TS with hardened defaults and cached installs. |
| [Debian](src/debian) | `ghcr.io/bare-devcontainer/templates/debian` | Security-focused minimal Debian base for any stack, with hardened, non-root defaults. |
| [Deno](src/deno) | `ghcr.io/bare-devcontainer/templates/deno` | Security-focused Deno dev container for JS/TS with hardened defaults and cached modules. |
| [Go](src/golang) | `ghcr.io/bare-devcontainer/templates/golang` | Security-focused Go dev container with hardened defaults and rebuild-friendly caches. |
| [mise](src/mise) | `ghcr.io/bare-devcontainer/templates/mise` | Security-focused mise dev container for multiple runtimes, with cached tool installs. |
| [Node.js](src/node) | `ghcr.io/bare-devcontainer/templates/node` | Security-focused Node.js dev container for JS/TS with non-root defaults and Corepack. |
| [OpenTofu](src/opentofu) | `ghcr.io/bare-devcontainer/templates/opentofu` | Security-focused OpenTofu dev container with tofu-ls and a plugin cache volume. |
| [Node.js (pnpm)](src/pnpm) | `ghcr.io/bare-devcontainer/templates/pnpm` | Security-focused pnpm dev container for JS/TS with pnpm-managed Node.js and caches. |
| [Rust](src/rustup) | `ghcr.io/bare-devcontainer/templates/rustup` | Security-focused Rust dev container with rust-analyzer and persistent Cargo caches. |
| [Terraform](src/terraform) | `ghcr.io/bare-devcontainer/templates/terraform` | Security-focused Terraform dev container with terraform-ls and a plugin cache volume. |
| [Python (uv)](src/uv) | `ghcr.io/bare-devcontainer/templates/uv` | Security-focused Python dev container with uv, hardened defaults, and cached packages. |
| [Zig](src/zig) | `ghcr.io/bare-devcontainer/templates/zig` | Security-focused Zig dev container with zls integration and a persistent build cache. |

Each template page documents its options, security defaults, persisted caches, and editor integration.

## Getting Started

These templates follow the [Dev Container specification](https://containers.dev/implementors/spec/), so they can be applied and opened with any [tool that supports dev containers](https://containers.dev/supporting). Two common ways to apply one:

### VS Code

Open the Command Palette (<kbd>F1</kbd>) and run **Dev Containers: Add Dev Container Configuration Files...**. Choose **Show All Definitions...**, then search for `Bare Dev Container` to browse the available templates.

Once the configuration files are added, run **Dev Containers: Reopen in Container** to build and start the container.

### devcontainer CLI

```sh
devcontainer templates apply --template-id ghcr.io/bare-devcontainer/templates/<template-name>
devcontainer up --workspace-folder .
```

Replace `<template-name>` with one of the names from the [Templates](#templates) section above.

## What You Get

Applying a template writes a `.devcontainer/devcontainer.json` into your project — nothing else is installed, and there is no runtime dependency on this repository. For example, the uv template produces (comments and editor settings trimmed):

```json
{
  "name": "Python (uv)",
  "image": "ghcr.io/bare-devcontainer/uv:trixie",
  "remoteUser": "dev",
  "runArgs": ["--cap-drop=ALL"],
  "securityOpt": ["no-new-privileges"],
  "init": true,
  "mounts": [
    {
      "source": "${devcontainerId}-uv-cache",
      "target": "/home/dev/.cache/uv",
      "type": "volume"
    }
  ],
  "customizations": {
    "vscode": {
      "extensions": ["ms-python.python", "charliermarsh.ruff"]
    }
  }
}
```

Each part maps to one of the goals above:

- `image` references a base image from [Bare Dev Container Images], a separate repository that builds minimal images with pinned digests, SLSA provenance, and an SPDX SBOM. This repository ships configuration only; what is installed inside the container is documented there.
- `remoteUser`, `runArgs`, `securityOpt`, and `init` are the shared hardening defaults, applied identically by every template.
- `mounts` persists the toolchain's cache directories in named volumes, so rebuilding to pick up an image update doesn't re-download dependencies.
- `customizations` pairs the toolchain with the relevant extensions and settings, so the editor is ready to use on first open.

The generated file is yours to edit — it is a plain dev container configuration, so you can layer [Features](https://containers.dev/features), add mounts, or relax any of the defaults.

## Pinning Images to a Digest

After applying a template, we recommend pinning the `image` in your `.devcontainer/devcontainer.json` to a specific digest:

```json
"image": "ghcr.io/bare-devcontainer/debian:trixie@sha256:<digest>"
```

VS Code does not re-pull a tag-only image on **Rebuild Container** or **Rebuild Container Without Cache**, so updates pushed under the same tag are silently ignored ([open issue](https://github.com/microsoft/vscode-remote-release/issues/7104)). A digest-pinned reference ensures each rebuild uses exactly the image you expect.

If you use [Renovate](https://docs.renovatebot.com/) or Dependabot, they can automatically update digest-pinned image references when a new image is published.

## License

[MIT](LICENSE)

[Bare Dev Container Images]: https://github.com/bare-devcontainer/images
