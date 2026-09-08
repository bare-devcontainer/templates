FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:1c2adc356542b1127725bc470558d3065846ae5bc717e59f171f2d4448282cac

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

