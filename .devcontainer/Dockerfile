FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:c05f04d17975f23f6bd2f72a4eb462d5edced42c6806f824be5bc4d0b94a0af3

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
