FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:796f9fbbd9e74f9601b0ae793caff5bb6ef59d1ac1d35a1d0280078dd60f101c

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

