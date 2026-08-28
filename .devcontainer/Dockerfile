FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:d3597f0468b586e8a6ce747be3a276383cb3ea23fde8200f802a40b7db056ba4

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

