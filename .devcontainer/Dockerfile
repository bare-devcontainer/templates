FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:a015619bff26065dcbdacde9e381750d9c41419a865f88154a309fe510761053

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

