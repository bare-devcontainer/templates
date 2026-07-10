FROM ghcr.io/bare-devcontainer/debian:trixie-20260710@sha256:ee518cc92fadb9505d4b632edb131f5ae28706d8e6e49785182a40f70bc00392

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
