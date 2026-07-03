# Repository Guidelines

This repository publishes dev container templates for use with the [Dev Containers specification](https://containers.dev/), published to `ghcr.io/bare-devcontainer/templates`.

```
src/
  <template-name>/
    devcontainer-template.json   # template metadata: id, name, description, options
    .devcontainer/
      devcontainer.json          # dev container config using the template's image
.github/workflows/
  release.yml                   # publishes templates to GHCR
  test.yml                      # verifies templates build and start using the devcontainer CLI
.devcontainer/                  # dev container for working in this repo
renovate.jsonc                  # Renovate config
```

- Each template under `src/` corresponds to a `ghcr.io/bare-devcontainer/<image>` base image.
- Templates should follow the [Dev Container Template specification](https://containers.dev/implementors/templates/).
- Use English for all documentation and comments.
