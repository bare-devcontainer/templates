FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:7e65cc30bcabd3fc173a0ced554dc0d38014fe6f8d1c4fbfcc107bf16659e5fa

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
