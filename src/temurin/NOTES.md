## Getting Started

See [Getting Started](https://github.com/bare-devcontainer/templates#getting-started) in the repository README for how to apply this template.

## Image Variants

The `imageVariant` option selects the tag of the `ghcr.io/bare-devcontainer/temurin` base image, which pairs a Java feature release with a Debian release: `trixie` is Debian 13 and `bookworm` is Debian 12.

The values offered when applying the template are proposals, not a closed list — any published tag can be entered, including narrower ones such as a full JDK version or a dated build for tighter pinning. See the [published tags](https://github.com/orgs/bare-devcontainer/packages/container/package/temurin) for what is currently available.

## Security Hardening

This template applies the shared hardening defaults of Bare Dev Container Templates:

- Builds on `ghcr.io/bare-devcontainer/temurin`, a minimal image from [bare-devcontainer/images](https://github.com/bare-devcontainer/images) with pinned digests, SLSA provenance, and an SPDX SBOM for supply-chain transparency.
- Runs as the non-root `dev` user.
- Drops all Linux capabilities (`--cap-drop=ALL`) and sets the `no-new-privileges` security option, so processes cannot gain elevated privileges inside the container. Remove `no-new-privileges` from `securityOpt` if you need `su`/`sudo`.
- Starts an init process (`"init": true`) to reap zombie processes.

After applying the template, we recommend pinning the image to a digest so every rebuild uses exactly the image you expect — see [Pinning Images to a Digest](https://github.com/bare-devcontainer/templates#pinning-images-to-a-digest).

## Usage Notes

The [Eclipse Temurin](https://adoptium.net/temurin/) JDK is the only Java tooling in the image: `JAVA_HOME` is set, the JDK commands are on `PATH`, and the JDK's trust store is the system CA store, so certificates added with `update-ca-certificates` are trusted by Java too.

There is no Maven and no Gradle, because a project's own wrapper installs the version the project pins:

```sh
./mvnw verify     # Maven, via .mvn/wrapper/maven-wrapper.properties
./gradlew build   # Gradle, via gradle/wrapper/gradle-wrapper.properties
```

Both wrappers download their build tool on first use into the volumes below, so later rebuilds of the same container already have it. [Gradle documents the wrapper as the recommended way to run a build](https://docs.gradle.org/current/userguide/gradle_wrapper.html), and [Maven ships one as an official project](https://maven.apache.org/tools/wrapper/); `mvn wrapper:wrapper` and `gradle wrapper` generate them for a project that has none.

For a project that cannot use a wrapper, add the build tool through a Dev Container Feature, with `version` set to `none` so the feature does not install a second JDK next to the one the image ships:

```json
"features": {
  "ghcr.io/devcontainers/features/java:1": {
    "version": "none",
    "installMaven": true
  }
}
```

One feature release is installed per image tag, so a project that needs a different one selects it with `imageVariant` rather than at runtime.

## Persistent Caches

Maven and Gradle keep both their downloaded dependencies and the build tool their wrapper installed under the home directory, so each is persisted whole in a named volume:

| Volume | Mount path | Purpose |
|--------|------------|---------|
| `${devcontainerId}-temurin-m2` | `/home/dev/.m2` | Maven local repository and the distribution `mvnw` downloads |
| `${devcontainerId}-temurin-gradle` | `/home/dev/.gradle` | Gradle dependency and build caches, and the distribution `gradlew` downloads |

## Editor Integration

- Installs the `vscjava.vscode-java-pack` VS Code extension pack (language support, debugger, test runner, Maven, and project manager), with format-on-save enabled for Java files.
- The language server finds the JDK through `JAVA_HOME`, so no path has to be configured, and it runs on the JRE the extension bundles rather than one it downloads.
- Forks of VS Code (Cursor, Windsurf, VSCodium, code-server) read the same `customizations.vscode` block, but resolve extension IDs against [Open VSX](https://open-vsx.org/) rather than the Visual Studio Marketplace, where availability depends on the publisher having opted in.
- IntelliJ IDEA and other JetBrains IDEs open this `devcontainer.json` directly and supply their own Java support; nothing in the template is specific to VS Code.
- Editors without dev container integration (Neovim, Helix, Emacs, ...) can attach to the running container with `devcontainer exec --workspace-folder . <command>` and use the tooling in the image directly: the JDK commands at `$JAVA_HOME/bin`.

## Tips

- If you use VS Code, uncomment the `remoteEnv` block in `devcontainer.json` to open `$EDITOR`/`$VISUAL`/`$GIT_EDITOR` (e.g. `git commit`) in a VS Code tab.
- To download the project's dependencies when the container is created rather than on first build, add the wrapper's offline goal to `devcontainer.json`, for example `"postCreateCommand": "./mvnw -B dependency:go-offline"`.
- To debug an application running in the container, start it with a JDWP listener (`java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005 ...`) and attach the editor to that port; no extra Linux capability is needed.
