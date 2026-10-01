FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:d1c6fdbfaa12a2bbdf55a11a730f0fdc2405f16ea9ab3a3cde2c561e21bb7efd

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

