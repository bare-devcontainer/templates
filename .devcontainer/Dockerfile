FROM ghcr.io/bare-devcontainer/debian:trixie-20260629@sha256:8e6158b58da587db09cbefc5d9779c5cead15b58e83dc6013e157b7459124448

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
