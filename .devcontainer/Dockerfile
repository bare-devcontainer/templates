FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:76a3dc7c2632fe8a87ddba139cc64b53eb31ba04c698e6c62a83e0c23b2917b7

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

