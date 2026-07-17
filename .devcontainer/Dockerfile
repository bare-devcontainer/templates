FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:5c3dabd547ffe662601fe6b6ba25895838b3b0a6e8301723e74fbb327e019874

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
