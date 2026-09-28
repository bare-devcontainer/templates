FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:a80a96852242093ad65f62ba1e41287a4b70acef7fbf16f319859352eab955f5

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

