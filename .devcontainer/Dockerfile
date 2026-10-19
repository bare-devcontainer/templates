FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:15ee1d9c3e329721b6daad8b9a6da154be55301699b54502df003048c85d1bca

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

