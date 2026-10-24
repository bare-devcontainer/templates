FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:e98de79483b510e575f6a44b79394771b173c61322d2d0bd8d13050183ea4d90

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

