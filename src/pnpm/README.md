
# Node.js (pnpm) (pnpm)

Security-focused pnpm dev container for JS/TS with pnpm-managed Node.js and caches.

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| imageVariant | pnpm and Debian version (trixie = Debian 13, bookworm = Debian 12). Other published tags can be entered. | string | 12-trixie |

## Getting Started

See [Getting Started](https://github.com/bare-devcontainer/templates#getting-started) in the repository README for how to apply this template.

## Image Variants

The `imageVariant` option selects the tag of the `ghcr.io/bare-devcontainer/pnpm` base image, which pairs a pnpm version with a Debian release: `trixie` is Debian 13 and `bookworm` is Debian 12. The version in the tag is the version of pnpm itself — the Node.js version is chosen by the project, not by the tag.

The values offered when applying the template are proposals, not a closed list — any published tag can be entered, including narrower ones such as a pnpm patch version or a dated build for tighter pinning. See the [published tags](https://github.com/orgs/bare-devcontainer/packages/container/package/pnpm) for what is currently available.

## Security Hardening

This template applies the shared hardening defaults of Bare Dev Container Templates:

- Builds on `ghcr.io/bare-devcontainer/pnpm`, a minimal image from [bare-devcontainer/images](https://github.com/bare-devcontainer/images) with pinned digests, SLSA provenance, and an SPDX SBOM for supply-chain transparency.
- Runs as the non-root `dev` user.
- Drops all Linux capabilities (`--cap-drop=ALL`) and sets the `no-new-privileges` security option, so processes cannot gain elevated privileges inside the container. Remove `no-new-privileges` from `securityOpt` if you need `su`/`sudo`.
- Starts an init process (`"init": true`) to reap zombie processes.

After applying the template, we recommend pinning the image to a digest so every rebuild uses exactly the image you expect — see [Pinning Images to a Digest](https://github.com/bare-devcontainer/templates#pinning-images-to-a-digest).

## Usage Notes

[pnpm](https://pnpm.io/) is the only JavaScript tooling in the image: there is no Node.js runtime, no `npm`/`npx`, and no Corepack. pnpm installs the runtime instead, so the version in use is the one the project asks for rather than the one that happened to be baked into the image. For a project whose package manager is not pnpm, use the [Node.js](https://github.com/bare-devcontainer/templates/tree/main/src/node) template instead.

The image ships no `node`, and `$PNPM_HOME/bin` — where pnpm puts global binaries — starts empty, so a new container needs one global install before `node` exists at all:

```sh
pnpm runtime set node lts -g
```

That is what puts `node` on `PATH`. It is a one-time step: the runtime lands in the persisted volume below, so later rebuilds of the same container already have it.

With that done, pin the runtime per project in its `package.json`, and pnpm installs that version on first use:

```json
{
  "devEngines": {
    "runtime": { "name": "node", "version": "^24.0.0", "onFail": "download" }
  }
}
```

Inside such a project a bare `node` then runs the pinned version rather than the global one, because pnpm's global `node` is a [shim](https://pnpm.io/settings/other#globalshims) that dispatches to whatever the current project asks for. Outside any project it runs the globally installed version, which [`pnpm runtime`](https://pnpm.io/cli/runtime) sets.

`pnpm install` installs the pinned runtime along with the dependencies. To have that happen when the container is created rather than on first use, add it to `devcontainer.json`:

```json
"postCreateCommand": "pnpm install"
```

## Persistent Caches

pnpm's home directory and metadata cache are persisted in named volumes, so rebuilding the container to pick up image updates doesn't require re-downloading the runtimes and packages pnpm keeps there:

| Volume | Mount path | Purpose |
|--------|------------|---------|
| `${devcontainerId}-pnpm-home` | `/home/dev/.local/share/pnpm` | pnpm-managed runtimes, globally installed bins, and the store they are linked from |
| `${devcontainerId}-pnpm-cache` | `/home/dev/.cache/pnpm` | pnpm's metadata cache |

Where a package store lands is pnpm's decision rather than this template's, because [there is one store per disk](https://pnpm.io/settings/store#storedir) and hard links only work within a single filesystem. Global installs — the pnpm-managed runtimes and anything added with `pnpm add -g` — live on the volume above, so they are linked from the store at `$PNPM_HOME/store` and persist with it. A project in the workspace is usually on a different filesystem, bind-mounted from the host, so pnpm keeps that project's store beside it in `node_modules/.pnpm-store` and hard-links from there instead. `pnpm store path` reports the one in effect where you run it.

The consequence worth knowing is that deleting a project's `node_modules` deletes that project's store with it, so the next install re-downloads its packages. The runtimes and global bins are unaffected: they stay in the volume.

## Editor Integration

- Sets VS Code's [`npm.packageManager`](https://github.com/microsoft/vscode/blob/main/extensions/npm/README.md) to `pnpm`, so scripts and dependency installs run through pnpm instead of being guessed from the lockfiles present in the workspace.
- Forks of VS Code (Cursor, Windsurf, VSCodium, code-server) read the same `customizations.vscode` block. No extension is installed by this template — pnpm has no official one, and VS Code's built-in npm extension provides the setting above.
- Editors without dev container integration (Neovim, Helix, Emacs, ...) can attach to the running container with `devcontainer exec --workspace-folder . <command>` and use the tooling in the image directly. pnpm ships no language server, so TypeScript intelligence comes from a per-project `typescript-language-server` (`pnpm add -D typescript typescript-language-server`); `pnpm` itself is at `/usr/local/bin/pnpm`.

## Tips

- `npm` is not shipped in the image, and installing a Node.js runtime with pnpm deliberately leaves the bundled `npm` unextracted. Run `pnpm add -g npm` if a project needs it; it lands in the persisted pnpm home.
- If you use VS Code, uncomment the `remoteEnv` block in `devcontainer.json` to open `$EDITOR`/`$VISUAL`/`$GIT_EDITOR` (e.g. `git commit`) in a VS Code tab.


---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/bare-devcontainer/templates/blob/main/src/pnpm/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
