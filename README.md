# Bare Dev Container Images

Minimal, secure, and bloat-free Dev Container templates for various technology stacks. 

It uses [Bare Dev Container Images](https://github.com/bare-devcontainer/images) as the base image for each template. See the [Bare Dev Container Images] repository for more information on the design and goals of these images.

## Templates

| Template | Registry | Description |
|----------|----------|-------------|
| [Debian](src/debian) | `ghcr.io/bare-devcontainer/templates/debian` | A minimal Debian development environment based on the bare-devcontainer Debian image. |
| [Go](src/golang) | `ghcr.io/bare-devcontainer/templates/golang` | A Go development environment based on the bare-devcontainer Go image. |
| [mise](src/mise) | `ghcr.io/bare-devcontainer/templates/mise` | A development environment with mise (polyglot runtime manager) on Debian, for managing multiple language runtimes per project. |
| [Rust](src/rust) | `ghcr.io/bare-devcontainer/templates/rust` | A Rust development environment based on the bare-devcontainer Rust image, with Rust installed via rustup. |
| [Zig](src/zig) | `ghcr.io/bare-devcontainer/templates/zig` | A Zig development environment based on the bare-devcontainer Zig image. |

## License

[MIT](LICENSE)

[Bare Dev Container Images]: https://github.com/bare-devcontainer/images