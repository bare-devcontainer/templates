FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:915342f691d949ad8a83177f49b9ec5cb377557ce7ad4dd746f08395072898a4

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

