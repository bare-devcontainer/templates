FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:8997eeb0706a48888bfb073f4c7af4d4e392d2d0138e16f6bc36c8f55fa347b7

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

