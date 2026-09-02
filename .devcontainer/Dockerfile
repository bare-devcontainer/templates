FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:d26c114a2b80d9adf882355b18b0bb4ef17cbf3d0424612962e7dc485d178d69

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

