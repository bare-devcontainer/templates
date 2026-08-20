FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:67c512619e72dcf2f41a86b21a0943178fb134cb1cdc35d697c0d74f454e4f23

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

